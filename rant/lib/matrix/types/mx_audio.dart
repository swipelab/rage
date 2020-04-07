import 'mx_encrypted_file.dart';
import 'mx_audio_info.dart';
import 'mx_type.dart';

class MxAudio with MxType {
  String get type => 'm.audio';
  
  final String body;
  final MxAudioInfo info;
  final String url;
  final MxEncryptedFile file;

  MxAudio({this.body, this.info, this.url, this.file});

  static MxAudio fromJson(Map<String, dynamic> json) => MxAudio(
        body: json['body'],
        info: MxAudioInfo.fromJson(json['info']),
        url: json['url'],
        file: MxEncryptedFile.fromJson(json['file']),
      );
}
