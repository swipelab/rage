import 'mx_type.dart';

class MxRoomRedaction with MxType {
  String get type => 'm.room.redaction';
  
  final String reason;

  MxRoomRedaction({this.reason});

  static MxRoomRedaction fromJson(Map<String, dynamic> json) => MxRoomRedaction(
        reason: json['reason'],
      );
}
