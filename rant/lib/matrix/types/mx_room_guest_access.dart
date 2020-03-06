import 'mx_guest_access.dart';

class MxRoomGuestAccess {
  final MxGuestAccess guestAccess;

  MxRoomGuestAccess({this.guestAccess});

  static MxRoomGuestAccess fromJson(Map<String, dynamic> json) => MxRoomGuestAccess(
        guestAccess: mxGuestAccess(json['guest_access']),
      );
}
