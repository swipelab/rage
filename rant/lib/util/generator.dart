import 'dart:math';

const CHAR_Exclamation = 33;
const CHAR_Tilda = 126;
const CHAR_0 = 48;
const CHAR_9 = 57;
const CHAR_LOWER_A = 97;
const CHAR_LOWER_Z = 122;
const CHAR_UPPER_A = 65;
const CHAR_UPPER_Z = 90;

class Generator {
  static int randomInt(int from, int to) =>
      ((to - from) * Random().nextDouble()).toInt() + from;

  static String randomString(int length,
          {int from: CHAR_Exclamation, int to: CHAR_Tilda}) =>
      String.fromCharCodes(
          List.generate(length, (index) => randomInt(from, to)));

  static String randomNumeric(int length) =>
      randomString(length, from: CHAR_0, to: CHAR_9);
}
