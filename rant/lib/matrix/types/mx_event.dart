import 'mx_content.dart';
import 'mx_unsigned.dart';

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