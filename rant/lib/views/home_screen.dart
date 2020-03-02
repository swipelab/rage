import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rant/settings.dart';
import 'package:rant/views/account_page.dart';
import 'package:rant/views/chats_page.dart';
import 'package:rant/views/lobby_page.dart';
import 'package:scoped/scoped.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoTabScaffold(
        backgroundColor: Color(0xFF191C26),
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.black.withOpacity(0.3),
          items: [
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.dragon)),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidComments)),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cog))
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          switch (index) {
            case 0:
              return LobbyPage(rocketUrl: Scope.get<Settings>(context).ghost.rocketUrl('lobby'));
            case 1:
              return ChatsPage();
            default:
              return AccountPage();
          }
        },
      ),
    );
  }
}
