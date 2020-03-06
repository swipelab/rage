import 'mx_location_info.dart';

class MxLocation {
  final String body;
  final String msgType = 'm.location';
  final String geoUri;
  final MxLocationInfo info;

  MxLocation({this.body, this.geoUri, this.info});

  static MxLocation fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxLocation(
          body: json['body'],
          geoUri: json['geo_uri'],
          info: MxLocationInfo.fromJson(json['info']),
        );
}
