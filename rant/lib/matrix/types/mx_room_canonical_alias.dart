class MxRoomCanonicalAlias {
  final String alias;

  MxRoomCanonicalAlias({this.alias});

  static MxRoomCanonicalAlias fromJson(Map<String, dynamic> json) => MxRoomCanonicalAlias(
    alias: json['alias'],
  );
}