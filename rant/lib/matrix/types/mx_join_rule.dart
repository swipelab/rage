enum MxJoinRule {
  public,
  knock,
  invite,
  private,
}

MxJoinRule mxJoinRule(String value) =>
    MxJoinRule.values.firstWhere((x) => x.toString() == 'MxJoinRule.$value');
