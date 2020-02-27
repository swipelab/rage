import 'package:rant/calls/call_mode.dart';

class Constraints {
  static const MediaAudio = {'audio': true};

  static const MediaVideo = {
    'audio': true,
    'video': {
      'mandatory': {
        'minWidth': '640',
        'minHeight': '480',
        'minFrameRate': '30'
      },
      'facingMode': 'user',
      'optional': []
    }
  };

  static const SessionAudio = {
    'mandatory': {
      'OfferToReceiveAudio': true,
      'OfferToReceiveVideo': false,
    },
    'optional': []
  };

  static const SessionVideo = {
    'mandatory': {'OfferToReceiveAudio': true, 'OfferToReceiveVideo': true},
    'optional': []
  };

  static Map<String, dynamic> session(CallMode mode) {
    switch (mode) {
      case CallMode.video:
        return SessionVideo;
      case CallMode.audio:
      default:
        return SessionAudio;
    }
  }
}
