class MxRoomName {
  final String name;

  MxRoomName({this.name});

  static MxRoomName fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxRoomName(
          name: json['name'],
        );
}
