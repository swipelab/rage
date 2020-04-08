import 'mx_type.dart';

class MxText with MxType {
  String get type => 'm.text';
  final String body;
  final String format;
  final String formattedBody;

  MxText({String body, this.format, this.formattedBody}) : body = body ?? '';

  static MxText fromJson(Map<String, dynamic> json) => MxText(
        body: json['body'],
        format: json['format'],
        formattedBody: json['formatted_body'],
      );

  Map<String, dynamic> toJson() {
    final json = {
      'msgtype': type,
      'body': body,
    };
    if (format != null) json['format'] = format;
    if (formattedBody != null) json['formatted_body'] = formattedBody;
    return json;
  }
}
