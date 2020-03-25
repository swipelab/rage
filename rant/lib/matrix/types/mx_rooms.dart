class MxRooms {
  final Map<String, dynamic> join;
  final Map<String, dynamic> invite;
  final Map<String, dynamic> leave;

  MxRooms({this.join, this.invite, this.leave});

  static MxRooms fromJson(Map<String, dynamic> json) => MxRooms(
        join: json['join'] as Map<String, dynamic>,
        invite: json['invite'] as Map<String, dynamic>,
        leave: json['leave'] as Map<String, dynamic>,
      );
}

class MxJoinedRoom {
//  final MxRoomSummary summary;
//  final MxState state;
//  final MxTimeline timeline;
//  final MxEphemeral ephemeral;
//  final MxAccountData accountData;
//  final MxUnread unreadNotifications;
}

class MxInvitedRoom {}

class MxLeftRoom {}

class MxRoomSummary {}

class MxState {}

class MxTimeline {}

class MxEphemeral {}

class MxAccountData {}

class MxUnread {}
