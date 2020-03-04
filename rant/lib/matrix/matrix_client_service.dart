import "dart:async";
import 'package:chopper/chopper.dart';

part "matrix_client_service.chopper.dart";

@ChopperApi(baseUrl: "_matrix/client/r0")
abstract class MatrixClientService extends ChopperService {
  static MatrixClientService create([ChopperClient client]) => _$MatrixClientService(client);

  @Post(path: 'login')
  Future<Response<Map<String, dynamic>>> postLogin({@Body() Map<String, dynamic> body});

  @Get(path: 'profile/{userId}/displayname')
  Future<Response<Map<String, dynamic>>> getProfileDisplayName(@Path() String userId);

  @Put(path: 'profile/{userId}/displayname')
  Future<Response> putProfileDisplayName(@Path() String userId, @Body() Map<String, dynamic> body);

  @Get(path: 'profile/{userId}/avatar_url')
  Future<Response<Map<String, dynamic>>> getProfileAvatarUrl(@Path() String userId);

  @Put(path: 'profile/{userId}/avatar_url')
  Future<Response> putProfileAvatarUrl(@Path() String userId, @Body() Map<String, dynamic> body);

  @Get(path: 'profile/{userId}')
  Future<Response<Map<String, dynamic>>> getProfile(@Path() String userId);

  @Get(path: 'joined_rooms')
  Future<Response<Map<String, dynamic>>> getJoinedRooms();

  @Get(path: 'rooms/{roomId}/state')
  Future<Response<List<dynamic>>> getRoomState({@Path() String roomId});
}
