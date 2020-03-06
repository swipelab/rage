class MxText {
  final String body;
  final String msgType = 'm.text';
  final String format;
  final String formattedBody;

  MxText({this.body, this.format, this.formattedBody});

  static MxText fromJson(Map<String, dynamic> json) => MxText(
        body: json['body'],
        format: json['format'],
        formattedBody: json['formatted_body'],
      );
}
