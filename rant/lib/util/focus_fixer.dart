import 'package:flutter/widgets.dart';

class FocusFixer extends StatelessWidget {
  final Widget child;

  FocusFixer({this.child});

  //taping outside of a focusable scope should un-focus, to hide the keyboard
  void _fixFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(onTap: () => _fixFocus(context), child: child);
  }
}
