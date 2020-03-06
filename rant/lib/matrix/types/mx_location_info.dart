import 'mx_encrypted_file.dart';
import 'mx_thumbnail_info.dart';

class MxLocationInfo {
  final String thumbnailUrl;
  final MxEncryptedFile thumbnailFile;
  final MxThumbnailInfo thumbnailInfo;

  MxLocationInfo({this.thumbnailUrl, this.thumbnailFile, this.thumbnailInfo});

  static MxLocationInfo fromJson(Map<String, dynamic> json) => MxLocationInfo(
        thumbnailUrl: json['thumbnail_url'],
        thumbnailFile: MxEncryptedFile.fromJson(json['thumbnail_file']),
        thumbnailInfo: MxThumbnailInfo.fromJson(json['thumbnail_info']),
      );
}
