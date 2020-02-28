import 'package:scoped/scoped.dart';

import 'util/util.dart';

class Account {
  Store store;

  Account(this.store);

  final Ref<bool> isAuthenticated = Ref(false);

  Future<void> login(String address, String password) async {
    isAuthenticated.value = true;
  }

  Future<void> logout() async {
    isAuthenticated.value = false;
  }
}
