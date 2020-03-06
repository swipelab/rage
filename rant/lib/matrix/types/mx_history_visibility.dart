enum MxHistoryVisibility {
  invited,
  joined,
  shared,
  world_readable,
}

MxHistoryVisibility mxHistoryVisibility(String value) =>
    MxHistoryVisibility.values.firstWhere((x) => x.toString() == 'MxHistoryVisiblity.$value');