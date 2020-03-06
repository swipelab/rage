enum MxGuestAccess {
  can_join,
  forbidden,
}

MxGuestAccess mxGuestAccess(String value) =>
    MxGuestAccess.values.firstWhere((x) => x.toString() == 'MxGuestAccess.$value');
