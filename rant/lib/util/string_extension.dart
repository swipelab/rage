import 'dart:math';

extension StringExtension on String {
  String ellipsis(int length, {String dots = '...'}) {
    if (this == null || this.length < length) return this;
    return this.substring(0, min(length - dots.length, this.length)) + dots;
  }
}
