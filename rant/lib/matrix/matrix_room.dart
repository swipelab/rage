import 'package:rant/matrix/types/mx_dir.dart';
import 'package:rant/matrix/types/mx_image.dart';
import 'package:rant/matrix/types/mx_text.dart';
import 'package:rant/matrix/types/mx_video.dart';
import 'package:scoped/scoped.dart';

import 'matrix.dart';
import 'types/mx_event.dart';
import 'types/mx_room_avatar.dart';
import 'types/mx_room_member.dart';
import 'types/mx_room_canonical_alias.dart';
import 'types/mx_room_name.dart';

class MatrixRoom {
  final String roomId;

  final Ref<String> displayName = Ref('');
  final Ref<String> avatarUrl = Ref();
  final Ref<String> lastMessage = Ref('');
  final Ref<String> lastSeen = Ref('');

  final Ref<List<MxEvent>> timeline = Ref([]);

  final Ref<String> start;
  final Ref<String> end;
  final Ref<bool> sinceCreation = Ref(false);

  MxRoomName _name;
  MxRoomCanonicalAlias _canonical;
  MxRoomAvatar _avatar;
  final Map<String, MxRoomMember> members = {};

  MxRoomMember get _another => members.entries
      .firstWhere((x) => x.key != matrix.self, orElse: () => null)
      ?.value;

  final Store store;
  final Matrix matrix;

  MatrixRoom({this.store, this.roomId, String start, String end})
      : matrix = store.get<Matrix>(),
        start = Ref(start),
        end = Ref(end);

  Ref<List<MxEvent>> messages = Ref([]);

  _update() {
    _updateDisplayName();
    _updateAvatarUrl();
  }

  handleEvent(MxEvent e, {MxDir dir = MxDir.f}) {
    if (e.content is MxRoomName) {
      _name = e.content;
      _update();
    } else if (e.content is MxRoomAvatar) {
      _avatar = e.content;
      _update();
    } else if (e.content is MxRoomCanonicalAlias) {
      _canonical = e.content;
      _update();
    } else if (e.content is MxRoomMember) {
      members[e.stateKey] = e.content;
      _update();
    } else if (e.content is MxText || e.content is MxImage) {
      if (dir == MxDir.f) {
        timeline.value.insert(0, e);
      } else {
        timeline.value.add(e);
      }
      timeline.notify();
    }
  }

  _updateDisplayName() {
    displayName.value = [_name?.name, _canonical?.alias, _another?.displayName]
        .firstWhere((x) => x?.isNotEmpty == true, orElse: () => 'TODO:');
  }

  _updateAvatarUrl() {
    avatarUrl.value = Matrix.mxcToUrl(_avatar?.url);
  }

  Ref<int> workers = Ref(0);

  Future<void> sendMessage({String body}) async {
    workers.value++;
    await matrix.putRoomMessage(roomId: roomId, body: body);
    workers.value--;
  }

  bool _loading = false;

  Future<void> loadMore() async {
    if (sinceCreation.value) return;

    if (_loading) return;
    _loading = true;

    workers.value++;
    final slice = await matrix.client
        .getRoomMessages(roomId: roomId, dir: MxDir.b, from: start.value);

    slice.chunk.forEach((e) => handleEvent(e, dir: MxDir.b));

    start.value = slice.end;

    if (slice.end == slice.start) sinceCreation.value = true;

    _loading = false;

    workers.value--;
  }
}
