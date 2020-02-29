// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ghost_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$GhostService extends GhostService {
  _$GhostService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GhostService;

  @override
  Future<Response> getUsersPublic() {
    final $url = 'api/users/public';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> postAuthLogin(Map<String, dynamic> body) {
    final $url = 'api/auth/login';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getRoomsPublic() {
    final $url = 'api/rooms/public';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getRoomsJoined() {
    final $url = 'api/rooms/joined';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> postRoomJoin(String roomId, Map<String, dynamic> body) {
    final $url = 'api/$roomId/join';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getRoomMembers(String roomId) {
    final $url = 'api/$roomId/members';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
