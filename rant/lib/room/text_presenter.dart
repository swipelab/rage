import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rant/matrix/types/mx_event.dart';
import 'package:rant/matrix/types/mx_text.dart';

class TextPresenter extends StatelessWidget {
  final MxText text;
  TextPresenter(MxEvent event) : text = event.content as MxText;

  Widget build(BuildContext context) {
    return Container(
      child: Text(text.body),
      decoration: BoxDecoration(
        //color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
    );
  }
}
