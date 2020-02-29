import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/views/account_page.dart';
import 'package:rant/views/chats_page.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.conversation_bubble)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled))
        ],
      ),
      tabBuilder: (BuildContext context, index) {
        switch (index) {
          case 0:
            return ChatsPage();
          default:
            return AccountPage();
        }
      },
    );
  }
}
