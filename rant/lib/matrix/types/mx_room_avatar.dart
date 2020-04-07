import 'package:rant/matrix/types/mx_type.dart';

class MxRoomAvatar with MxType {
  String get type => 'm.room.avatar';
  
  final String url;

  MxRoomAvatar({this.url});

  static MxRoomAvatar fromJson(Map<String, dynamic> json) => MxRoomAvatar(
        url: json['url'],
      );

}
