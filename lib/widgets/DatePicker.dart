import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  DatePicker({Key key, this.updateState}) : super(key: key);
  final updateState;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2010),
          lastDate: DateTime(2030),
        ).then((date) {
          if (date != null) {
            if (widget.updateState != null) {
              widget.updateState(date);
            }
            setState(() {
              _dateTime = date;
            });
          }
        });
      },
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            _dateTime.toString(),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}