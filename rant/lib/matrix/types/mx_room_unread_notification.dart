class MxRoomUnreadNotification {
  final int notificationCount;
  final int highlightCount;

  MxRoomUnreadNotification({this.notificationCount, this.highlightCount});

  static MxRoomUnreadNotification fromJson(Map<String, dynamic> json) =>
      json == null
          ? null
          : MxRoomUnreadNotification(
              highlightCount: json['highlight_count'],
              notificationCount: json['notification_count'],
            );
}
