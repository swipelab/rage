enum MxDir {
  /// backward
  b,

  /// forward
  f,
}

String mxDirString(MxDir dir) {
  switch (dir) {
    case MxDir.b:
      return 'b';
    case MxDir.f:
      return 'f';
    default:
      return null;
  }
}
