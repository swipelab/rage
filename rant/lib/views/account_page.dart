import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/util/ref.dart';
import 'package:rant/ux/bubble_avatar.dart';
import 'package:scoped/scoped.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final account = Scope.get<Account>(context);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: Text('ACCOUNT'),
        ),
        child: Material(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 24, bottom: 24),
                child: context.ref(account.profile,
                    (context, s) => BubbleAvatar.plain(alias: s.alias, avatar: s.avatar, radius: 48, selected: true)),
              ),
              Divider(),
              ListTile(
                title: context.ref(account.profile, (context, s) => Text(s.alias)),
                subtitle: Text('alias'),
              ),
              ListTile(
                title: Text('Logout'),
                onTap: () => account.logout(),
              )
            ],
          ),
        ));
  }
}
