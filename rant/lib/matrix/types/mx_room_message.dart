import 'mx_text.dart';
import 'mx_emote.dart';
import 'mx_notice.dart';

typedef dynamic _MxRoomMessageFromJsonFn(Map<String, dynamic> json);

const Map<String, _MxRoomMessageFromJsonFn> _fromJsonMap = {
  'm.text': MxText.fromJson,
  'm.emote': MxEmote.fromJson,
  'm.notice': MxNotice.fromJson,
  'm.audio': null,
};

abstract class MxRoomMessage {
  static dynamic fromJson(Map<String, dynamic> json) => (_fromJsonMap[json['msgtype']] ?? (json) => json)(json);
}

