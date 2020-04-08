import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:rant/matrix/types/mx_event.dart';

import 'types/mx_dir.dart';
import 'types/mx_get_room_messages.dart';

import 'types/mx_device.dart';
import 'types/mx_authentication_data.dart';

part "client.chopper.dart";

@ChopperApi(baseUrl: "_matrix/client/r0")
abstract class Client extends ChopperService {
  static Client create([ChopperClient client]) => _$Client(client);

  @Post(path: 'login')
  Future<Response<Map<String, dynamic>>> postLogin({
    @Body() dynamic body,
  });

  @Get(path: 'sync')
  Future<Response<Map<String, dynamic>>> getSync({
    @Query() String filter,
    @Query() String since,
    @Query("full_state") bool fullState,
    @Query("set_presence") String setPresence,
    @Query() int timeout = 0,
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
  Future<Response<List<Map<String, dynamic>>>> _getRoomState({
    @Path() String roomId,
  });

  Future<List<MxEvent>> getRoomState({String roomId}) =>
      _getRoomState(roomId: roomId).then((resp) => resp.body.map(MxEvent.fromJson).toList());

  @Get(path: 'rooms/{roomId}/members')
  Future<Response> getRoomMembers({
    @Path() String roomId,
  });

  @Get(path: 'rooms/{roomId}/joined_members')
  Future<Response> getRoomJoinedMember({
    @Path() String roomId,
  });

  @Get(path: 'rooms/{roomId}/messages')
  Future<Response<Map<String, dynamic>>> _getRoomMessages({
    @Path() String roomId,
    @Query() String from,
    @Query() String to,
    @Query() String dir,
    @Query() int limit,
    @Query() String filter,
  });

  Future<MxGetRoomMessages> getRoomMessages({
    String roomId,
    String from,
    String to,
    MxDir dir = MxDir.b,
    int limit,
    String filter,
  }) async =>
      MxGetRoomMessages.fromJson((await _getRoomMessages(
        roomId: roomId,
        from: from,
        to: to,
        dir: mxDirString(dir),
        limit: limit,
        filter: filter,
      ))
          .body);

  @Put(path: 'rooms/{roomId}/state/{eventType}/{stateKey}')
  Future<Response<Map<String, dynamic>>> putRoomStateEvent({
    @Path() String roomId,
    @Path() String eventType,
    @Path() String stateKey,
    @Body() body,
  });

  @Put(path: 'rooms/{roomId}/send/{eventType}/{txnId}')
  Future<Response<Map<String, dynamic>>> putRoomEvent({
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
    @Body() dynamic body,
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

  @Put(path: 'presence/{userId}/status')
  Future<Response> putPresenceStatus({@Path() String userId, @Body() dynamic body});

  @Get(path: 'presence/{userId}/status')
  Future<Response> getPresenceStatus({@Path() String userId});

  Future<List<MxDevice>> getDevices() async {
    final resp = await _getDevices();
    final result = (resp.body['devices'] as List).cast<Map<String, dynamic>>().map(MxDevice.fromJson).toList();
    return result;
  }

  @Get(path: 'devices')
  Future<Response<Map<String, dynamic>>> _getDevices();

  Future<MxDevice> getDevice({String deviceId}) async => MxDevice.fromJson((await _getDevice(deviceId: deviceId)).body);

  @Get(path: 'devices/{deviceId}')
  Future<Response<Map<String, dynamic>>> _getDevice({@Path() String deviceId});

  @Put(path: 'devices/{deviceId}')
  Future<Response> _putDevice({@Path() String deviceId, @Body() dynamic body});

  Future putDevice({String deviceId, String displayName}) async => await _putDevice(
        deviceId: deviceId,
        body: {
          "display_name": displayName,
        },
      );

  @Delete(path: 'devices/{deviceId}')
  Future deleteDevice({@Path() String deviceId, @Body() dynamic body});

  Future deleteDevices({List<String> devices, MxAuthenticationData auth}) async =>
      _deleteDevices(body: {devices: devices, auth: auth?.toJson()});

  @Post(path: 'delete_devices')
  Future<Response> _deleteDevices({@Body() dynamic body});
}
