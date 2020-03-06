class MxRoomAvatar {
  final String url;

  MxRoomAvatar({this.url});

  static MxRoomAvatar fromJson(Map<String, dynamic> json) => MxRoomAvatar(
        url: json['url'],
      );
}
