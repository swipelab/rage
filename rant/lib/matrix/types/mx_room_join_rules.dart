import 'mx_join_rule.dart';

class MxRoomJoinRules {
  final MxJoinRule joinRule;

  MxRoomJoinRules({this.joinRule});

  static MxRoomJoinRules fromJson(Map<String, dynamic> json) => MxRoomJoinRules(
        joinRule: mxJoinRule(json['join_rule']),
      );
}
