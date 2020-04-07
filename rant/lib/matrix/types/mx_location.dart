import 'mx_location_info.dart';
import 'mx_type.dart';

class MxLocation with MxType {
  String get type => 'm.location';
  final String body;
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
