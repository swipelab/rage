import 'mx_history_visibility.dart';
import 'mx_type.dart';

class MxRoomHistoryVisibility with MxType {
  String get type => 'm.room.history_visibility';
  
  final MxHistoryVisibility historyVisibility;

  MxRoomHistoryVisibility({this.historyVisibility});

  static MxRoomHistoryVisibility fromJson(Map<String, dynamic> json) => MxRoomHistoryVisibility(
        historyVisibility: mxHistoryVisibility(json['history_visibility']),
      );

}
