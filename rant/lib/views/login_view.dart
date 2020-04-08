import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/ux/ux.dart';
import 'package:scoped/scoped.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailField =
      TextEditingController(text: "agrapine");
  final TextEditingController passwordField =
      TextEditingController(text: "TzH2O1985");

  Widget buildLogin(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,// Color(0xFF191C26),
          boxShadow: [
            BoxShadow(blurRadius: 6, spreadRadius: 6, color: Colors.black12)
          ],
          borderRadius: BorderRadius.circular(16)),
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Transform.translate(offset: Offset(48, -48), child: RantHeader()),
          Transform.translate(
              offset: Offset(0, -28),
              child: Text('RANTER',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22))),
          EmailField(controller: emailField),
          PasswordField(controller: passwordField),
          SizedBox(height: 64),
          FlatButton(
            color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 48),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Text(
              "LOGIN",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => context
                .get<Account>()
                .login(emailField.text, passwordField.text),
          ),
          SizedBox(height: 64),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
        child: CustomPaint(
          painter: LoginCanvasPainter(),
          child: ListView(
            padding: EdgeInsets.all(48),
            children: <Widget>[
              SizedBox(height: 32),
              buildLogin(context),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginCanvasPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..addPolygon([Offset(0, 0), Offset(280, 0), Offset(0, 200)], true)
      ..addPolygon([
        Offset(size.width, size.height),
        Offset(size.width, size.height - 180),
        Offset(size.width - 280, size.height),
      ], true)
      ..close();

    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.black.withAlpha(60)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 20));

    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
