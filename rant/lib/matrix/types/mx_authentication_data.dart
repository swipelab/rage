class MxAuthenticationData {
  final String type;
  final String session;

  MxAuthenticationData({this.type, this.session});

  Map<String, dynamic> toJson() => {
        'type': type,
        'session': session,
      };
}
