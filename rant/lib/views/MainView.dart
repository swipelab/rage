import 'package:flutter/material.dart';

class MainView extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RANTER"),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('alias'),
              //accountEmail: Text('email'),
              onDetailsPressed: () {},
//              currentAccountPicture: BubbleAvatar.plain(
//                selected: true,
//                alias: self.alias,
//                avatar: self.avatar,
//              ),
            ),

          ],
        ),
      ),
      body: Container(),
    );
  }
}
