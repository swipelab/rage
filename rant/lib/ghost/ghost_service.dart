import "dart:async";
import 'package:chopper/chopper.dart';

part "ghost_service.chopper.dart";

@ChopperApi(baseUrl: "api")
abstract class GhostService extends ChopperService {
  static GhostService create([ChopperClient client]) => _$GhostService(client);

  @Get(path: "users/public")
  Future<Response> getUsersPublic();

  @Post(path: "auth/login")
  Future<Response> postAuthLogin(@Body() Map<String, dynamic> body);

  @Get(path: "rooms/public")
  Future<Response> getRoomsPublic();

  @Get(path: "rooms/joined")
  Future<Response> getRoomsJoined();

  @Post(path: "{roomId}/join")
  Future<Response> postRoomJoin(@Path() String roomId, @Body() Map<String, dynamic> body);

  @Get(path: "{roomId}/members")
  Future<Response> getRoomMembers(@Path() String roomId);
}
