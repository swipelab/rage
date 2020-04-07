import 'package:rant/matrix/types/mx_encrypted_file.dart';

import 'mx_image_info.dart';
import 'mx_type.dart';

class MxImage with MxType {
  String get type => 'm.image';
  
  final String body;
  final MxImageInfo info;
  final String url;
  final MxEncryptedFile file;

  MxImage({this.body, this.info, this.url, this.file});

  static MxImage fromJson(Map<String, dynamic> json) => MxImage(
        body: json['body'],
        info: MxImageInfo.fromJson(json['info']),
        url: json['url'],
        file: MxEncryptedFile.fromJson(json['file']),
      );
}
