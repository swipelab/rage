import 'mx_type.dart';

class MxEmote with MxType {
  String get type => 'm.emote';
  final String body;
  final String format;
  final String formattedBody;

  MxEmote({this.body, this.format, this.formattedBody});

  static MxEmote fromJson(Map<String, dynamic> json) => MxEmote(
    body: json['body'],
    format: json['format'],
    formattedBody: json['formatted_body'],
  );
}