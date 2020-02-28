import 'package:flutter/material.dart';
import 'package:rant/experimental/call_sample.dart';
import 'package:rant/util/focus_fixer.dart';
import 'package:scoped/scoped.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await global.init();

  runApp(Scope(store: Store(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FocusFixer(
      child: MaterialApp(
        title: 'RANTER',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.red,
            primaryColorDark: Colors.red,
            primaryColorLight: Colors.red,
            accentColor: Color(0xFFFFF9EB),
            fontFamily: 'SF Pro Text'),
        home: CallSample(),
      ),
    );
  }
}
