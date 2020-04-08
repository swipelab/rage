import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/global.dart';
import 'package:rant/util/widget_switch.dart';
import 'package:rant/util/focus_fixer.dart';
import 'package:rant/views/login_view.dart';
import 'package:rant/views/home_view.dart';
import 'package:scoped/scoped.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initStore();

  runApp(Scope(store: store, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FocusFixer(
      child: MaterialApp(
        title: 'RANTER',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          primaryColorDark: Colors.black,
          primaryColorLight: Colors.black,
          accentColor: Color(0xFFFFF9EB),
          brightness: Brightness.light,
          fontFamily: 'SF Pro Text',
          appBarTheme: Theme.of(context).appBarTheme.copyWith(
                elevation: 0,
                color: Colors.black54,
              ),
          //scaffoldBackgroundColor: Color(0xFF191C26),
        ),
        home: context.get<Account>().isAuthenticated.bindValue(
            (context, value) => WidgetSwitch(index: value ? 1 : 0, items: [
                  (context) => LoginView(),
                  (context) => HomeView(),
                ])),
      ),
    );
  }
}
