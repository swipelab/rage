import 'mx_file.dart';
import 'mx_location.dart';
import 'mx_room_avatar.dart';
import 'mx_text.dart';
import 'mx_emote.dart';
import 'mx_notice.dart';
import 'mx_image.dart';
import 'mx_audio.dart';
import 'mx_video.dart';
import 'mx_presence.dart';

import 'mx_room_canonical_alias.dart';
import 'mx_room_create.dart';
import 'mx_room_guest_access.dart';
import 'mx_room_history_visibility.dart';
import 'mx_room_join_rules.dart';
import 'mx_room_member.dart';
import 'mx_room_power_levels.dart';
import 'mx_room_redaction.dart';
import 'mx_room_message.dart';
import 'mx_room_name.dart';

typedef MxType _MxRoomMessageContentFromJsonFn(Map<String, dynamic> json);

const Map<String, _MxRoomMessageContentFromJsonFn> _fromJsonMap = {
  'm.text': MxText.fromJson,
  'm.emote': MxEmote.fromJson,
  'm.notice': MxNotice.fromJson,
  'm.image': MxImage.fromJson,
  'm.file': MxFile.fromJson,
  'm.audio': MxAudio.fromJson,
  'm.location': MxLocation.fromJson,
  'm.video': MxVideo.fromJson,
  'm.presence': MxPresence.fromJson,
  
  'm.room.avatar': MxRoomAvatar.fromJson,
  'm.room.canonical_alias': MxRoomCanonicalAlias.fromJson,
  'm.room.create': MxRoomCreate.fromJson,
  'm.room.guest_access': MxRoomGuestAccess.fromJson,
  'm.room.history_visibility': MxRoomHistoryVisibility.fromJson,
  'm.room.join_rules': MxRoomJoinRules.fromJson,
  'm.room.member': MxRoomMember.fromJson,
  'm.room.message': MxRoomMessage.fromJson,
  'm.room.name': MxRoomName.fromJson,
  'm.room.power_levels': MxRoomPowerLevels.fromJson,
  'm.room.redaction': MxRoomRedaction.fromJson,
};

abstract class MxType {
  String get type;

  static MxType fromJson(String type, Map<String, dynamic> json) =>
      (_fromJsonMap[type] ?? (json) => null)(json);
}
