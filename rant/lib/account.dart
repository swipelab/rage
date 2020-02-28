import 'package:rant/ghost/ghost_api.dart';
import 'package:scoped/scoped.dart';

import 'util/util.dart';

class Account {
  Store _store;

  Account(this._store);

  final Ref<bool> isAuthenticated = Ref(false);

  Future<void> login(String email, String password) async {
    final resp = await _store.get<GhostApi>().login(email, password);
    isAuthenticated.value = true;
  }

  Future<void> logout() async {
    isAuthenticated.value = false;
  }
}
