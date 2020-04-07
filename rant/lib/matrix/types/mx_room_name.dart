import 'mx_type.dart';

class MxRoomName with MxType {

  String get type => 'm.room.name';
  
  final String name;

  MxRoomName({this.name});

  static MxRoomName fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxRoomName(
          name: json['name'],
        );
}
