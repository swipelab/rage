import 'package:flutter/material.dart';
import 'package:rant/matrix/matrix_room.dart';
import 'package:rant/room/message_presenter.dart';
import 'package:rant/ux/message_composer.dart';
import 'package:rant/ux/tile.dart';

import 'package:scoped/scoped.dart';
import 'package:rant/util/util.dart';

class RoomView extends StatefulWidget {
  final MatrixRoom room;

  RoomView({this.room});

  @override
  _RoomViewState createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  widget.room.displayName
                      .bindValue((_, v) => AppBarTitleText(v.ellipsis(20))),
                ],
              ),
            ),
            widget.room.workers.bindValue((context, value)=> Text('Workers : $value')),
            Expanded(
              child: widget.room.timeline
                  .bindValue((context, value) => ListView.builder(
                        itemBuilder: (context, index) =>
                            MessagePresenter(value[index]),
                        itemCount: value.length,
                      )),
            ),
            MessageComposer(
                onMessage: (message) =>
                    widget.room.sendMessage(body: message.body))
          ],
        ),
      ),
    );
  }
}
