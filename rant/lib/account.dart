import 'package:rant/ghost/ghost_client.dart';
import 'package:rant/models/models.dart';
import 'package:scoped/scoped.dart';

import 'util/util.dart';

class Account {
  Store _store;

  Account(this._store);

  final Ref<bool> isAuthenticated = Ref(false);
  final Ref<RxUser> profile = Ref(RxUser.empty());
  final Ref<List<RxRoom>> rooms = Ref([]);

  GhostClient get _client => _store.get<GhostClient>();

  Future<void> login(String email, String password) async {
    try {
      final resp = await _client.login(email, password);
      profile.value = resp.user;
      isAuthenticated.value = true;

      load();
    } catch (e) {}
  }

  Future<void> logout() async {
    await _store.get<GhostClient>().logout();

    profile.value = RxUser.empty();
    isAuthenticated.value = false;
  }

  Future<void> load() async {
//    {
      rooms.value = await _client.getRoomsJoined();
//    } catch (e) {
//      rooms.value = [];
//    }
  }
}
