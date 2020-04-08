class MxClientLoginResponse {
  final String accessToken;
  final String deviceId;
  final String homeServer;
  final String userId;

  //TODO:
  final Map<String, MxServer> wellKnown;

  MxClientLoginResponse(
      {this.accessToken,
      this.deviceId,
      this.homeServer,
      this.userId,
      this.wellKnown});

  static MxClientLoginResponse fromJson(Map<String, dynamic> json) =>
      MxClientLoginResponse(
          accessToken: json['access_token'],
          deviceId: json['device_id'],
          homeServer: json['home_server'],
          userId: json['user_id']);
}

class MxServer {
  final String baseUrl;

  MxServer({this.baseUrl});
}
