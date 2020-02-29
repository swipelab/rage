class Settings {
  final GhostSettings ghost;

  static Settings production() {
    return Settings(ghost: GhostSettings(host: "rage.swipelab.co"));
  }

  static Settings local() {
    return Settings(ghost: GhostSettings(host: "127.0.0.1:5001"));
  }

  Settings({this.ghost});
}

class GhostSettings {
  final String host;

  String get baseUrl => 'https://$host/';

  String rocketUrl(String path) => 'wss://$host/rocket/$path';

  GhostSettings({this.host});
}
