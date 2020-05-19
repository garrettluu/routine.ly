import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:routinely/main.dart';


import 'EditTaskDialog.dart';

class TaskWidget extends StatelessWidget {
  TaskWidget({Key key, this.title, this.time, this.due, this.id}) : super(key: key);
  final String title;
  final int time;
  final DateTime due;
  final String id;
  final DateFormat formatDate = new DateFormat.yMMMMd();

  @override
  Widget build(BuildContext context) {
    print(formatDate.format(due));
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (context) {
            return EditTaskDialog(id: this.id, title: this.title, due: this.due, time: this.time.toString());
          }
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 37.0, right: 37, bottom: 22),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    MyApp.firebase.deleteTask(id);
                  }
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )
                    ),
                    Text(
                      "Time: " + time.toString(),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Due: " + formatDate.format(due),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(7)),
            boxShadow: [
              BoxShadow (
                color: const Color.fromRGBO(0, 0, 0, 0.2),
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
              BoxShadow (
                color: const Color.fromRGBO(0, 0, 0, 0.19),
                offset: Offset(0, 3),
                blurRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}