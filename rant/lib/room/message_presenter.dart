import 'package:flutter/material.dart';
import 'package:rant/matrix/types/mx_event.dart';
import 'package:rant/room/fallback_presenter.dart';
import 'package:rant/room/text_presenter.dart';

typedef Widget MessagePresenterBuilder(BuildContext context, MxEvent event);

class MessagePresenter extends StatelessWidget {
  static Map<String, MessagePresenterBuilder> _presenters = {
    'm.text': (c, e) => TextPresenter(e)
  };

  final MxEvent event;
  final MessagePresenterBuilder _builder;
  MessagePresenter(this.event):_builder = _presenters.putIfAbsent(event.content.type, () => (_,e) => FallbackPresenter(e));
  
  Widget build(BuildContext context) => _builder(context, event);
}
