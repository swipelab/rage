import 'package:flutter/material.dart';

class Branch extends StatelessWidget {
  final bool showSecondary;
  final WidgetBuilder primary;
  final WidgetBuilder secondary;

  Branch({this.showSecondary, this.primary, this.secondary});

  Widget build(BuildContext context) =>
      (showSecondary == true
          ? secondary?.call(context)
          : primary?.call(context)) ??
      Container();
}
