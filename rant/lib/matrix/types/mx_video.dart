import 'mx_encrypted_file.dart';
import 'mx_type.dart';
import 'mx_video_info.dart';

class MxVideo with MxType {
  String get type => 'm.video';
  final String body;
  final MxVideoInfo info;
  final String url;
  final MxEncryptedFile file;

  MxVideo({this.body, this.info, this.url, this.file});

  static MxVideo fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxVideo(
          body: json['body'],
          info: MxVideoInfo.fromJson(json['info']),
          url: json['url'],
          file: MxEncryptedFile.fromJson(json['file']),
        );
}
