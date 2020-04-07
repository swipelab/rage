import 'mx_type.dart';

class MxNotice with MxType {
  String get type => 'm.notice';
  final String body;
  final String format;
  final String formattedBody;

  MxNotice({this.body, this.format, this.formattedBody});

  static MxNotice fromJson(Map<String, dynamic> json) => MxNotice(
        body: json['body'],
        format: json['format'],
        formattedBody: json['formatted_body'],
      );
}
