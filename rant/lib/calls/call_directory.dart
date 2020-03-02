import 'package:scoped/scoped.dart';

import 'call.dart';

class CallDirectory {
  Ref<String> activeCallId = Ref<String>();
  final calls = <String, Call>{};

  Call get activeCall =>
      calls.containsKey(activeCallId.value) ? calls[activeCallId.value] : null;

  add({Call call}) {
    if (call == null) return;
    calls[call.id] = call;

    activeCallId.value = call.id;
  }

  remove({Call call}) {
    if (call == null || !calls.containsKey(call.id)) return;
    calls.remove(call.id);

    switchCall();
  }

  switchCall() {
    activeCallId.value = calls.length > 0 ? calls.keys.first : null;
  }
}
