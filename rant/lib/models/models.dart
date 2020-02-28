class LoginResponse {
  final String token;
  final RxUser user;
  LoginResponse({this.user, this.token});
}

class RxUser {
  final String userId;
  final String alias;
  final String avatar;
  final String isPublic;

  RxUser({this.userId, this.alias, this.avatar, this.isPublic});
}

class RxIdentity {
  final String medium;
  final String address;
  RxIdentity({this.medium, this.address});
}

class RxRoom {
  final String id;
  final String alias;
  final String isPublic;

  RxRoom({this.id, this.alias, this.isPublic});
}
