enum MxStatus {
  online,
  offline,
  unavailable,
}

MxStatus mxStatus(String value) => MxStatus.values.firstWhere((x) => x.toString() == 'MxStatus.$value');