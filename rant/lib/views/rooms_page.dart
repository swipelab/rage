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

  Widget build(BuildContext context) {
    final account = Scope.get<Account>(context);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: Text('RANTER'),
      ),
      child: ListView(
        children: <Widget>[
          context.ref<List<RxRoom>>(
              account.rooms,
              (context, s) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: s.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: Icon(Icons.group),
                        title: Text(s[index].alias),
                        subtitle: Text('${s[index].fxMembers} members'),
                      )))
        ],
      ),
    );
  }
}
