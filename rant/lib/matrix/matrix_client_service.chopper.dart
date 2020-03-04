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
  Future<Response<Map<String, dynamic>>> postLogin(
      {Map<String, dynamic> body}) {
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
  Future<Response> putProfileDisplayName(
      String userId, Map<String, dynamic> body) {
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
  Future<Response> putProfileAvatarUrl(
      String userId, Map<String, dynamic> body) {
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
  Future<Response<Map<String, dynamic>>> getJoinedRooms() {
    final $url = '_matrix/client/r0/joined_rooms';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Map<String, dynamic>, Map<String, dynamic>>($request);
  }

  @override
  Future<Response<List>> getRoomState({String roomId}) {
    final $url = '_matrix/client/r0/rooms/$roomId/state';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List, List>($request);
  }
}
