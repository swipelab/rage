import 'dart:convert';

import 'package:flutter_webrtc/webrtc.dart';
import 'package:rant/util/util.dart';

enum SignalState {
  CallStateNew,
  CallStateRinging,
  CallStateInvite,
  CallStateConnected,
  CallStateBye,
  ConnectionOpen,
  ConnectionClosed,
  ConnectionError
}

typedef void SignalStateFn(SignalState state);
typedef void StreamStateFn(MediaStream stream);
typedef void OtherEventFn(dynamic event);
typedef void DataChannelMessageFn(
    RTCDataChannel channel, RTCDataChannelMessage message);
typedef void DataChannelFn(RTCDataChannel channel);

class Call {
  var _url;

  String _selfId = Generator.randomNumeric(6);
  Rocket _socket;
  var _sessionId;
  var _peerConnections = new Map<String, RTCPeerConnection>();
  var _dataChannels = new Map<String, RTCDataChannel>();
  var _remoteCandidates = [];

  MediaStream _localStream; //don't like this one
  List<MediaStream> _remoteStreams;
  SignalStateFn onStateChange;
  StreamStateFn onLocalStream;
  StreamStateFn onAddRemoteStream;
  StreamStateFn onRemoveRemoteStream;
  OtherEventFn onPeersUpdate;
  DataChannelMessageFn onDataChannelMessage;
  DataChannelFn onDataChannel;

  Map<String, dynamic> _iceServers = {
    'iceServers': [
      {'url': 'stun:stun.l.google.com:19302'}
    ]
  };
  Map<String, dynamic> _config = {
    'mandatory': {},
    'optional': [
      {'DtlsSrtpKeyAgreement': true}
    ]
  };

  Map<String, dynamic> _callConstraints = {
    'mandatory': {'OfferToReceiveAudio': true, 'OfferToReceiveVideo': true},
    'optional': []
  };

  Map<String, dynamic> _dataConstraints = {
    'mandatory': {'OfferToReceiveAudio': false, 'OfferToReceiveVideo': false},
    'optional': []
  };

  Call(this._url);

  close() {
    if (_localStream != null) {
      _localStream.dispose();
      _localStream = null;
    }

    _peerConnections.forEach((key, pc) {
      pc.close();
    });

    if (_socket != null) {
      _socket.close();
    }
  }

  switchCamera() {
    if (_localStream != null) {
      _localStream.getVideoTracks()[0].switchCamera();
    }
  }

  invite(String peerId, String media, bool useScreen) {
    this._sessionId = this._selfId + '-' + peerId;
    this.onStateChange?.call(SignalState.CallStateNew);

    _createPeerConnection(peerId, media, useScreen).then((pc) {
      _peerConnections[peerId] = pc;
      if (media == 'data') {
        _createDataChannel(peerId, pc);
      }
      _createOffer(peerId, pc, media);
    });
  }

  bye() {
    _send('bye', {'session_id': this._sessionId, 'from': this._selfId});
  }

  onMessage(message) async {
    Map<String, dynamic> msg = message;
    final data = msg['data'];
    switch (msg['type']) {
      case 'peers':
        {
          this.onPeersUpdate?.call({'self': this._selfId, 'peers': data});
        }
        break;
      case 'offer':
        {
          var id = data['from'];
          var description = data['description'];
          var media = data['media'];
          var sessionId = data['session_id'];
          this._sessionId = sessionId;

          this.onStateChange?.call(SignalState.CallStateNew);

          var pc = await _createPeerConnection(id, media, false);
          _peerConnections[id] = pc;
          await pc.setRemoteDescription(new RTCSessionDescription(
              description['sdp'], description['type']));
          await _createAnswer(id, pc, media);

          _remoteCandidates.forEach((candiate) async {
            await pc.addCandidate(candiate);
          });
          _remoteCandidates.clear();
        }
        break;

      case 'answer':
        {
          var id = data['from'];
          var description = data['description'];
          var pc = _peerConnections[id];
          if (pc != null) {
            await pc.setRemoteDescription(new RTCSessionDescription(
                description['sdp'], description['type']));
          }
        }
        break;

      case 'candidate':
        {
          var id = data['from'];
          var candidate = data['candidate'];
          var pc = _peerConnections[id];
          RTCIceCandidate ice = RTCIceCandidate(candidate['candidate'],
              candidate['sdpMid'], candidate['sdpMLineIndex']);

          if (pc != null) {
            await pc.addCandidate(ice);
          } else {
            _remoteCandidates.add(ice);
          }
        }
        break;
      case 'leave':
        {
          var id = data;
          var pc = _peerConnections.remove(id);
          _dataChannels.remove(id);

          if (_localStream != null) {
            _localStream.dispose();
            _localStream = null;
          }

          if (pc != null) {
            pc.close();
          }

          this._sessionId = null;
          this.onStateChange?.call(SignalState.CallStateBye);
        }
        break;
      case 'bye':
        {
          var to = data['to'];
          var sessionId = data['session_id'];
          print('bye: $sessionId');

          if (_localStream != null) {
            _localStream.dispose();
            _localStream = null;
          }

          var pc = _peerConnections[to];
          if (pc != null) {
            pc.close();
            _peerConnections.remove(to);
          }

          this._sessionId = null;
          this.onStateChange?.call(SignalState.CallStateBye);
        }
        break;
      case 'keepalive':
        {
          print('keep alive');
        }
        break;
      default:
        break;
    }
  }

  void connect() async {
    _socket = Rocket(_url);

    _socket.onOpen = () {
      print('onOpen');
      this.onStateChange?.call(SignalState.ConnectionOpen);
      _send('new', {
        'name': DeviceInfo.label,
        'id': this._selfId,
        'user_agent': DeviceInfo.userAgent
      });
    };

    _socket.onMessage = (message) {
      this.onMessage(json.decode(message));
    };

    _socket.onClose = (int code, String reason) {
      //print('Closed by Ghost [$code => $reason]!');
      this.onStateChange?.call(SignalState.ConnectionClosed);
    };

    await _socket.connect();
  }

  Future<MediaStream> createStream(String media, bool userScreen) async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': {
        'mandatory': {
          'minWidth': '640',
          'minHeight': '480',
          'minFrameRate': '30'
        },
        'facingMode': 'user',
        'optional': []
      },
    };

    MediaStream stream = userScreen
        ? await navigator.getDisplayMedia(mediaConstraints)
        : await navigator.getUserMedia(mediaConstraints);

    this.onLocalStream?.call(stream);

    return stream;
  }

  Future<RTCPeerConnection> _createPeerConnection(
      String id, String media, bool userScreen) async {
    if (media != 'data') _localStream = await createStream(media, userScreen);
    RTCPeerConnection pc = await createPeerConnection(_iceServers, _config);
    if (media != 'data') pc.addStream(_localStream);

    pc.onIceCandidate = (candidate) {
      _send('candidate', {
        'to': id,
        'candidate': {
          'sdpMLineIndex': candidate.sdpMlineIndex,
          'sdpMid': candidate.sdpMid,
          'candidate': candidate.candidate
        },
        'session_id': this._sessionId
      });
    };

    pc.onIceConnectionState = (state) {};

    pc.onAddStream = this.onAddRemoteStream;
    pc.onRemoveStream = (stream) {
      this.onRemoveRemoteStream?.call(stream);
      _remoteStreams.removeWhere((it) => it.id == stream.id);
    };

    pc.onDataChannel = (channel) {
      _addDataChannel(id, channel);
    };

    return pc;
  }

  _addDataChannel(String id, RTCDataChannel channel) {
    channel.onDataChannelState = (e) {};
    channel.onMessage = (RTCDataChannelMessage data) {
      this.onDataChannelMessage?.call(channel, data);
    };
    _dataChannels[id] = channel;
    this.onDataChannel?.call(channel);
  }

  _createDataChannel(String id, RTCPeerConnection pc,
      {label: 'fileTransfer'}) async {
    RTCDataChannelInit args = RTCDataChannelInit();
    RTCDataChannel channel = await pc.createDataChannel(label, args);
    _addDataChannel(id, channel);
  }

  _createOffer(String id, RTCPeerConnection pc, String media) async {
    try {
      RTCSessionDescription s = await pc
          .createOffer(media == 'data' ? _dataConstraints : _callConstraints);
      pc.setLocalDescription(s);
      _send('offer', {
        'to': id,
        'description': {'sdp': s.sdp, 'type': s.type},
        'session_id': this._sessionId,
        'media': media
      });
    } catch (e) {
      print(e.toString());
    }
  }

  _createAnswer(String id, RTCPeerConnection pc, String media) async {
    try {
      RTCSessionDescription s = await pc.createAnswer(
          media == 'data' ? _dataConstraints : _callConstraints);
      pc.setLocalDescription(s);
      _send('answer', {
        'to': id,
        'description': {'sdp': s.sdp, 'type': s.type},
        'session_id': this._sessionId
      });
    } catch (e) {
      print(e.toString());
    }
  }

  _send(event, data) async {
    data['type'] = event; //funny... not
    _socket.send(json.encode(data));
  }
}
