enum MxMembership {
  invite,
  join,
  knock,
  leave,
  ban,
}

MxMembership mxMembership(String value) =>
    MxMembership.values.firstWhere((x) => x.toString() == 'MxMembership.$value');
