import 'package:flutter/material.dart';
import 'package:rant/account.dart';
import 'package:scoped/scoped.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomPaint(
          painter: LoginCanvasPainter(),
          child: ListView(
            padding: EdgeInsets.all(48),
            children: <Widget>[
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
                    TextFormField(
                      decoration: InputDecoration(labelText: "email address"),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "password"),
                      obscureText: true,
                    ),
                    SizedBox(height: 48),
                    FlatButton(
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 48),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: Text(
                        "login",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () =>
                          Scope.get<Account>(context).login("", ""),
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
    canvas.drawLine(
        Offset(0, 0),
        Offset(100, 40),
        Paint()
          ..color = Colors.green
          ..strokeWidth = 3);
    canvas.drawPath(
        Path()
          ..addPolygon([Offset(0, 0), Offset(200, 0), Offset(0, 120)], true)
          ..addPolygon([
            Offset(size.width, size.height),
            Offset(size.width, size.height - 120),
            Offset(size.width - 300, size.height),
          ], true)
          ..close(),
        Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill);
  }

  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
