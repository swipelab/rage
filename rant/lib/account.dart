import 'package:rant/ghost/ghost.dart';
import 'package:rant/matrix/matrix.dart';
import 'package:rant/matrix/matrix_room.dart';
import 'package:rant/models/models.dart';
import 'package:scoped/scoped.dart';

import 'util/util.dart';

class Account {
  final Store store;

  Account(this.store);

  final Ref<bool> isAuthenticated = Ref(false);
  final Ref<Profile> profile = Ref(Profile());
  final Ref<List<MatrixRoom>> rooms = Ref([]);

  Ghost get _ghost => store.get<Ghost>();

  Matrix get _matrix => store.get<Matrix>();

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
    await store.get<Ghost>().logout();

    profile.value = Profile();
    isAuthenticated.value = false;
  }

  Future<void> load() async {
    final joinedRooms = await _matrix.getJoinedRooms();
    rooms.value = joinedRooms.map((x) => MatrixRoom(roomId: x, store: store)..sync()).toList();
  }
}
