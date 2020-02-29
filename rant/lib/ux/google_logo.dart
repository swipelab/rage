import 'package:flutter/material.dart';

class GoogleLogo extends StatelessWidget {
  final double size;

  GoogleLogo({this.size = 24});

  Widget build(BuildContext context) => Image(image: AssetImage('assets/google-logo.png'), height: size, width: size);
}
