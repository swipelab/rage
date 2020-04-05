import 'package:rant/matrix/types/mx_event.dart';
import 'package:rant/matrix/types/mx_rooms.dart';
import 'package:rant/util/util.dart';

class MxClientGetSyncResponse {
  final String nextBatch;
  final MxRooms rooms;
  final List<MxEvent> presence;
  final List<MxEvent> accountData;
  final List<MxEvent> toDevice;

  final Map<String, dynamic> json;

  MxClientGetSyncResponse({this.nextBatch, this.rooms, this.presence, this.accountData, this.toDevice, this.json});

  static MxClientGetSyncResponse fromJson(Map<String, dynamic> json) => MxClientGetSyncResponse(
        nextBatch: json['next_batch'],
        rooms: MxRooms.fromJson(json['rooms']),
        presence: Json.list(json['presence']['events'], MxEvent.fromJson),
        accountData: Json.list(json['account_data']['events'], MxEvent.fromJson),
        json: json,
      );
}
