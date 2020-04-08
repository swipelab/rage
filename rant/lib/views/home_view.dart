import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rant/util/widget_switch.dart';
import 'package:scoped/scoped.dart';

import 'account_view.dart';
import 'chat_view.dart';

class HomeView extends StatelessWidget {
  final Ref<int> _tab = Ref(0);

  Widget build(BuildContext context) {
    return _tab.bindValue(
      (context, index) => Scaffold(
        body: WidgetSwitch(
          index: index,
          items: [
            (context) => ChatView(),
            (context) => Container(),
            (context) => AccountView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => _tab.value = value,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidComments), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.dragon), title: Container()),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.cog), title: Container()),
          ],
        ),
      ),
    );
  }
}
