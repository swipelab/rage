import 'mx_membership.dart';

class MxRoomMember {
  final String avatarUrl;
  final String displayName;
  final MxMembership membership;

  MxRoomMember({this.avatarUrl, this.displayName, this.membership});

  static MxRoomMember fromJson(Map<String, dynamic> json) => MxRoomMember(
    avatarUrl: json['avatar_url'],
    displayName: json['displayname'],
    membership: mxMembership(json['membership']),
  );
}