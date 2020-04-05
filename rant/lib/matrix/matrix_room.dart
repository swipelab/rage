import 'package:rant/matrix/types/mx_text.dart';
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
  

  MxRoomName _name;
  MxRoomCanonicalAlias _canonical;
  MxRoomAvatar _avatar;
  final Map<String, MxRoomMember> _members = {};

  MxRoomMember get _another => _members.entries.firstWhere((x) => x.key != matrix.self, orElse: () => null)?.value;

  final Store store;
  final Matrix matrix;

  MatrixRoom({this.store, this.roomId}) : matrix = store.get<Matrix>();

  Ref<List<MxEvent>> messages = Ref([]);

  Future sync() async {
    displayName.value = roomId;
    var states = await matrix.client.getRoomState(roomId: roomId);

    states.forEach(handleEvent);

    _update();

  }

  _update() {
    _updateDisplayName();
    _updateAvatarUrl();
  }

  handleEvent(MxEvent e) {
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
      _members[e.stateKey] = e.content;
      _update();
    } else if(e.content is MxText) {
      timeline.value.add(e);
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
}
