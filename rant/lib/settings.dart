class Settings {
  final GhostSettings ghost;

  static Settings production() {
    return Settings(ghost: GhostSettings(baseUrl: "https://rage.swipelab.co/"));
  }

  static Settings local() {
    return Settings(ghost: GhostSettings(baseUrl: "https://127.0.0.1:5001/"));
  }

  Settings({this.ghost});
}

class GhostSettings {
  final String baseUrl;

  GhostSettings({this.baseUrl});
}
