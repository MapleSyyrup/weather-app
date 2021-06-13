import 'package:flutter/material.dart';

///temperature to be passed on the screen
class Temperature extends StatelessWidget {
  ///format of the displayed temperature
  int _formattedTemperature(double t) => t.round();

  ///weather temperature
  final double temperature;

  ///minimum weather temperature
  final double lowTemp;

  ///maximum weather temperature
  final double highTemp;

  const Temperature({
    Key key,
    @required this.temperature,
    @required this.lowTemp,
    @required this.highTemp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Text(
            '${_formattedTemperature(temperature)}°',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              'max: ${_formattedTemperature(highTemp)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
            Text(
              'min: ${_formattedTemperature(lowTemp)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
