import 'package:rant/matrix/types/mx_room_summary.dart';
import 'package:rant/util/util.dart';

import 'mx_event.dart';
import 'mx_room_unread_notification.dart';
import 'mx_timeline.dart';

class MxRoomJoin {
  final MxTimeline timeline;
  final List<MxEvent> state;
  final List<MxEvent> accountData;
  final List<MxEvent> ephemeral;
  final List<MxEvent> presence;
  final MxRoomUnreadNotification unreadNotifications;
  final MxRoomSummary summary;

  MxRoomJoin({
    this.timeline,
    this.state,
    this.accountData,
    this.ephemeral,
    this.presence,
    this.unreadNotifications,
    this.summary,
  });

  static MxRoomJoin fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxRoomJoin(
          timeline: MxTimeline.fromJson(json['timeline']),
          state: Json.list(json.at('state.events'), MxEvent.fromJson),
          accountData:
              Json.list(json.at('account_data.events'), MxEvent.fromJson),
          ephemeral: Json.list(json.at('ephemeral.events'), MxEvent.fromJson),
          presence: Json.list(json.at('presence.events'), MxEvent.fromJson),
          unreadNotifications:
              MxRoomUnreadNotification.fromJson(json['unread_notifications']),
          summary: MxRoomSummary.fromJson(json['summary']),
        );
}
