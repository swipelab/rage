import 'dart:io';

typedef void OnMessageFn(dynamic msg);
typedef void OnCloseFn(int code, String reason);
typedef void OnOpenFn();

/// A Friendly WebSocket
class Rocket {
  String _url;
  WebSocket _socket;
  OnOpenFn onOpen;
  OnMessageFn onMessage;
  OnCloseFn onClose;

  Rocket(this._url);

  connect() async {
    try {
      _socket = await WebSocket.connect(_url);
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

  send(data) => _socket?.add(data);

  close() => _socket?.close();
}
