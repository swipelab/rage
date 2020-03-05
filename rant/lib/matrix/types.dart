class MxUnsigned {
  final int age;

  MxUnsigned({this.age});

  static MxUnsigned fromJson(Map<String, dynamic> json) => MxUnsigned(
        age: json['age'],
      );
}

abstract class MxContent {
  static dynamic fromJson(String type, dynamic json) {
    switch (type) {
      case 'm.room.create':
        return MxRoomCreate.fromJson(json);
      case 'm.room.guest_access':
        return MxRoomGuestAccess.fromJson(json);
      case 'm.room.history_visibility':
        return MxRoomHistoryVisibility.fromJson(json);
      default:
        return json;
    }
  }
}

class MxRoomHistoryVisibility {
  final String historyVisibility;

  MxRoomHistoryVisibility({this.historyVisibility});

  static MxRoomHistoryVisibility fromJson(Map<String, dynamic> json) =>
      MxRoomHistoryVisibility(historyVisibility: json['history_visibility']);
}

class MxRoomGuestAccess {
  final String guestAccess;

  MxRoomGuestAccess({this.guestAccess});

  static MxRoomGuestAccess fromJson(Map<String, dynamic> json) => MxRoomGuestAccess(
        guestAccess: json['guest_access'],
      );
}

class MxRoomCreate with MxContent {
  final String roomVersion;
  final String creator;

  MxRoomCreate({this.roomVersion, this.creator});

  static MxRoomCreate fromJson(Map<String, dynamic> json) => MxRoomCreate(
        roomVersion: json['roomVersion'],
        creator: json['creator'],
      );
}

class MxEvent {
  final String type;
  final String eventId;
  final String sender;
  final dynamic content;
  final String stateKey;
  final int originServerTs;

  final int age;
  final String userId;
  final MxUnsigned unsigned;

  MxEvent(
      {this.type,
      this.eventId,
      this.sender,
      this.content,
      this.stateKey,
      this.originServerTs,
      this.age,
      this.userId,
      this.unsigned});

  static MxEvent fromJson(Map<String, dynamic> json) => MxEvent(
        type: json['type'],
        eventId: json['event_id'],
        sender: json['sender'],
        content: MxContent.fromJson(json['type'], json['content']),
        stateKey: json['state_key'],
        originServerTs: json['origin_server_ts'],
        age: json['age'],
        userId: json['user_id'],
        unsigned: MxUnsigned.fromJson(json['unsigned']),
      );
}
