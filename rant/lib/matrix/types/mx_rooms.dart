import 'mx_room_join.dart';
import 'package:rant/util/util.dart';

class MxRooms {
  final Map<String, MxRoomJoin> join;
  final Map<String, dynamic> invite;
  final Map<String, dynamic> leave;

  MxRooms({this.join, this.invite, this.leave});

  static MxRooms fromJson(Map<String, dynamic> data) => MxRooms(
        join: Json.map(data['join'], MxRoomJoin.fromJson),
        invite: data['invite'] as Map<String, dynamic>,
        leave: data['leave'] as Map<String, dynamic>,
      );
}

class MxInvitedRoom {}

class MxLeftRoom {}