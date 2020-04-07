import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';

class CallView extends StatelessWidget {
  final RTCVideoRenderer local;
  final RTCVideoRenderer remote;
  final VoidCallback onSwitchCamera;
  final VoidCallback onHangUp;
  final VoidCallback onToggleMic;

  CallView({this.local, this.remote, this.onToggleMic, this.onHangUp, this.onSwitchCamera});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: RTCVideoView(remote),
                  )),
              Positioned(
                  top: 100,
                  left: 20,
                  child: Container(
                      width: orientation == Orientation.portrait ? 90 : 120,
                      height: orientation == Orientation.portrait ? 120 : 90,
                      child: RTCVideoView(local))),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 80),
                    child: SizedBox(
                        width: 240,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          FloatingActionButton(child: Icon(Icons.switch_camera), onPressed: onSwitchCamera),
                          FloatingActionButton(
                              child: Icon(Icons.call_end), onPressed: onHangUp, backgroundColor: Colors.pink),
                          FloatingActionButton(child: Icon(Icons.mic_off), onPressed: onToggleMic),
                        ])),
                  ))
            ]));
      }),
    );
  }
}
