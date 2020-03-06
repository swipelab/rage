class MxDevice {
  final String deviceId;
  final String displayName;
  final String lastSeenIp;
  final String lastSeenTs;

  MxDevice({this.deviceId, this.displayName, this.lastSeenIp, this.lastSeenTs});

  static MxDevice fromJson(Map<String, dynamic> json) => MxDevice(
        deviceId: json['device_id'],
        displayName: json['display_name'],
        lastSeenIp: json['last_seen_ip'],
        lastSeenTs: json['last_seen_ts'],
      );
}
