import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/ux/ux.dart';
import 'package:scoped/scoped.dart';

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RANTER"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Bond(
                fluid: Scope.get<Account>(context).profile,
                builder: (context, s) => UserAccountsDrawerHeader(
                      accountName: Text(s.value.alias),
                      //accountEmail: Text('email'),
                      onDetailsPressed: null,
                      currentAccountPicture: BubbleAvatar.plain(
                        selected: true,
                        alias: s.value.alias,
                        avatar: s.value.avatar,
                      ),
                    )),
            Expanded(
              child: Container(),
            ),
            Divider(),
            ListTile(
              title: Text("Logout"),
              onTap: () => Scope.get<Account>(context).logout(),
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}
