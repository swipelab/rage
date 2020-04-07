import 'mx_file_info.dart';
import 'mx_encrypted_file.dart';
import 'mx_type.dart';

class MxFile with MxType {
  String get type => 'm.file';
  
  final String body;
  final String filename;
  final MxFileInfo info;
  final String url;
  final MxEncryptedFile file;

  MxFile({this.body, this.filename, this.info, this.url, this.file});

  static MxFile fromJson(Map<String, dynamic> json) => MxFile(
        body: json['body'],
        filename: json['filename'],
        info: MxFileInfo.fromJson(json['info']),
        url: json['url'],
        file: MxEncryptedFile.fromJson(json['file']),
      );
}
