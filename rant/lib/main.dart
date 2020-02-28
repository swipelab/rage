import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/experimental/call_sample.dart';
import 'package:rant/ghost/ghost_api.dart';
import 'package:rant/ghost/ghost_service.dart';
import 'package:rant/settings.dart';
import 'package:rant/util/branch.dart';
import 'package:rant/util/focus_fixer.dart';
import 'package:rant/views/LoginView.dart';
import 'package:rant/views/MainView.dart';
import 'package:scoped/scoped.dart';

import 'util/util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //await global.init();
  var settings = Settings.production();

  final store = Store();
  store.add(GhostApi(baseUrl: settings.ghost.baseUrl));
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
          //primaryColor: white,
          //accentColor: Colors.black,
//            primaryColorDark: Colors.red,
//            primaryColorLight: Colors.red,
          //accentColor: Color(0xFFFFF9EB),
          fontFamily: 'Helvetica Neue',
          appBarTheme: Theme.of(context).appBarTheme.copyWith(elevation: 0),
        ),
        home: FluidBuilder<Ref<bool>>(
          fluid: Scope.get<Account>(context).isAuthenticated,
          builder: (context, s) => Branch(
            showSecondary: s.value,
            primary: (context) => LoginView(),
            secondary: (context) => MainView(),
          ),
        ),
      ),
    );
  }
}
