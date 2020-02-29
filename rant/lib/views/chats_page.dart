import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'package:rant/experimental/signal.dart';

class ChatsPage extends StatefulWidget {
  final String rocketUrl;

  ChatsPage({@required this.rocketUrl});

  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  Call _signal;
  List<dynamic> _peers;
  String _selfId;
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  bool _inCalling = false;

  @override
  void initState() {
    super.initState();
    initRenderers();
    _connect(widget.rocketUrl);
  }

  initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  deactivate() {
    super.deactivate();
    _signal?.close();
    _localRenderer.dispose();
    _remoteRenderer.dispose();
  }

  _connect(String serverUrl) async {
    if (_signal == null) {
      _signal = Call(serverUrl)..connect();
      _signal.onStateChange = (SignalState state) {
        switch (state) {
          case SignalState.CallStateNew:
            {
              this.setState(() {
                _inCalling = true;
              });
            }
            break;
          case SignalState.CallStateBye:
            {
              this.setState(() {
                _localRenderer.srcObject = null;
                _remoteRenderer.srcObject = null;
                _inCalling = false;
              });
            }
            break;
          case SignalState.CallStateInvite:
          case SignalState.CallStateConnected:
          case SignalState.CallStateRinging:
          case SignalState.ConnectionClosed:
          case SignalState.ConnectionError:
          case SignalState.ConnectionOpen:
            break;
          default:
            break;
        }
      };
      _signal.onPeersUpdate = (event) {
        this.setState(() {
          _selfId = event['self'];
          _peers = event['peers'];
        });
      };

      _signal.onLocalStream = (stream) {
        _localRenderer.srcObject = stream;
      };
      _signal.onAddRemoteStream = (stream) {
        _remoteRenderer.srcObject = stream;
      };
      _signal.onRemoveRemoteStream = (stream) {
        _remoteRenderer.srcObject = null;
      };
    }
  }

  _invitePeer(context, peerId, userScreen) async {
    if (peerId == _selfId) return;
    _signal?.invite(peerId, 'video', userScreen);
  }

  _hangUp() {
    _signal?.bye();
  }

  _switchCamera() {
    _signal.switchCamera();
  }

  _muteMic() {}

  _buildPeer(context, peer) {
    var self = (peer['id'] == _selfId);
    return ListBody(children: <Widget>[
      ListTile(
        title: Text(self ? '*' + peer['name'] : peer['name']),
        subtitle: Text('id: ' + peer['id']),
        onTap: () => _invitePeer(context, peer['id'], false),
      ),
      Divider(height: 1)
    ]);
  }

  Widget buildCall(BuildContext context) {
    return Container();
  }

  Widget buildScaffold(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: CustomScrollView(slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('CHATS'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) => _buildPeer(context, _peers[index]),
                childCount: _peers?.length ?? 0),
          ),
          SliverFillRemaining()
        ]),
      ),
    );
  }

  Widget build(BuildContext context) {
    return _inCalling == true ? buildCall(context) : buildScaffold(context);
  }
}
