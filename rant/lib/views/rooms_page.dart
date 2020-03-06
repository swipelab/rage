import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/matrix/matrix_room.dart';
import 'package:rant/models/models.dart';
import 'package:scoped/scoped.dart';

class RoomsPage extends StatefulWidget {
  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  initState() {
    super.initState();
  }

  Widget buildRoomTile(BuildContext context, MatrixRoom room) => ListTile(
        leading: Icon(Icons.group),
        title: room.displayName.bindValue((_, v) => Text(v)),
        subtitle: Text('0 members'),
        onTap: () {},
      );

  Widget build(BuildContext context) {
    final account = Scope.get<Account>(context);
    return CupertinoPageScaffold(
      child: Material(
        child: CustomScrollView(slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text('RANTER'),
          ),
          account.rooms.bindValue((context, s) => SliverList(
                delegate: SliverChildBuilderDelegate((context, index) => buildRoomTile(context, s[index]),
                    childCount: s.length),
              )),
          SliverFillRemaining()
        ]),
      ),
    );
  }
}
