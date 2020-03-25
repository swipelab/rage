import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/global.dart';
import 'package:rant/util/widget_switch.dart';
import 'package:rant/util/focus_fixer.dart';
import 'package:rant/views/chat_screen.dart';
import 'package:rant/views/login_screen.dart';
import 'package:rant/views/home_screen.dart';
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
          primaryColor: Colors.red,
          primaryColorDark: Colors.red,
          primaryColorLight: Colors.red,
          accentColor: Color(0xFFFFF9EB),
          brightness: Brightness.dark,
          fontFamily: 'SF Pro Text',
          appBarTheme: Theme.of(context).appBarTheme.copyWith(elevation: 0),
        ),
        routes: {
          '/': (_) => FluidBuilder<Ref<bool>>(
                fluid: Scope.get<Account>(context).isAuthenticated,
                builder: (context, s) => WidgetSwitch(index: s.value ? 1 : 0, items: [
                  (context) => LoginScreen(),
                  (context) => HomeScreen()
                ]),
              ),
          '/chats/:chatId': (_) => ChatScreen()
        },
        initialRoute: '/',
      ),
    );
  }
}
