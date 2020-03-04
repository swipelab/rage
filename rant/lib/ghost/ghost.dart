import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:rant/account.dart';
import 'package:rant/ghost/ghost_service.dart';
import 'package:rant/models/models.dart';
import 'package:rant/util/storage.dart';
import 'package:scoped/scoped.dart';

class Ghost {
  GhostService _service;
  String _token;

  Store store;

  Ghost({this.store, @required String baseUrl}) {
    _service = GhostService.create(ChopperClient(
        baseUrl: baseUrl,
        services: [GhostService.create()],
        interceptors: [
          (Request request) async => this._token == null
              ? request
              : request.replace(
                  headers: Map<String, String>.from(request.headers)..['Authorization'] = 'Bearer $_token')
        ],
        converter: JsonConverter()));

    _token = store.get<Storage>().getString('token');
  }

  Future<LoginResponse> login(String email, String password) async {
    final resp = await _service.postAuthLogin({
      "identifier": {"medium": "email", "address": email},
      "password": password,
    });

    final data = LoginResponse.fromJson(resp.body);

    setToken(data.token);

    return data;
  }

  void setToken(String value) {
    _token = value;
    store.get<Storage>().setString('token', value);
  }

  Future<void> logout() async {
    _token = null;
  }

  Future<List<RxRoom>> getRoomsJoined() async {
    final resp = await _service.getRoomsJoined();
    final data = (resp.body as List).cast<Map<String, dynamic>>().map(RxRoom.fromJson).toList();
    return data;
  }
}

class LoginResponse {
  final String token;
  final RxUser user;

  LoginResponse({this.token, this.user});

  static LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json["token"],
      user: RxUser.fromJson(json["user"]),
    );
  }
}
