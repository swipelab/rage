import 'package:scoped/scoped.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  final Store store;

  Storage(this.store);

  String getString(String key) => store.get<SharedPreferences>().getString(key);

  void setString(String key, String value) => store.get<SharedPreferences>().setString(key, value);
}
