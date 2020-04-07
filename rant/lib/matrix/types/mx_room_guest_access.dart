import 'mx_guest_access.dart';
import 'mx_type.dart';

class MxRoomGuestAccess with MxType {
  String get type => 'm.room.guest_access';
  
  final MxGuestAccess guestAccess;

  MxRoomGuestAccess({this.guestAccess});

  static MxRoomGuestAccess fromJson(Map<String, dynamic> json) => MxRoomGuestAccess(
        guestAccess: mxGuestAccess(json['guest_access']),
      );

}
