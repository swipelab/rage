import 'mx_room_previous.dart';

class MxRoomCreate {
  final String roomVersion;
  final String creator;
  final bool federate;
  final MxRoomPrevious predecessor;

  MxRoomCreate({this.roomVersion = "1", this.creator, this.predecessor, this.federate});

  static MxRoomCreate fromJson(Map<String, dynamic> json) => MxRoomCreate(
    roomVersion: json['room_version'],
    creator: json['creator'],
    federate: json['m.federate'],
    predecessor: MxRoomPrevious.fromJson(json['predecessor']),
  );
}
