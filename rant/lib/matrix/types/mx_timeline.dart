import 'mx_event.dart';
import 'package:rant/util/util.dart';

class MxTimeline {
  final List<MxEvent> events;
  final String prevBatch;
  final bool limited;

  MxTimeline({this.events, this.prevBatch, this.limited});

  static MxTimeline fromJson(Map<String, dynamic> json) => json == null
      ? null
      : MxTimeline(
          events: Json.list(json['events'], MxEvent.fromJson),
          prevBatch: json['prev_batch'],
          limited: json['limited'],
        );
}
