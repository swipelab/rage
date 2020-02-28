import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:rant/ghost/ghost_service.dart';
import 'package:rant/models/models.dart';

class GhostApi {
  final GhostService _service;

  GhostApi({@required String baseUrl})
      : _service = GhostService.create(ChopperClient(
            baseUrl: baseUrl,
            services: [GhostService.create()],
            converter: JsonConverter()));

  Future<LoginResponse> login(String email, String password) async {
    final response = await _service.postAuthLogin({
      "identifier": {"medium": "email", "address": email},
      "password": password,
    });
    return LoginResponse.fromJson(response.body);
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
