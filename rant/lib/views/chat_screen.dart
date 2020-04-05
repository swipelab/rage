import 'package:flutter/material.dart';
import 'package:rant/matrix/matrix_room.dart';
import 'package:rant/ux/paper.dart';
import 'package:rant/ux/tile.dart';

import 'package:scoped/scoped.dart';
import 'package:rant/util/util.dart';

class ChatScreen extends StatefulWidget {
  final MatrixRoom room;

  ChatScreen({this.room});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Paper(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.black.withOpacity(0.3),
              padding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  widget.room.displayName.bindValue((_, v) => AppBarTitleText(v.ellipsis(20))),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: widget.room.timeline.bindValue((context, value) => Text(value.length.toString())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
