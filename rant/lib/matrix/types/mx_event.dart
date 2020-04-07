import 'mx_type.dart';
import 'mx_unsigned.dart';

class MxEvent with MxType {
  final String type;
  final String eventId;
  final String sender;
  final MxType content;
  final String stateKey;
  final int originServerTs;

  final int age;
  final String userId;
  final MxUnsigned unsigned;

  final dynamic prevContent;

  MxEvent({
    this.type,
    this.eventId,
    this.sender,
    this.content,
    this.stateKey,
    this.originServerTs,
    this.age,
    this.userId,
    this.unsigned,
    this.prevContent,
  });

  static MxEvent fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxEvent(
          type: json['type'],
          eventId: json['event_id'],
          sender: json['sender'],
          content: MxType.fromJson(json['type'], json['content']),
          stateKey: json['state_key'],
          originServerTs: json['origin_server_ts'],
          age: json['age'],
          userId: json['user_id'],
          unsigned: MxUnsigned.fromJson(json['unsigned']),
          prevContent: json['prev_content'],
        );
}
