
import 'mx_type.dart';

class MxRoomCanonicalAlias with MxType {
  String get type => 'm.room.canonical_alias';

  final String alias;

  MxRoomCanonicalAlias({this.alias});

  static MxRoomCanonicalAlias fromJson(Map<String, dynamic> json) => MxRoomCanonicalAlias(
    alias: json['alias'],
  );

}