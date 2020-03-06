import "dart:async";
import 'package:chopper/chopper.dart';

part "matrix_client_service.chopper.dart";

@ChopperApi(baseUrl: "_matrix/client/r0")
abstract class MatrixClientService extends ChopperService {
  static MatrixClientService create([ChopperClient client]) => _$MatrixClientService(client);

  @Post(path: 'login')
  Future<Response<Map<String, dynamic>>> postLogin({
    @Body() dynamic body,
  });

  @Get(path: 'profile/{userId}/displayname')
  Future<Response<Map<String, dynamic>>> getProfileDisplayName(
    @Path() String userId,
  );

  @Put(path: 'profile/{userId}/displayname')
  Future<Response> putProfileDisplayName(
    @Path() String userId,
    @Body() dynamic body,
  );

  @Get(path: 'profile/{userId}/avatar_url')
  Future<Response<Map<String, dynamic>>> getProfileAvatarUrl(
    @Path() String userId,
  );

  @Put(path: 'profile/{userId}/avatar_url')
  Future<Response> putProfileAvatarUrl(
    @Path() String userId,
    @Body() dynamic body,
  );

  @Get(path: 'profile/{userId}')
  Future<Response<Map<String, dynamic>>> getProfile(
    @Path() String userId,
  );

  @Get(path: 'rooms/{roomId}/event/{eventId}')
  Future<Response> getRoomEvent({
    @Path() String roomId,
    @Path() String eventId,
  });

  @Get(path: 'rooms/{roomId}/state/{eventType}/{stateKey}')
  Future<Response> getRoomStateEvent({
    @Path() String roomId,
    @Path() String eventType,
    @Path() String stateKey,
  });

  @Get(path: 'rooms/{roomId}/state')
  Future<Response<List<Map<String, dynamic>>>> getRoomState({
    @Path() String roomId,
  });

  @Get(path: 'rooms/{roomId}/members')
  Future<Response> getRoomMembers({
    @Path() String roomId,
  });

  @Get(path: 'rooms/{roomId}/joined_members')
  Future<Response> getRoomJoinedMember({
    @Path() String roomId,
  });

  @Get(path: 'rooms/{roomId}/messages')
  Future<Response> getRoomMessages({
    @Path() String roomId,
  });

  @Put(path: 'rooms/{roomId}/state/{eventType}/{stateKey}')
  Future<Response> putRoomStateEvent({
    @Path() String roomId,
    @Path() String eventType,
    @Path() String stateKey,
    @Body() body,
  });

  @Put(path: 'rooms/{roomId}/send/{eventType}/{txnId}')
  Future<Response> putRoomEvent({
    @Path() String roomId,
    @Path() eventType,
    @Path() String txnId,
    @Body() dynamic body,
  });

  @Put(path: 'rooms/{roomId}/redact/{eventId}/{txnId}')
  Future<Response> putRoomRedact({
    @Path() String roomId,
    @Path() String eventId,
    @Path() String txnId,
    @Body() dynamic body,
  });

  @Post(path: 'createRoom')
  Future<Response> createRoom({
    @Body() dynamic body,
  });

  @Put(path: 'directory/room/{roomAlias}')
  Future<Response> putRoomAlias({
    @Path() String roomAlias,
    @Body() dynamic body,
  });

  @Get(path: 'directory/room/{roomAlias}')
  Future<Response> getRoomAlias({
    @Path() String roomAlias,
  });

  @Delete(path: 'directory/room/{roomAlias}')
  Future<Response> deleteRoomAlias({
    @Path() String roomAlias,
  });

  @Get(path: 'joined_rooms')
  Future<Response<Map<String, dynamic>>> getJoinedRooms();

  @Post(path: 'rooms/{roomId}/invite')
  Future<Response> roomInvite({
    @Path() String roomId,
    @Body() dynamic body,
  });

  @Post(path: 'rooms/{roomId}/join')
  Future<Response> roomJoin({
    @Path() String roomId,
    @Body() dynamic body,
  });

  @Post(path: 'join/{roomIdOrAlias}')
  Future<Response> join({
    @Path() String roomIdOrAlias,
  });

  @Post(path: 'rooms/{roomId}/leave')
  Future<Response> roomLeave({
    @Path() String roomId,
    @Body() dynamic body,
  });

  @Post(path: 'rooms/{roomId}/forget')
  Future<Response> roomForget({
    @Path() String roomId,
    @Body() dynamic body,
  });

  @Post(path: 'rooms/{roomId}/kick')
  Future<Response> roomKick({
    @Path() String roomId,
    @Body() dynamic body,
  });

  @Post(path: 'rooms/{roomId}/ban')
  Future<Response> roomBan({
    @Path() String roomId,
    @Body() dynamic body,
  });

  @Post(path: 'rooms/{roomId}/unban')
  Future<Response> roomUnban({
    @Path() String roomId,
    @Body() dynamic body,
  });

  @Get(path: 'directory/list/room/{roomId}')
  Future<Response> getDirectoryRoom({@Path() String roomId});

  @Put(path: 'directory/list/room/{roomId}')
  Future<Response> putDirectoryRoom({
    @Path() String roomId,
    @Body() dynamic body,
  });

  @Get(path: 'publicRooms')
  Future<Response> getPublicRooms({
    @Query() int limit,
    @Query() String since,
    @Query() String query,
  });
}
