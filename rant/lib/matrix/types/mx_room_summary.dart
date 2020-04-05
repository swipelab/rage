class MxRoomSummary {
  final Map<String, dynamic> json;
  MxRoomSummary({this.json});

  static MxRoomSummary fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxRoomSummary(
          json: json,
        );
}
