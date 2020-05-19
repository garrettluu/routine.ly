import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:routinely/MyHomePage.dart';
import 'database/FirebaseTaskAdapter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final FirebaseTaskAdapter firebase = new FirebaseTaskAdapter(Firestore.instance);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF63FFA1),
        accentColor: Color(0xFF63FFA1),
        fontFamily: 'Raleway',
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
