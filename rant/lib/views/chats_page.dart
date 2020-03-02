import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/models/models.dart';
import 'package:rant/ux/paper.dart';
import 'package:rant/ux/tile.dart';
import 'package:scoped/scoped.dart';

class ChatsModel {
  Ref<List<RxRoom>> rooms = Ref([
    RxRoom(alias: 'cristi'),
    RxRoom(
      alias: 'jouni',
    ),
    RxRoom(alias: 'ranters'),
    RxRoom(alias: 'kristiina'),
    RxRoom(alias: 'duckies'),
  ]);
}

final model = ChatsModel();

class ChatsPage extends StatelessWidget {
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

  Widget buildRoom(BuildContext context, RxRoom room) {
    return Tile(
      leading: Image.network('https://lh3.googleusercontent.com/a-/AAuE7mAnJ6r_-sm6_7Fr92fDEfaITA1Wo1HPSeBC2h54=s96-c'),
      title: TileTitleText(room.alias),
      stamp: TileStampText(room.lastSeen),
      body: TileBodyText(room.lastMessage),
    );
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
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) => null, childCount: model.rooms.value.length),
              ),
              model.rooms.bindValue((context, rooms) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => ListBody(
                            children: <Widget>[
                              buildRoom(context, rooms[index]),
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
