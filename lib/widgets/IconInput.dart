import 'package:flutter/material.dart';

class IconInput extends StatefulWidget {
  IconInput({Key key, this.icon, this.title,
    this.padding = const EdgeInsets.only(left: 48, top: 32),
    this.defaultText = '',
    this.input}) : super(key: key); 
  final IconData icon;
  final String title;
  final String defaultText;
  final EdgeInsets padding; 
  final Widget input;

  @override
  IconInputState createState() =>  IconInputState();
}

class  IconInputState extends State<IconInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
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
             widget.input,
           ],
        ),
      ),
    );
  }
}