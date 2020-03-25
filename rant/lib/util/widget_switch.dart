import 'package:flutter/material.dart';

class WidgetSwitch extends StatelessWidget {
  final int index;
  final List<WidgetBuilder> items;

  WidgetSwitch({this.index, this.items})
      : assert(index >= 0),
        assert(items != null),
        assert(items.length > index);

  Widget build(BuildContext context) =>
      items[index].call(context) ?? Container();
}
