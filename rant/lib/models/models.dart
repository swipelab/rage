class LoginResponse {
  final String token;
  final RxUser user;

  LoginResponse({this.user, this.token});
}

class RxUser {
  final String userId;
  final String alias;
  final String avatar;
  final bool isPublic;

  RxUser({this.userId, this.alias, this.avatar, this.isPublic});

  static RxUser fromJson(Map<String, dynamic> json) {
    return RxUser(userId: json["userId"], alias: json["alias"], avatar: json["avatar"], isPublic: json["isPublic"]);
  }

  static RxUser empty() {
    return RxUser();
  }
}

class RxIdentity {
  final String medium;
  final String address;

  RxIdentity({this.medium, this.address});
}

class RxRoom {
  final String id;
  final String alias;
  final bool isPublic;

  final int fxMembers;

  RxRoom({this.id, this.alias, this.isPublic, this.fxMembers = 0});

  static RxRoom fromJson(Map<String, dynamic> json) =>
      RxRoom(id: json['id'], alias: json['alias'], isPublic: json['isPublic'], fxMembers: json['fxMembers'] ?? 0);
}
