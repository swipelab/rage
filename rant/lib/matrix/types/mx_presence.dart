import 'mx_status.dart';
import 'mx_type.dart';

class MxPresence with MxType {
  String get type => 'm.presence';

  final String avatarUrl;
  final bool currentlyActive;
  final int lastActiveAgo;
  final MxStatus presence;
  final String statusMsg;

  MxPresence(
      {this.avatarUrl,
      this.currentlyActive,
      this.lastActiveAgo,
      this.presence,
      this.statusMsg});

  static MxPresence fromJson(Map<String, dynamic> json) => MxPresence(
        avatarUrl: json['avatar_url'],
        currentlyActive: json['currently_active'],
        lastActiveAgo: json['last_active_ago'],
        presence: mxStatus(json['presence']),
        statusMsg: json['status_msg'],
      );
}
