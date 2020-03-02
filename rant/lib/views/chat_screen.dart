import 'package:flutter/material.dart';
import 'package:rant/models/models.dart';
import 'package:rant/ux/paper.dart';
import 'package:rant/ux/tile.dart';

class ChatScreen extends StatefulWidget {
  final RxRoom room;

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
                  AppBarTitleText(widget.room.alias),
                ],
              ),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}
