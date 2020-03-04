class Settings {
  final GhostSettings ghost;
  final MatrixSettings matrix;

  static Settings production() {
    return Settings(
      ghost: GhostSettings(host: 'rage.swipelab.co'),
      matrix: MatrixSettings(baseUrl: 'https://matrix-client.matrix.org'),
    );
  }

  static Settings local() {
    return Settings(
      ghost: GhostSettings(host: '127.0.0.1:5001'),
      matrix: MatrixSettings(baseUrl: 'https://matrix-client.matrix.org'),
    );
  }

  Settings({this.ghost, this.matrix});
}

class GhostSettings {
  final String host;

  String get baseUrl => 'https://$host/';

  String rocketUrl(String path) => 'wss://$host/rocket/$path';

  GhostSettings({this.host});
}

class MatrixSettings {
  final String baseUrl;

  MatrixSettings({this.baseUrl});
}
