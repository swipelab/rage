import 'dart:io';

class CallTone {
  static bool get _enabled => Platform.isAndroid;

  static playDialTone() {
    if (_enabled) return;
  }

  static playRingTone() {
    if (_enabled) return;
  }

  static stop() {
    if (_enabled) return;
  }
}
