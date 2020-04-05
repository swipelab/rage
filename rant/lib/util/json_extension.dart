typedef T FromJson<T>(Map<String, dynamic> json);

class Json {
  static List<T> list<T>(List json, FromJson<T> fromJson) => json == null
      ? []
      : json.cast<Map<String, dynamic>>().map(fromJson).toList();

  static Map<String, T> map<T>(Map json, FromJson<T> fromJson) => json == null
      ? {}
      : Map.fromEntries(
          json.entries.map((e) => MapEntry(e.key, fromJson(e.value))));
}

extension JsonExtension on Map<String, dynamic> {
  dynamic at<T>(String path, {dynamic defaultValue}) {
    try {
      dynamic current = this;
      path.split('.').forEach((segment) {
        final index = int.tryParse(segment);
        if (index != null && current is List<dynamic>) {
          current = current[index];
        } else if (current is Map<String, dynamic>) {
          current = current[segment];
        }
      });
      return current ?? defaultValue;
    } catch (error) {
      print(error);
      return defaultValue;
    }
  }
}
