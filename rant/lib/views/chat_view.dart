import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/matrix/matrix_room.dart';
import 'package:rant/ux/paper.dart';
import 'package:rant/ux/tile.dart';
import 'package:scoped/scoped.dart';
import 'package:rant/util/util.dart';

import 'room_view.dart';

class ChatView extends StatelessWidget {
  Widget buildTop(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
        child: Container(
          height: 96,
          color: Colors.black.withOpacity(0.3),
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, right: 8, bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text(
                    'Chats',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  Expanded(child: Container()),
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
            ),
          ]),
          //child: ,
        ),
      ),
    );
  }

  Widget roomTile(BuildContext context, MatrixRoom room) {
    return Tile(
        leading: room.avatarUrl.bindValue((_, v) => v == null ? Container(color: Colors.blue) : Image.network(v)),
        title: room.displayName.bindValue((_, v) => TileTitleText(v.ellipsis(20))),
        stamp: room.lastSeen.bindValue((_, v) => TileStampText(v)),
        body: room.lastMessage.bindValue((_, v) => TileBodyText(v)),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              room.sync();
              return RoomView(room: room);
            })));
  }

  Widget build(BuildContext context) {
    return Paper(
      child: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: 96),
                ]),
              ),
              context.get<Account>().rooms.bindValue((context, rooms) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => ListBody(
                            children: <Widget>[
                              roomTile(context, rooms[index]),
                              Container(
                                margin: rooms.length == index + 1 ? null : EdgeInsets.only(left: 64),
                                height: 1,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                      childCount: rooms.length))),
              SliverList(delegate: SliverChildListDelegate([Container(height: 666)])),
//              SliverFillRemaining(
//                child: Container(height: 200),
//              ),
            ],
          ),
          Positioned(top: 0, left: 0, right: 0, child: buildTop(context)),
        ],
      ),
    );
  }
}
