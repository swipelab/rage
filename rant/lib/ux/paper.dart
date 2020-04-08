import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  final Widget child;

  Paper({this.child});

  Widget build(BuildContext context) => Material(child: child, color: Color(0xFFFFFF));
}

