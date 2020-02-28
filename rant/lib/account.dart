import 'util/util.dart';

class Account {
  final Ref<bool> isAuthenticated = Ref(false);

  Future<void> login(String address, String password) async {
    isAuthenticated.value = true;
  }
}