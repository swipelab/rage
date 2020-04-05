import 'dart:async';

import 'package:rant/account.dart';
import 'package:rant/bus.dart';
import 'package:rant/ghost/ghost.dart';
import 'package:rant/matrix/matrix.dart';
import 'package:rant/settings.dart';
import 'package:rant/util/storage.dart';
import 'package:scoped/scoped.dart';

var settings = Settings.production();
final bus = Bus();
final store = Store();

Completer<Store> _getStoreCompleter;

FutureOr<Store> initStore() async {
  if (_getStoreCompleter != null) return _getStoreCompleter.future;
  _getStoreCompleter = new Completer();

  store.clear();

  store.add(bus);
//  store.add(Firebase());
  store.add(Storage(store));
  store.add(settings);
  store.add(Ghost(store: store, baseUrl: settings.ghost.baseUrl));
  store.add(Matrix(store: store, baseUrl: settings.matrix.baseUrl));
  store.add(Account(store));

  _getStoreCompleter.complete(store);
  return store;
}
