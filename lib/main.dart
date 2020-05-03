import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:routinely/firebase.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
                    // Center is a layout widget. It takes a single child and positions it
                    // in the middle of the parent.
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

class Dashboard extends StatelessWidget {
  final Firebase firebase = new Firebase(Firestore.instance);
  Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Column(
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
          firebase.getTaskList(),
        ],
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

class Task extends StatelessWidget {
  String title;
  String time;
  String due;
  Task({Key key, this.title = '', this.time='', this.due=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 37.0, right: 37, bottom: 22),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.check),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Work on CSE 101 HW",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(
                    "Time: " + time,
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Due: " + due,
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
    );
  }
}

class EditTask extends StatelessWidget {
  const EditTask({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
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
              IconTextField(
                icon: Icons.subject,
                title: "Task Name",
                hint: "Enter a task name",
              ),
              IconTextField(
                icon: Icons.event,
                title: "Due Date",
                hint: "Enter a due date",
              ),
              IconTextField(
                icon: Icons.access_time,
                title: "Estimated time",
                hint: "Enter a time",
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        tooltip: 'Create',
        child: Icon(Icons.send),
      ),
    );
  }
}

class IconTextField extends StatefulWidget {
  IconData icon;
  String title;
  String hint;
  IconTextField({Key key, this.icon, this.title, this.hint}) : super(key: key);

  @override
   IconTextFieldState createState() =>  IconTextFieldState();
}

class  IconTextFieldState extends State<IconTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48, top: 32),
      child: Center(
        child: Column(
           children: <Widget>[
             Row(
               children: <Widget>[
                 Icon(widget.icon),
                 SizedBox(width: 10,),
                 Text(
                   widget.title,
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 18,
                   ),
                 )
               ],
             ),
             TextField(
               decoration: InputDecoration(
                 border: InputBorder.none,
                 hintText: widget.hint,
               ),
             )
           ],
        ),
      ),
    );
  }
}
