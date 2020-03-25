import 'package:rant/matrix/types/mx_event.dart';
import 'package:rant/matrix/types/mx_rooms.dart';

class MxClientGetSyncResponse {
  final String nextBatch;
  final MxRooms rooms;
  final List<MxEvent> presence;
  final MxAccountData accountData;
  final List<MxEvent> toDevice;

  final Map<String, dynamic> json;

  MxClientGetSyncResponse({this.nextBatch, this.rooms, this.presence, this.accountData, this.toDevice, this.json});

  static MxClientGetSyncResponse fromJson(Map<String, dynamic> json) => MxClientGetSyncResponse(
        nextBatch: json['next_batch'],
        rooms: MxRooms.fromJson(json['rooms']),
        //presence: json['presence']['events'] as List,
        json: json,
      );
}
