import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: Text('RANTER'),
      ),
      child: ListView(
        children: <Widget>[for (final x in List.generate(100, (i) => i)) ListTile(title: Text('Hey $x'))],
      ),
    );
  }
}
