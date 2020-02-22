import 'dart:io';

class DeviceInfo {
  static String get label {
    return Platform.localHostname + '(' + Platform.operatingSystem + ")";
  }

  static String get userAgent {
    return 'ranter/' + Platform.operatingSystem + '';
  }
}