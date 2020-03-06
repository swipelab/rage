// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matrix_client_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$MatrixClientService extends MatrixClientService {
  _$MatrixClientService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MatrixClientService;

  @override
  Future<Response<Map<String, dynamic>>> postLogin({dynamic body}) {
    final $url = '_matrix/client/r0/login';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getProfileDisplayName(String userId) {
    final $url = '_matrix/client/r0/profile/$userId/displayname';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response> putProfileDisplayName(String userId, dynamic body) {
    final $url = '_matrix/client/r0/profile/$userId/displayname';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getProfileAvatarUrl(String userId) {
    final $url = '_matrix/client/r0/profile/$userId/avatar_url';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response> putProfileAvatarUrl(String userId, dynamic body) {
    final $url = '_matrix/client/r0/profile/$userId/avatar_url';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getProfile(String userId) {
    final $url = '_matrix/client/r0/profile/$userId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response> getRoomEvent({String roomId, String eventId}) {
    final $url = '_matrix/client/r0/rooms/$roomId/event/$eventId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getRoomStateEvent(
      {String roomId, String eventType, String stateKey}) {
    final $url = '_matrix/client/r0/rooms/$roomId/state/$eventType/$stateKey';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Map<String, dynamic>>>> getRoomState({String roomId}) {
    final $url = '_matrix/client/r0/rooms/$roomId/state';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<List<Map<String, dynamic>>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response> getRoomMembers({String roomId}) {
    final $url = '_matrix/client/r0/rooms/$roomId/members';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getRoomJoinedMember({String roomId}) {
    final $url = '_matrix/client/r0/rooms/$roomId/joined_members';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getRoomMessages({String roomId}) {
    final $url = '_matrix/client/r0/rooms/$roomId/messages';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> putRoomStateEvent(
      {String roomId, String eventType, String stateKey, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/state/$eventType/$stateKey';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> putRoomEvent(
      {String roomId, dynamic eventType, String txnId, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/send/$eventType/$txnId';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> putRoomRedact(
      {String roomId, String eventId, String txnId, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/redact/$eventId/$txnId';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> createRoom({dynamic body}) {
    final $url = '_matrix/client/r0/createRoom';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> putRoomAlias({String roomAlias, dynamic body}) {
    final $url = '_matrix/client/r0/directory/room/$roomAlias';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getRoomAlias({String roomAlias}) {
    final $url = '_matrix/client/r0/directory/room/$roomAlias';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> deleteRoomAlias({String roomAlias}) {
    final $url = '_matrix/client/r0/directory/room/$roomAlias';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Map<String, dynamic>>> getJoinedRooms() {
    final $url = '_matrix/client/r0/joined_rooms';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response> roomInvite({String roomId, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/invite';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> roomJoin({String roomId, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/join';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> join({String roomIdOrAlias}) {
    final $url = '_matrix/client/r0/join/$roomIdOrAlias';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> roomLeave({String roomId, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/leave';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> roomForget({String roomId, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/forget';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> roomKick({String roomId, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/kick';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> roomBan({String roomId, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/ban';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> roomUnban({String roomId, dynamic body}) {
    final $url = '_matrix/client/r0/rooms/$roomId/unban';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getDirectoryRoom({String roomId}) {
    final $url = '_matrix/client/r0/directory/list/room/$roomId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> putDirectoryRoom({String roomId, dynamic body}) {
    final $url = '_matrix/client/r0/directory/list/room/$roomId';
    final $body = body;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response> getPublicRooms({int limit, String since, String query}) {
    final $url = '_matrix/client/r0/publicRooms';
    final $params = <String, dynamic>{
      'limit': limit,
      'since': since,
      'query': query
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
