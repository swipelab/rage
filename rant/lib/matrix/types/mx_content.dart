import 'mx_room_canonical_alias.dart';
import 'mx_room_create.dart';
import 'mx_room_guest_access.dart';
import 'mx_room_history_visibility.dart';
import 'mx_room_join_rules.dart';
import 'mx_room_member.dart';
import 'mx_room_message.dart';
import 'mx_room_power_levels.dart';
import 'mx_room_redaction.dart';

typedef dynamic _MxEventContentFromJsonFn(Map<String, dynamic> json);

const Map<String, _MxEventContentFromJsonFn> _fromJsonMap = {
  'm.room.canonical_alias': MxRoomCanonicalAlias.fromJson,
  'm.room.create': MxRoomCreate.fromJson,
  'm.room.guest_access': MxRoomGuestAccess.fromJson,
  'm.room.history_visibility': MxRoomHistoryVisibility.fromJson,
  'm.room.join_rules': MxRoomJoinRules.fromJson,
  'm.room.member': MxRoomMember.fromJson,
  'm.room.message': MxRoomMessage.fromJson,
  'm.room.power_levels': MxRoomPowerLevels.fromJson,
  'm.room.redaction': MxRoomRedaction.fromJson,
};

abstract class MxContent {
  static dynamic fromJson(String type, dynamic json) => (_fromJsonMap[type] ?? (json) => json)(json);
}
