import 'mx_room_canonical_alias.dart';
import 'mx_room_create.dart';
import 'mx_room_guest_access.dart';
import 'mx_room_history_visibility.dart';
import 'mx_room_join_rules.dart';
import 'mx_room_member.dart';
import 'mx_room_power_levels.dart';

abstract class MxContent {
  static dynamic fromJson(String type, dynamic json) {
    switch (type) {
      case 'm.room.create':
        return MxRoomCreate.fromJson(json);
      case 'm.room.guest_access':
        return MxRoomGuestAccess.fromJson(json);
      case 'm.room.history_visibility':
        return MxRoomHistoryVisibility.fromJson(json);
      case 'm.room.join_rules':
        return MxRoomJoinRules.fromJson(json);
      case 'm.room.member':
        return MxRoomMember.fromJson(json);
      case 'm.room.power_levels':
        return MxRoomPowerLevels.fromJson(json);
      case 'm.room.canonical_alias':
        return MxRoomCanonicalAlias.fromJson(json);
      default:
        return json;
    }
  }
}
