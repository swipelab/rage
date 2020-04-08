import 'package:flutter/material.dart';
import 'package:rant/matrix/types/mx_event.dart';
import 'package:rant/room/fallback_presenter.dart';
import 'package:rant/room/text_presenter.dart';

import 'image_presenter.dart';

typedef Widget ContentPresenterBuilder(BuildContext context, MxEvent event);

class MessagePresenter extends StatelessWidget {
  static Map<String, ContentPresenterBuilder> _presenters = {
    'm.text': (c, e) => TextPresenter(e),
    'm.image': (c, e) => ImagePresenter(e),
  };

  final MxEvent event;
  final ContentPresenterBuilder _contentBuilder;
  MessagePresenter(this.event)
      : _contentBuilder = _presenters.putIfAbsent(
            event.content.type, () => (_, e) => FallbackPresenter(e));

  Widget build(BuildContext context) {
    return Container(
      child: _contentBuilder(context, event),
      padding: EdgeInsets.all(8),
    );
  }
}
