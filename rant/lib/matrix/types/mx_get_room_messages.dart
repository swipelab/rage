import 'mx_event.dart';

class MxGetRoomMessages {
  final String start;
  final String end;
  final List<MxEvent> chunk;
  final List<MxEvent> state;

  MxGetRoomMessages({this.start, this.end, this.chunk, this.state});

  static MxGetRoomMessages fromJson(Map<String, dynamic> json) => MxGetRoomMessages(
        start: json['start'],
        end: json['end'],
        chunk: (json['chunk'] as List ?? []).cast<Map<String, dynamic>>().map(MxEvent.fromJson).toList(),
        state: (json['state'] as List ?? []).cast<Map<String, dynamic>>().map(MxEvent.fromJson).toList(),
      );
}
