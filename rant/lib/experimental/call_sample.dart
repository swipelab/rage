import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';
import 'package:rant/experimental/signal.dart';

class CallSample extends StatefulWidget {
  String serverUrl = 'wss://rage.swipelab.co/rocket/room/swipelab';
  _CallSampleState createState() => _CallSampleState(serverUrl: serverUrl);
}

class _CallSampleState extends State<CallSample> {
  Call _signal;
  List<dynamic> _peers;
  String _selfId;
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  _CallSampleState({Key key, @required this.serverUrl});

  bool _inCalling = false;
  final String serverUrl;

  initState() {
    super.initState();
    initRenderers();
    _connect();
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

  _connect() async {
    if (_signal == null) {
      _signal = Call(this.serverUrl)..connect();
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
      Divider()
    ]);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Ranter Call')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _inCalling
            ? SizedBox(
                width: 200,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                          child: Icon(Icons.switch_camera),
                          onPressed: _switchCamera),
                      FloatingActionButton(
                          child: Icon(Icons.call_end),
                          onPressed: _hangUp,
                          backgroundColor: Colors.pink),
                      FloatingActionButton(
                          child: Icon(Icons.mic_off), onPressed: _muteMic),
                    ]))
            : null,
        body: _inCalling
            ? OrientationBuilder(builder: (context, orientation) {
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
                      top: 20,
                      left: 20,
                      child: Container(
                          width: orientation == Orientation.portrait ? 90 : 120,
                          height:
                              orientation == Orientation.portrait ? 120 : 90,
                          child: RTCVideoView(_localRenderer))),
                ]));
              })
            : ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _peers?.length ?? 0,
                itemBuilder: (context, i) => _buildPeer(context, _peers[i]),
              ));
  }
}
