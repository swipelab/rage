import 'package:chopper/chopper.dart';
import 'package:rant/matrix/matrix_client_service.dart';
import 'package:rant/matrix/types.dart';
import 'package:rant/models/models.dart';
import 'package:scoped/scoped.dart';

class Matrix {
  final Store store;
  final String baseUrl;

  String _accessToken;

  MatrixClientService _client;

  static String mxcToUrl(Uri uri, {int width, int height}) {
    if (uri != null && uri.isScheme("mxc")) {
      var host = uri.host;
      var authority = uri.authority;
      var matrixPath = "_matrix/media/v1";
      var path = uri.pathSegments?.firstWhere((element) => true, orElse: () => "");

      if (width == null || height == null) {
        return "https://$host/$matrixPath/download/$authority/$path";
      } else {
        return "https://$host/$matrixPath/thumbnail/$authority/$path?width=$width&height=$height";
      }
    }

    return uri?.toString() ?? "";
  }

  Matrix({this.store, this.baseUrl}) {
    _client = MatrixClientService.create(ChopperClient(
        baseUrl: baseUrl,
        services: [
          MatrixClientService.create(),
        ],
        interceptors: [_accessTokenInterceptor],
        converter: JsonConverter()));
  }

  Future<Request> _accessTokenInterceptor(Request request) async {
    if (this._accessToken == null) return request;
    final headers = Map<String, String>.from(request.headers)..['Authorization'] = 'Bearer $_accessToken';
    return request.replace(headers: headers);
  }

  Future<MxClientLoginResponse> login({String user, String password}) async {
    final body = MxClientLoginResponse(
      userId: '@agrapine:matrix.org',
      accessToken:
          'MDAxOGxvY2F0aW9uIG1hdHJpeC5vcmcKMDAxM2lkZW50aWZpZXIga2V5CjAwMTBjaWQgZ2VuID0gMQowMDI3Y2lkIHVzZXJfaWQgPSBAYWdyYXBpbmU6bWF0cml4Lm9yZwowMDE2Y2lkIHR5cGUgPSBhY2Nlc3MKMDAyMWNpZCBub25jZSA9IDl3enk5O0hVQ2hnfkxtc2YKMDAyZnNpZ25hdHVyZSDT77vC1YQ1KUYWE-BCRBn8PgNjG-RRUNVjxO1ZpT_sGgo',
    );

//    final resp = await _client.login(body: {"type": "m.login.password", "user": user, "password": password});
//    final body = MxClientLoginResponse.fromJson(resp.body);
    _accessToken = body.accessToken;
    return body;
  }

  Future<String> getProfileDisplayName({String user}) async {
    final resp = await _client.getProfileDisplayName(user);
    return resp.body['displayname'];
  }

  Future<void> putProfileDisplayName({String user, String displayName}) async {
    await _client.putProfileDisplayName(user, {"displayname": displayName});
  }

  Future<String> getProfileAvatarUrl({String user}) async {
    final resp = await _client.getProfileAvatarUrl(user);
    return resp.body['avatar_url'];
  }

  Future<void> putProfileAvatarUrl({String user, String avatarUrl}) async {
    await _client.putProfileAvatarUrl(user, {"avatar_url": avatarUrl});
  }

  Future<Profile> getProfile({String user}) async {
    final resp = await _client.getProfile(user);
    return Profile(
      alias: resp.body['displayname'],
      avatar: mxcToUrl(Uri.tryParse(resp.body['avatar_url'])),
    );
  }

  Future<List<String>> getJoinedRooms() async {
    final resp = await _client.getJoinedRooms();
    final result = (resp.body['joined_rooms'] as List).cast<String>().toList();
    return result;
  }

  Future<List<MxEvent>> getRoomState({String room}) async {
    final resp = await _client.getRoomState(roomId: room);
    final result = (resp.body).cast<Map<String, dynamic>>().map(MxEvent.fromJson).toList();
    return result;
  }
}

class MxClientLoginResponse {
  final String accessToken;
  final String deviceId;
  final String homeServer;
  final String userId;

  //TODO:
  final Map<String, MxServer> wellKnown;

  MxClientLoginResponse({this.accessToken, this.deviceId, this.homeServer, this.userId, this.wellKnown});

  static MxClientLoginResponse fromJson(Map<String, dynamic> json) => MxClientLoginResponse(
      accessToken: json['access_token'],
      deviceId: json['device_id'],
      homeServer: json['home_server'],
      userId: json['user_id']);
}

class MxServer {
  final String baseUrl;

  MxServer({this.baseUrl});
}
