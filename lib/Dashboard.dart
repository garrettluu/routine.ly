import 'package:flutter/material.dart';
import 'package:routinely/main.dart';

import 'EditTask.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 24),
            Text(
              "Hello, Garrett",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Rubik",
                fontSize: 24,
              )
            ),
            SizedBox(height: 24),
            Text(
              "Today is going to be a busy day",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 68),
            MyApp.firebase.getTaskList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EditTask()),
          );
        },
        tooltip: 'New task',
        child: Icon(Icons.add),
      ),
    );
  }
}