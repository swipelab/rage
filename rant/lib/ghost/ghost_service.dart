import "dart:async";
import 'package:chopper/chopper.dart';

part "ghost_service.chopper.dart";

@ChopperApi(baseUrl: "api")
abstract class GhostService extends ChopperService {
  static GhostService create([ChopperClient client]) => _$GhostService(client);

  @Get(path:"users/public")
  Future<Response> getUsersPublic();

  @Post(path:"auth/login")
  Future<Response> postAuthLogin(@Body() Map<String,dynamic> args);
}
