import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/ghost/ghost_client.dart';
import 'package:rant/settings.dart';
import 'package:rant/util/branch.dart';
import 'package:rant/util/focus_fixer.dart';
import 'package:rant/util/storage.dart';
import 'package:rant/views/login_screen.dart';
import 'package:rant/views/home_screen.dart';
import 'package:scoped/scoped.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'util/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await global.init();
  var settings = Settings.production();

  final sharedPreferences = await SharedPreferences.getInstance();

  final store = Store();
  store.add(sharedPreferences);
  store.add(Storage(store));
  store.add(settings);
  store.add(GhostClient(store: store, baseUrl: settings.ghost.baseUrl));
  store.add(Account(store));

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
          fontFamily: 'Helvetica Neue',
          appBarTheme: Theme.of(context).appBarTheme.copyWith(elevation: 0),
        ),
        home: FluidBuilder<Ref<bool>>(
          fluid: Scope.get<Account>(context).isAuthenticated,
          builder: (context, s) => Branch(
            showSecondary: s.value,
            primary: (context) => LoginScreen(),
            secondary: (context) => HomeScreen(),
          ),
        ),
      ),
    );
  }
}
