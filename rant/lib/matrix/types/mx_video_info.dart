import 'mx_encrypted_file.dart';
import 'mx_thumbnail_info.dart';

class MxVideoInfo {
  final int duration;
  final int width;
  final int height;
  final String mimeType;
  final int size;
  final String thumbnailUrl;
  final MxEncryptedFile thumbnailFile;
  final MxThumbnailInfo thumbnailInfo;

  MxVideoInfo(
      {this.duration,
        this.width,
        this.height,
        this.mimeType,
        this.size,
        this.thumbnailUrl,
        this.thumbnailFile,
        this.thumbnailInfo});

  static MxVideoInfo fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxVideoInfo(
    duration: json['duration'],
    width: json['w'],
    height: json['h'],
    mimeType: json['mimetype'],
    size: json['size'],
    thumbnailUrl: json['thumbnail_url'],
    thumbnailFile: MxEncryptedFile.fromJson(json['thumbnail_file']),
    thumbnailInfo: MxThumbnailInfo.fromJson(json['thumbnail_info']),
  );
}
