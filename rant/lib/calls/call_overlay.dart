import 'package:flutter/material.dart';
import 'package:rant/calls/call_directory.dart';
import 'package:scoped/scoped.dart';

import 'call.dart';

class CallOverlay extends StatelessWidget {
  Widget build(BuildContext context) {
    return context.get<CallDirectory>().activeCallId.bindValue((context, s) => s == null
        ? Container(
            color: Colors.red,
            child: Center(
              child: MaterialButton(
                  child: Text("press"), onPressed: () => context.get<CallDirectory>().add(call: Call(id: "aa"))),
            ),
          )
        : Container(color: Colors.green));
  }
}
