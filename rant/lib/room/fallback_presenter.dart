import 'package:flutter/material.dart';
import 'package:rant/matrix/types/mx_event.dart';

class FallbackPresenter extends StatelessWidget {
  final MxEvent event;
  FallbackPresenter(this.event);
  Widget build(BuildContext context) {
    return Container(child: Text('${event.type}:${event.eventId}'), padding: EdgeInsets.all(2), decoration: BoxDecoration(border: Border.all(color: Colors.red)),);
  }
}
