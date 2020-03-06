class MxNotification {
  final int room;

  MxNotification({this.room = 50});

  static MxNotification fromJson(Map<String, dynamic> json) => json == null ? null : MxNotification(room: json['room']);
}