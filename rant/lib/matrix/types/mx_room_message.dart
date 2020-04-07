import 'package:rant/matrix/types/mx_type.dart';

abstract class MxRoomMessage {
  static MxType fromJson(Map<String, dynamic> json) => MxType.fromJson(json['msgtype'], json);
}
