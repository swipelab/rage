class MxThumbnailInfo {
  final int width;
  final int height;
  final String mimeType;
  final int size;

  MxThumbnailInfo({this.width, this.height, this.size, this.mimeType});

  static MxThumbnailInfo fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxThumbnailInfo(
          width: json['w'],
          height: json['h'],
          mimeType: json['mimetype'],
          size: json['size'],
        );
}
