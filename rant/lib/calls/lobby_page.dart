import 'package:flutter/material.dart';
import 'package:rant/experimental/signal.dart';

class LobbyPage extends StatefulWidget {
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  final String serverUrl = "ws://10.0.0.2:5000/lobby";

  List<dynamic> _peers = [];

  Call _call;

  var _selfId;

  initState() {
    super.initState();
    _connect();
  }

  _connect() async {
    if (_call == null) {
      _call = Call(this.serverUrl)..connect();
      _call.onStateChange = (SignalState state) {
        switch (state) {
          case SignalState.CallStateNew:
            {
              this.setState(() {
                //_inCalling = true;
              });
            }
            break;
          case SignalState.CallStateBye:
            {
              this.setState(() {
//                _localRenderer.srcObject = null;
//                _remoteRenderer.srcObject = null;
//                _inCalling = false;
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
      _call.onPeersUpdate = (event) {
        this.setState(() {
          _selfId = event['self'];
          _peers = event['peers'];
        });
      };

      _call.onLocalStream = (stream) {
        //_localRenderer.srcObject = stream;
      };
      _call.onAddRemoteStream = (stream) {
        //_remoteRenderer.srcObject = stream;
      };
      _call.onRemoveRemoteStream = (stream) {
        //_remoteRenderer.srcObject = null;
      };
    }
  }

  Widget buildPeer(BuildContext context, dynamic peer) {
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

  _invitePeer(context, peerId, userScreen) async {
    if(peerId == _selfId) return;
    _call?.invite(peerId, 'video', userScreen);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
                //decoration: BoxDecoration(color: Colors.bl),
                ),
            title: Text('Lobby'),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => buildPeer(context, _peers[index]),
              childCount: _peers?.length ?? 0),
        )
      ],
    ));
  }
}
