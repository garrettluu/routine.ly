import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:routinely/Dashboard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget> [
            Container(
              child: Stack(
                children: <Widget> [
                  Positioned(
                    child: SvgPicture.asset("assets/blob.svg"),
                    left: 0,
                    top: 0,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 322,
                          height: 204,
                          child: Align(
                            alignment: Alignment(0.0, 0.8),
                            child: SvgPicture.asset("assets/logo.svg"),
                          ),
                        ),
                        Text(
                          "Task scheduling for\nbusy people",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 152),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SignInButton(
                            Buttons.Google,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Dashboard())
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
            ),
          ],
        ),
      );
  }
}