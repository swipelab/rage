import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'account_view.dart';
import 'chat_view.dart';

class HomeView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoTabScaffold(
        backgroundColor: Color(0xFF191C26),
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.black.withOpacity(0.3),
          items: [
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.solidComments)),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.dragon)),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cog))
          ],
        ),
        tabBuilder: (BuildContext context, index) {
          switch (index) {
            case 0:
              return ChatView();
            case 1:
              return Container();
            default:
              return AccountView();
          }
        },
      ),
    );
  }
}
