import 'package:uuid/uuid.dart';

class Id {
  static String newId() => Uuid().v4().replaceAll('-', '');
}