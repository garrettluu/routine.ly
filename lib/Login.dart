import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.0, 0.0),
          end: Alignment(0.0, 1.0),
          colors: <Color>[
            const Color(0xFF43E97B),
            const Color(0xFF38F9D7),
          ],
        ),
      ),
    );
  }
}
