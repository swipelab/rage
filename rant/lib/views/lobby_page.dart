import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'package:rant/experimental/signal.dart';

class LobbyPage extends StatefulWidget {
  final String rocketUrl;

  LobbyPage({@required this.rocketUrl});

  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
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
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('SMILE...'),
        ),
        child: Container(
          child: OrientationBuilder(builder: (context, orientation) {
            return Container(
                child: Stack(children: <Widget>[
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(color: Colors.black54),
                    child: RTCVideoView(_remoteRenderer),
                  )),
              Positioned(
                  top: 100,
                  left: 20,
                  child: Container(
                      width: orientation == Orientation.portrait ? 90 : 120,
                      height: orientation == Orientation.portrait ? 120 : 90,
                      child: RTCVideoView(_localRenderer))),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: SizedBox(
                        width: 240,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          FloatingActionButton(child: Icon(Icons.switch_camera), onPressed: _switchCamera),
                          FloatingActionButton(
                              child: Icon(Icons.call_end), onPressed: _hangUp, backgroundColor: Colors.pink),
                          FloatingActionButton(child: Icon(Icons.mic_off), onPressed: _muteMic),
                        ])),
                  ))
            ]));
          }),
        ));
  }

  Widget buildScaffold(BuildContext context) {
    return CupertinoPageScaffold(
      child: Material(
        child: CustomScrollView(slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('LOBBY'),
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
