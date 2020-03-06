class MxEmote {
  final String body;
  final String msgType = 'm.emote';
  final String format;
  final String formattedBody;

  MxEmote({this.body, this.format, this.formattedBody});

  static MxEmote fromJson(Map<String, dynamic> json) => MxEmote(
    body: json['body'],
    format: json['format'],
    formattedBody: json['formatted_body'],
  );
}