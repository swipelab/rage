import 'mx_history_visibility.dart';

class MxRoomHistoryVisibility {
  final MxHistoryVisibility historyVisibility;

  MxRoomHistoryVisibility({this.historyVisibility});

  static MxRoomHistoryVisibility fromJson(Map<String, dynamic> json) => MxRoomHistoryVisibility(
        historyVisibility: mxHistoryVisibility(json['history_visibility']),
      );
}
