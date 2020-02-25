import 'package:flutter/material.dart';
import 'package:rant/calls/call_directory.dart';
import 'package:rant/util/util.dart';
import 'package:scoped/scoped.dart';

import 'call.dart';

class CallOverlay extends StatelessWidget {
  Widget build(BuildContext context) {
    return FluidBuilder<Ref<String>>(
      fluid: Scope.get<CallDirectory>(context).activeCallId,
      builder: (context, s) => s.value == null
          ? Container(
              color: Colors.red,
              child: Center(
                child: MaterialButton(
                  child: Text("press"),
                  onPressed: () {
                    Scope.get<CallDirectory>(context).add(call: Call(id: "aa"));
                  },
                ),
              ),
            )
          : Container(color: Colors.green),
    );
  }
}
