import 'mx_encrypted_file.dart';
import 'mx_thumbnail_info.dart';

class MxImageInfo {
  final int width;
  final int height;
  final String mimeType;
  final int size;
  final String thumbnailUrl;
  final MxEncryptedFile thumbnailFile;
  final MxThumbnailInfo thumbnailInfo;

  MxImageInfo(
      {this.width, this.height, this.mimeType, this.size, this.thumbnailUrl, this.thumbnailFile, this.thumbnailInfo});

  static MxImageInfo fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxImageInfo(
          width: json['w'],
          height: json['h'],
          mimeType: json['mimetype'],
          size: json['size'],
          thumbnailUrl: json['thumbnail_url'],
          thumbnailFile: MxEncryptedFile.fromJson(json),
          thumbnailInfo: MxThumbnailInfo.fromJson(json),
        );
}
