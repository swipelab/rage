class MxClientPutRoomEventResponse {
  final String eventId;
  MxClientPutRoomEventResponse({this.eventId});

  static MxClientPutRoomEventResponse fromJson(Map<String, dynamic> json) =>
      json == null
          ? null
          : MxClientPutRoomEventResponse(
              eventId: json['event_id'],
            );
}
