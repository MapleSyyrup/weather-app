import 'package:flutter/material.dart';

class LastUpdate extends StatelessWidget {
  final DateTime dateTime;

  const LastUpdate({Key key, this.dateTime})
      : assert(dateTime != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Updated: ${TimeOfDay.fromDateTime(dateTime).format(context)}',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w200,
        color: Colors.white,
      ),
    );
  }
}
