import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

typedef void OnMessageFn(dynamic msg);
typedef void OnCloseFn(int code, String reason);
typedef void OnOpenFn();

class Rocket {
  String _url;
  WebSocket _socket;
  OnOpenFn onOpen;
  OnMessageFn onMessage;
  OnCloseFn onClose;

  Rocket(this._url);

//  static HttpClient client = new HttpClient()
//    ..badCertificateCallback = (_certificateCheck);
//  static bool _certificateCheck(X509Certificate cert, String host, int port) => true;

  connect() async {
    try {
      _socket = await WebSocket.connect(_url);
      //_socket = await _connectForSelfSignedCert(_url);
      this.onOpen?.call();
      _socket.listen((data) {
        this.onMessage?.call(data);
      }, onDone: () {
        this.onClose?.call(_socket.closeCode, _socket.closeReason);
      });
    } catch (e) {
      this.onClose?.call(500, e.toString());
    }
  }

  send(data) {
    if (_socket != null) {
      _socket.add(data);
      print("send: $data");
    }
  }

  close() {
    _socket.close();
  }

  Future<WebSocket> _connectForSelfSignedCert(String url) async {
    try {
      Random r = Random();
      String key = base64.encode(List<int>.generate(8, (_) => r.nextInt(255)));
      SecurityContext securityContext = new SecurityContext();

      //securityContext.setTrustedCertificates('...')

      HttpClient client = HttpClient(context: securityContext);
      client.badCertificateCallback = (cert, host, port) {
        print('Allow self-signed certificate => $host:$port.');
        return true;
      };

      HttpClientRequest request =
          await client.getUrl(Uri.parse("https://10.0.0.2:4443/lobby"));
      request.headers.add('Connection', 'Upgrade');
      request.headers.add('Upgrade', 'websocket');
      request.headers
          .add('Sec-WebSocket-Version', '13'); // :D find your lucky version
      request.headers.add('Sec-WebSocket-Key', key.toLowerCase());

      HttpClientResponse response = await request.close();
      Socket socket = await response.detachSocket();
      final webSocket = WebSocket.fromUpgradedSocket(socket,
          protocol: 'signaling',
          serverSide: false);
      return webSocket;
    } catch (e) {
      throw e;
    }
  }
}
