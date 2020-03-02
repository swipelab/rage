import 'package:flutter/material.dart';

class Sx {
  static TextStyle get tileTitleStyle =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, height: 1.25, letterSpacing: -0.24);

  static TextStyle get tileStampStyle =>
      TextStyle(color: Color(0x80B9C4E1), fontSize: 12, height: 1.666, letterSpacing: -0.24);

  static TextStyle get tileBodyStyle =>
      TextStyle(fontSize: 15, height: 1.2, letterSpacing: -0.078, color: Color(0x80B9C4E1));

  static TextStyle get appBarTitleStyle =>
      TextStyle(fontSize: 24, height: 1.25, letterSpacing: -0.078, fontWeight: FontWeight.bold);
}

class TileTitleText extends StatelessWidget {
  final String text;

  TileTitleText(this.text);

  Widget build(BuildContext context) => Text(text, style: Sx.tileTitleStyle);
}

class TileStampText extends StatelessWidget {
  final String text;

  TileStampText(this.text);

  Widget build(BuildContext context) => Text(text, style: Sx.tileStampStyle);
}

class TileBodyText extends StatelessWidget {
  final String text;

  TileBodyText(this.text);

  Widget build(BuildContext context) => Text(text, style: Sx.tileBodyStyle);
}

class AppBarTitleText extends StatelessWidget {
  final String text;
  AppBarTitleText(this.text);
  Widget build(BuildContext context) => Text(text, style: Sx.appBarTitleStyle);
}

class Tile extends StatelessWidget {
  final Widget title;
  final Widget body;
  final Widget stamp;
  final Widget leading;
  final VoidCallback onTap;

  Tile({this.title, this.stamp, this.body, this.leading, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  child: Container(height: 60, width: 60, child: leading),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Expanded(
                child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: title,
                    ),
                    stamp,
                  ],
                ),
                body
              ],
            )),
          ],
        ),
      ),
    );
  }
}
