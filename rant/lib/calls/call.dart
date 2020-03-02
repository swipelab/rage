import 'dart:collection';

import 'package:flutter_webrtc/webrtc.dart';
import 'package:rant/calls/call_action.dart';
import 'package:rant/calls/call_message.dart';
import 'package:rant/calls/call_mode.dart';
import 'package:rant/calls/call_state.dart';
import 'package:rant/calls/call_tone.dart';
import 'package:rant/calls/constraints.dart';
import 'package:scoped/scoped.dart';
import 'package:wakelock/wakelock.dart';

typedef CallFn = void Function(Call call);

class UserProfile implements Comparable<UserProfile> {
  final String id;
  final String alias;
  final String avatar;

  UserProfile({this.id, this.alias, this.avatar});

  static final UserProfile empty =
      UserProfile(id: null, alias: "", avatar: null);

  int compareTo(UserProfile other) {
    return alias.toLowerCase().compareTo(other.alias.toLowerCase());
  }
}

class Signal {
  Future<void> offer(CallSession arg) async {}

  Future<void> answer(CallSession arg) async {}

  Future<void> candidate(CallCandidate arg) async {}

  Future<void> invite(CallSession arg) async {}
}

class Call {
  final String id;

  final CallMode mode;
  final bool isCaller;

  final CallFn onAnswered;
  final CallFn onDispose;

  Signal _signal;
  RTCPeerConnection _pc;
  List<Map<String, dynamic>> _iceServers = [];

  //
  bool initialInviteSent = false;
  bool hasEnded = false;

  //duration
  final Ref<UserProfile> peerProfile = Ref(UserProfile.empty);
  final Queue<RTCIceCandidate> _remoteIceCandidates = Queue();
  final Ref<List<RTCIceCandidate>> _localCandidates = Ref([]);
  final Ref<CallState> callState = Ref(CallState.ringing);

  final Ref<CallSession> _initialOffer = Ref();

  final Ref<MediaStream> selfStream = Ref();
  final Ref<MediaStream> peerStream = Ref();

  final Ref<bool> speaker = Ref(false);

  Call(
      {this.id,
      UserProfile peerProfile,
      this.mode,
      this.isCaller,
      this.onAnswered,
      this.onDispose,
      CallState initialState = CallState.ringing}) {
    callState.value = initialState;
    this.peerProfile.value = peerProfile;

    callState.listen(_handleCallStateChanged);

    Wakelock.enable();
    //TODO
    //
    //signal
    //handleCallActions
  }

  void handleCallMessage(CallMessage msg) {
    switch (msg.action) {
      case CallAction.offer:
        _handleOffer(msg);
        break;
      case CallAction.answer:
        _handleAnswer();
        break;
      case CallAction.answerWire:
        _handleAnswerWire(msg);
        break;
      case CallAction.inviteWire:
        _handleInviteWire();
        break;
      case CallAction.candidates:
        _handleCandidates(msg);
        break;
      case CallAction.hangup:
        _handleHangup(signalOS: true, signalWire: true);
        break;
      case CallAction.hangupWire:
        _handleHangup(signalOS: true);
        break;
      case CallAction.hangupOS:
        _handleHangup(signalWire: true);
        break;
    }
  }

  /// Handle incoming offer
  /// Can either be the initial offer or a result of a 'onRenegotiationNeeded'
  void _handleOffer(CallMessage msg) {
    //TODO: resolve remote profile
    //TODO: ensure the msg
    //TODO: map
    _updatePeerConnectionForOffer(msg.data as CallSession);
  }

  void _updatePeerConnectionForOffer(CallSession offer) async {
    if (_pc.signalingState != null &&
        _pc.signalingState != RTCSignalingState.RTCSignalingStateStable) {
      if (isCaller) return;
      await _pc.setLocalDescription(RTCSessionDescription("", "roolback"));
      await _pc
          .setRemoteDescription(RTCSessionDescription(offer.sdp, offer.type));
    } else {
      await _pc
          .setRemoteDescription(RTCSessionDescription(offer.sdp, offer.type));
    }
    final answer = await _pc.createAnswer(Constraints.session(mode));

    await _pc.setLocalDescription(answer);

    //TODO: pipe
    _signal.answer(CallSession(sdp: answer.sdp, type: answer.type));
  }

  Future<void> _createPeerConnection() async {
    final pc = await createPeerConnection({
      'iceServers': _iceServers
    }, {
      'optional': [
        {'DtlsSrtpKeyAgreement': true}
      ]
    });
    pc.onIceCandidate = _onIceCandidate;
    pc.onRenegotiationNeeded = _onRenegotiationNeeded;
    pc.onIceConnectionState = _onIceConnectionState;

    //TODO: check
    pc.onAddStream = (stream) => peerStream.value = stream;
    pc.onRemoveStream = (stream) => peerStream.value = null;

    await _pc?.dispose();

    _pc = pc;
  }

  _onIceCandidate(RTCIceCandidate c) async {
    await _signal.candidate(CallCandidate(
        sdpMid: c.sdpMid,
        sdpMLineIndex: c.sdpMlineIndex,
        candidate: c.candidate));
  }

  _onRenegotiationNeeded() {
    _pc.createOffer(Constraints.session(mode)).then((offer) async {
      if (_pc.signalingState != null &&
          _pc.signalingState != RTCSignalingState.RTCSignalingStateStable) {
        return;
      }

      await _pc.setLocalDescription(offer);

      if (!initialInviteSent) {
        initialInviteSent = true;
        await _signal.invite(CallSession(sdp: offer.sdp, type: offer.type));
      } else {
        await _signal.offer(CallSession(sdp: offer.sdp, type: offer.type));
      }
    });
  }

  _onIceConnectionState(RTCIceConnectionState state) {
    switch (state) {
      case RTCIceConnectionState.RTCIceConnectionStateNew:
      case RTCIceConnectionState.RTCIceConnectionStateChecking:
        callState.value = CallState.connecting;
        break;
      case RTCIceConnectionState.RTCIceConnectionStateCompleted:
      case RTCIceConnectionState.RTCIceConnectionStateConnected:
        callState.value = CallState.active;
        break;
      case RTCIceConnectionState.RTCIceConnectionStateDisconnected:
      case RTCIceConnectionState.RTCIceConnectionStateClosed:
        _handleHangup(signalOS: true, signalWire: true);
        break;
      case RTCIceConnectionState.RTCIceConnectionStateFailed:
      case RTCIceConnectionState.RTCIceConnectionStateCount:
        break;
    }
  }

  /// Handle answered initiated by the local user
  void _handleAnswer() {}

  /// Handle answered initiated by the remote user
  void _handleAnswerWire(CallMessage msg) {}

  /// Initiate call with the remote party
  void _handleInviteWire() {}

  /// Handle incoming candidates
  void _handleCandidates(CallMessage msg) {}

  void _handleHangup({bool signalWire = false, bool signalOS = false}) {
    if (hasEnded) return;

    callState.value = CallState.ended;
    hasEnded = true;

    if (signalOS) {
      //platform.endCall(id)
    }

    if (signalWire) {
      //_signal.hangup()
    }

    _dispose();
  }

  _setSpeakerMode(bool enabled) {
    MediaStreamTrack('0', 'fake', 'audio', true).enableSpeakerphone(enabled);
    speaker.value = enabled;
  }

  _handleCallStateChanged() {
    switch (callState.value) {
      case CallState.dialing:
        CallTone.playDialTone();
        break;
      case CallState.ringing:
        CallTone.playRingTone();
        break;
      case CallState.active:
        //TODO: start duration
        _setSpeakerMode(mode == CallMode.video);
        CallTone.stop();
        break;
      case CallState.connecting:
      case CallState.ended:
        CallTone.stop();
        break;
    }
  }

  Future<bool> _accessMicrophone() async {
    //var access = await PermissionWrapper
  }

  void _dispose() async {
    //TODO:
    Wakelock.disable();
    callState.forget(_handleCallStateChanged);
  }
}
