import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rant/matrix/types/mx_event.dart';
import 'package:rant/matrix/types/mx_text.dart';

class TextPresenter extends StatelessWidget {
  final MxText text;
  TextPresenter(MxEvent event) : text = event.content as MxText;

  Widget build(BuildContext context) {
    return Text(text.body);
  }
}
