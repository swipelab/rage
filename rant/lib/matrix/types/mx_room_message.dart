import 'package:rant/matrix/types/mx_audio.dart';

import 'mx_file.dart';
import 'mx_location.dart';
import 'mx_text.dart';
import 'mx_emote.dart';
import 'mx_notice.dart';
import 'mx_image.dart';

typedef dynamic _MxRoomMessageFromJsonFn(Map<String, dynamic> json);

const Map<String, _MxRoomMessageFromJsonFn> _fromJsonMap = {
  'm.text': MxText.fromJson,
  'm.emote': MxEmote.fromJson,
  'm.notice': MxNotice.fromJson,
  'm.image': MxImage.fromJson,
  'm.file': MxFile.fromJson,
  'm.audio': MxAudio.fromJson,
  'm.location': MxLocation.fromJson,
};

abstract class MxRoomMessage {
  static dynamic fromJson(Map<String, dynamic> json) => (_fromJsonMap[json['msgtype']] ?? (json) => json)(json);
}
