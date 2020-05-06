import 'package:flutter/material.dart';
import 'package:routinely/main.dart';

import 'DatePicker.dart';
import 'IconInput.dart';

class EditTaskDialog extends StatefulWidget {
  EditTaskDialog({Key key, this.title = '', this.due, this.time = '', @required this.id}) : super(key: key);
  final String title;
  final DateTime due;
  final String time;
  final String id;

  @override
  _EditTaskDialogState createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  DateTime _due;

  @override
  void initState() {
    super.initState();

    _due = widget.due;
  }

  @override
  Widget build(BuildContext context) {
    final controllerName = TextEditingController(
      text: widget.title,
    );
    final controllerTime = TextEditingController(
      text: widget.time,
    );
    return AlertDialog(
      title: Text('Edit Task'),
      content: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          IconInput(
            icon: Icons.subject,
            title: "Task Name",
            padding: EdgeInsets.all(0),
            input: TextField(
              controller: controllerName,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter a task name",
              ),
            )
          ),
          IconInput(
            icon: Icons.event,
            title: "Due Date",
            padding: EdgeInsets.all(0),
            input: DatePicker(
              updateState: (date) {
                setState(() {
                  _due = date;
                });
              },
            ),
          ),
          IconInput(
            icon: Icons.access_time,
            title: "Estimated time",
            padding: EdgeInsets.all(0),
            input: TextField(
              controller: controllerTime,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter an estimated time",
              ),
            )
          )
        ],
      ),
    ),
    actions: <Widget>[
      FlatButton(
        child: Text('ok'),
        onPressed: () {
          MyApp.firebase.updateTask(
            controllerName.text,
            int.parse(controllerTime.text),
            _due,
            widget.id
          );
          Navigator.of(context).pop();
        },
      ),
    ]
  );
  }
}