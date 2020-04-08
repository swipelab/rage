import 'dart:ui';

import 'package:flutter/material.dart';

import 'paper.dart';

class SliverPage extends StatelessWidget {
  final Widget top;
  final Widget bottom;

  final List<Widget> slivers;
  final EdgeInsets padding;

  SliverPage(
      {this.top,
      this.bottom,
      this.slivers,
      this.padding = const EdgeInsets.only(top: 96, bottom: 666)});

  Widget sizedSliver({double height}) =>
      SliverList(delegate: SliverChildListDelegate([SizedBox(height: height)]));

  Widget blurred(Widget child) {
    return ClipRect(
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10), child: child));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        CustomScrollView(
          slivers: []
            ..add(sizedSliver(height: padding.top))
            ..addAll(slivers)
            ..add(sizedSliver(height: padding.bottom)),
        ),
        if (top != null)
          Positioned(top: 0, left: 0, right: 0, child: blurred(top)),
        if (bottom != null)
          Positioned(bottom: 0, left: 0, right: 0, child: blurred(bottom)),
      ],
    ));
  }
}