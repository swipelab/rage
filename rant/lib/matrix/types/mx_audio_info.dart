class MxAudioInfo {
  final int duration;
  final String mimeType;
  final int size;

  MxAudioInfo({this.duration, this.mimeType, this.size});

  static MxAudioInfo fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxAudioInfo(
          duration: json['duration'],
          mimeType: json['mimetype'],
          size: json['size'],
        );
}
