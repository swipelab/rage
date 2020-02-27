import 'package:flutter/material.dart';
import 'package:rant/calls/call_directory.dart';
import 'package:rant/calls/call_overlay.dart';
import 'package:rant/calls/lobby_page.dart';
import 'package:rant/experimental/call_sample.dart';
import 'package:scoped/scoped.dart';

void main() => runApp(Scope(
      child: MyApp(),
      store: Store()..add(CallDirectory()),
    ));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Stack(
        children: <Widget>[
          CallSample(),
        ],
      ),
    );
  }
}
