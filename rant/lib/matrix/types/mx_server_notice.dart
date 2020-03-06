class MxServerNotice {
  final String body;
  final String msgType = 'm.server_notice';
  final String serverNoticeType;
  final String adminContact;
  final String limitType;

  MxServerNotice({this.body, this.serverNoticeType, this.adminContact, this.limitType});

  static MxServerNotice fromJson(Map<String, dynamic> json) => MxServerNotice(
        body: json['body'],
        serverNoticeType: json['server_notice_type'],
        adminContact: json['admin_contact'],
        limitType: json['limit_type'],
      );
}
