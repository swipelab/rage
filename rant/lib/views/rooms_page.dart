import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/models/models.dart';
import 'package:scoped/scoped.dart';
import 'package:rant/util/util.dart';

class RoomsPage extends StatefulWidget {
  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  initState() {
    super.initState();
  }

  Widget buildRoomTile(BuildContext context, RxRoom room) => ListTile(
        leading: Icon(Icons.group),
        title: Text(room.alias),
        subtitle: Text('${room.fxMemberCount} members'),
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
          context.ref<List<RxRoom>>(
              account.rooms,
              (context, s) => SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) => buildRoomTile(context, s[index]),
                        childCount: s.length),
                  )),
          SliverFillRemaining()
        ]),
      ),
    );
  }
}
