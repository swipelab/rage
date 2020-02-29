import 'package:chopper/chopper.dart';
import 'package:flutter/foundation.dart';
import 'package:rant/ghost/ghost_service.dart';
import 'package:rant/models/models.dart';

class GhostClient {
  GhostService _service;
  String _token;

  GhostClient({@required String baseUrl}) {
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
  }

  Future<LoginResponse> login(String email, String password) async {
    final response = await _service.postAuthLogin({
      "identifier": {"medium": "email", "address": email},
      "password": password,
    });

    final data = LoginResponse.fromJson(response.body);
    _token = data.token;

    return data;
  }

  Future<void> logout() async {
    _token = null;
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
