import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/util/ref.dart';
import 'package:scoped/scoped.dart';

extension on Ref<T> {

}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final account = Scope.get<Account>(context);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: Text('ACCOUNT'),
        ),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: account.profile.,
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () => account.logout(),
            )
          ],
        ));
  }
}
