import 'package:flutter/material.dart';

///UI design for location
class Location extends StatelessWidget {
  ///holds the city entered by the user
  final String city;

  Location({Key key, @required this.city})
      : assert(city != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      city,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
