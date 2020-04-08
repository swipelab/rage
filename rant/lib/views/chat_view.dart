import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rant/account.dart';
import 'package:rant/matrix/matrix_room.dart';
import 'package:rant/room/room_view.dart';
import 'package:rant/ux/sliver_page.dart';
import 'package:rant/ux/paper.dart';
import 'package:rant/ux/tile.dart';
import 'package:scoped/scoped.dart';
import 'package:rant/util/util.dart';

class ChatView extends StatelessWidget {
  Widget buildRoom(BuildContext context, MatrixRoom room) {
    return Tile(
        leading: room.avatarUrl.bindValue((_, v) =>
            v == null ? Container(color: Colors.blue) : Image.network(v)),
        title:
            room.displayName.bindValue((_, v) => TileTitleText(v.ellipsis(20))),
        stamp: room.lastSeen.bindValue((_, v) => TileStampText(v)),
        body: room.lastMessage.bindValue((_, v) => TileBodyText(v)),
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => RoomView(room: room))));
  }

  Widget buildRooms(BuildContext context) {
    return context
        .get<Account>()
        .rooms
        .bindValue((context, rooms) => SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => ListBody(
                      children: <Widget>[
                        buildRoom(context, rooms[index]),
                        Container(
                          margin: rooms.length == index + 1
                              ? null
                              : EdgeInsets.only(left: 64),
                          height: 1,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                childCount: rooms.length)));
  }

  Widget build(BuildContext context) {
    return SliverPage(
      top: AppBar(
        title: Text('CHATS'),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      padding: EdgeInsets.only(top: 96, bottom: 420),
      slivers: [
        buildRooms(context),
      ],
    );
  }
}
