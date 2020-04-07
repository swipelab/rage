import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/ux/bubble_avatar.dart';
import 'package:rant/ux/paper.dart';
import 'package:scoped/scoped.dart';

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final account = context.get<Account>();

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: Text(
            'ACCOUNT',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black.withOpacity(0.3),
        ),
        child: Paper(
          child: ListView(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.only(top: 24, bottom: 24),
                  child: account.profile.bindValue((context, s) =>
                      BubbleAvatar.plain(alias: s.alias, avatar: s.avatar, radius: 48, selected: true))),
              Divider(),
              ListTile(
                title: account.profile.bindValue((context, s) => Text(s.alias)),
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
