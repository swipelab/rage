class MxNotice {
  final String body;
  final String msgType = 'm.notice';
  final String format;
  final String formattedBody;

  MxNotice({this.body, this.format, this.formattedBody});

  static MxNotice fromJson(Map<String, dynamic> json) => MxNotice(
        body: json['body'],
        format: json['format'],
        formattedBody: json['formatted_body'],
      );
}
