import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:rant/ux/ux.dart';
import 'package:scoped/scoped.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailField =
      TextEditingController(text: "alex@swipelab.co");
  final TextEditingController passwordField =
      TextEditingController(text: "password");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomPaint(
          painter: LoginCanvasPainter(),
          child: ListView(
            padding: EdgeInsets.all(48),
            children: <Widget>[
              SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 6, spreadRadius: 0, color: Colors.black26)
                    ],
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Transform.translate(
                        offset: Offset(48, -48), child: RantLogo()),
                    Transform.translate(
                        offset: Offset(0, -28),
                        child: Text('RANTER',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22))),
                    EmailField(controller: emailField),
                    PasswordField(controller: passwordField),
                    SizedBox(height: 48),
                    FlatButton(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        "login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () => Scope.get<Account>(context)
                          .login(emailField.text, passwordField.text),
                    )
                  ],
                ),
              ),
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
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 3 * 0.57735 + 0.5));

    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
