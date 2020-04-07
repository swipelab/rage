import 'mx_join_rule.dart';
import 'mx_type.dart';

class MxRoomJoinRules with MxType {
  String get type => 'm.room.join_rules';

  final MxJoinRule joinRule;

  MxRoomJoinRules({this.joinRule});

  static MxRoomJoinRules fromJson(Map<String, dynamic> json) => MxRoomJoinRules(
        joinRule: mxJoinRule(json['join_rule']),
      );

}
