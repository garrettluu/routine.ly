import 'package:flutter/material.dart';

import 'main.dart';
import 'widgets/DatePicker.dart';
import 'widgets/IconInput.dart';

class EditTask extends StatefulWidget {
  EditTask({Key key}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final controllerName = TextEditingController();
  final controllerTime = TextEditingController();

  DateTime _due = DateTime.now();

  @override
  void dispose() {
    controllerName.dispose();
    controllerTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 56),
                  SizedBox(height: 24),
                  Text(
                    "What would you like\nto do?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontSize: 24,
                    ),
                  ),
                  IconInput(
                    icon: Icons.subject,
                    title: "Task Name",
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
                    input: TextField(
                      keyboardType: TextInputType.number,
                      controller: controllerTime,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter number of hours",
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              MyApp.firebase.createTask(
                name: controllerName.text,
                due: _due,
                time: int.parse(controllerTime.text),
              );
              Navigator.pop(context);
            },
            tooltip: 'Create',
            child: Icon(Icons.send),
          ),
        ),
      ),
    );
  }
}
