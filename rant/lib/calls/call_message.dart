import 'call_action.dart';

class CallMessage {
  final CallAction action;
  final Map<String, dynamic> data;

  CallMessage(this.action, this.data);
}

class CallCandidate {
  final String sdpMid;
  final int sdpMLineIndex;
  final String candidate;

  CallCandidate({this.sdpMid, this.sdpMLineIndex, this.candidate});
}

class CallSession {
  final String type;
  final String sdp;

  CallSession({this.type, this.sdp});
}
