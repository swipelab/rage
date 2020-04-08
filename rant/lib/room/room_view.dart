import 'package:flutter/material.dart';
import 'package:rant/matrix/matrix_room.dart';
import 'package:rant/room/message_presenter.dart';
import 'package:rant/ux/message_composer.dart';
import 'package:rant/ux/page.dart';
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
  Widget buildTimeline(BuildContext context, MatrixRoom room) {
    return room.timeline.bindValue((context, timeline) => ListView.builder(
          padding: EdgeInsets.only(top: 96),
          itemBuilder: (context, index) => MessagePresenter(timeline[index]),
          itemCount: timeline.length,
          reverse: true,
        ));
  }

  Widget build(BuildContext context) {
    return Page(
      top: AppBar(
        title:
            widget.room.displayName.bindValue((context, value) => Text(value)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: buildTimeline(context, widget.room),
            ),
          ),
        ],
      ),
      bottom: MessageComposer(
          onMessage: (message) => widget.room.sendMessage(body: message.body)),
    );
  }
}
