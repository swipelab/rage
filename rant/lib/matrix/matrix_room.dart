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
  final Ref<String> lastMessage = Ref('');
  final Ref<String> lastSeen = Ref('');

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

    return;
  }

  String resolveAlias(List<MxEvent> states) {
    final name = states.firstWhere((x) => x.content is MxRoomName, orElse: () => null);
    if (name != null) {
      final content = name.content as MxRoomName;
      if (content.name?.isNotEmpty == true) return content.name;
    }
    final canonical = states.firstWhere((x) => x.content is MxRoomCanonicalAlias, orElse: () => null);
    if (canonical != null) {
      final content = canonical.content as MxRoomCanonicalAlias;
      if (content.alias?.isNotEmpty == true) return content.alias;
    }
    final member = states.firstWhere((x) => x.content is MxRoomMember && x.userId != matrix.self, orElse: () => null);
    if (member != null) {
      final content = member.content as MxRoomMember;
      if (content.displayName?.isNotEmpty == true) return content.displayName;
    }
    return 'TODO:';
  }

  handleEvent(MxEvent e) {
    if (e.content is MxRoomName) {
      _name = e.content;
      _updateDisplayName();
    } else if (e.content is MxRoomAvatar) {
      _avatar = e.content;
    } else if (e.content is MxRoomCanonicalAlias) {
      _canonical = e.content;
      _updateDisplayName();
    } else if (e.content is MxRoomMember) {
      _members[e.userId] = e.content;
      _updateDisplayName();
    }
  }

  _updateDisplayName() {
    displayName.value = [_name?.name, _canonical?.alias, _another?.displayName]
        .firstWhere((x) => x?.isNotEmpty == true, orElse: () => null);
  }
}
