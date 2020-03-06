class MxRoomRedaction {
  final String reason;

  MxRoomRedaction({this.reason});

  static MxRoomRedaction fromJson(Map<String, dynamic> json) => MxRoomRedaction(
        reason: json['reason'],
      );
}
