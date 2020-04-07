import 'mx_membership.dart';
import 'mx_type.dart';

class MxRoomMember implements MxType {
  final String avatarUrl;
  final String displayName;
  final MxMembership membership;

  MxRoomMember({this.avatarUrl, this.displayName, this.membership});

  static MxRoomMember fromJson(Map<String, dynamic> json) => MxRoomMember(
    avatarUrl: json['avatar_url'],
    displayName: json['displayname'],
    membership: mxMembership(json['membership']),
  );

  String get type => 'm.room.member';
}