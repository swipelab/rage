import 'package:rant/ghost/ghost.dart';
import 'package:rant/matrix/matrix.dart';
import 'package:rant/models/models.dart';
import 'package:scoped/scoped.dart';

import 'util/util.dart';

class Account {
  Store _store;

  Account(this._store);

  final Ref<bool> isAuthenticated = Ref(false);
  final Ref<Profile> profile = Ref(Profile());
  final Ref<List<RxRoom>> rooms = Ref([]);

  Ghost get _ghost => _store.get<Ghost>();

  Matrix get _matrix => _store.get<Matrix>();

  Future<void> googleSignIn() async {}

  Future<void> login(String email, String password) async {
    try {
      final user = await _matrix.login(user: email, password: password);
      profile.value = await _matrix.getProfile(user: user.userId);

      await load();

      isAuthenticated.value = true;
    } catch (e) {
      throw e;
    }
  }

  Future<void> logout() async {
    await _store.get<Ghost>().logout();

    profile.value = Profile();
    isAuthenticated.value = false;
  }

  Future<void> load() async {
    final joinedRooms = await _matrix.getJoinedRooms();
    rooms.value = joinedRooms.map((r) => RxRoom(alias: r, id: r, fxMemberCount: 1)).toList();
  }

  Future<void> loadRoom(RxRoom room) async {
    final state = await _matrix.getRoomState(room: room.id);
  }
}
