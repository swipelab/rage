import 'mx_notification.dart';
import 'mx_type.dart';

class MxRoomPowerLevels with MxType {
  String get type => 'm.room.power_levels';

  final Map<String, int> users;
  final int usersDefault;
  final Map<String, int> events;
  final int eventsDefault;
  final int stateDefault;
  final int ban;
  final int kick;
  final int redact;
  final int invite;
  final MxNotification notifications;

  MxRoomPowerLevels({
    this.users,
    this.usersDefault = 50,
    this.events,
    this.eventsDefault = 0,
    this.stateDefault = 50,
    this.ban = 50,
    this.kick = 50,
    this.redact = 50,
    this.invite = 50,
    this.notifications,
  });

  static MxRoomPowerLevels fromJson(Map<String, dynamic> json) =>
      MxRoomPowerLevels(
        users: (json['users'] as Map).cast<String, int>(),
        usersDefault: json['users_default'],
        events: (json['events'] as Map).cast<String, int>(),
        eventsDefault: json['events_default'],
        stateDefault: json['state_default'],
        ban: json['ban'],
        kick: json['kick'],
        redact: json['redact'],
        invite: json['invite'],
        notifications: MxNotification.fromJson(json['notifications']),
      );
}
