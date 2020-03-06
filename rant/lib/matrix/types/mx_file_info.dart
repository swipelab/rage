import 'mx_encrypted_file.dart';
import 'mx_thumbnail_info.dart';

class MxFileInfo {
  final String mimeType;
  final int size;
  final String thumbnailUrl;
  final MxEncryptedFile thumbnailFile;
  final MxThumbnailInfo thumbnailInfo;

  MxFileInfo({this.mimeType, this.size, this.thumbnailUrl, this.thumbnailFile, this.thumbnailInfo});

  static MxFileInfo fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxFileInfo(
          mimeType: json['mimetype'],
          size: json['size'],
          thumbnailUrl: json['thumbnail_url'],
          thumbnailFile: MxEncryptedFile.fromJson(json['thumbnail_file']),
          thumbnailInfo: MxThumbnailInfo.fromJson(json['thumbnail_info']),
        );
}
