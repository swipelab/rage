
class MxRoomPrevious {
  final String roomId;
  final String eventId;

  MxRoomPrevious({this.roomId, this.eventId});

  static MxRoomPrevious fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxRoomPrevious(
    roomId: json['room_id'],
    eventId: json['event_id'],
  );
}

