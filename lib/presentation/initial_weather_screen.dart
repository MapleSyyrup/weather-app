import 'package:flutter/material.dart';

class InitialWeather extends StatefulWidget {
  @override
  _InitialWeatherState createState() => _InitialWeatherState();
}

class _InitialWeatherState extends State<InitialWeather> {
  final _enterCity = TextEditingController();
  bool _focusChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Weather Today'),
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(63, 193, 192, 1), //blue green
                  Color.fromRGBO(29, 78, 137, 1), //yale blue
                ],
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            children: [
              SizedBox(height: 100.0),
              Image.asset(
                'assets/weather_today.png',
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10.0),
              Focus(
                child: TextField(
                  cursorColor: Color.fromRGBO(63, 193, 192, 1),
                  controller: _enterCity,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: _focusChange ? Color.fromRGBO(63, 193, 192, 1) : Colors.white,
                    ),
                    labelText: 'Enter City',
                    labelStyle: TextStyle(color: _focusChange ? Color.fromRGBO(63, 193, 192, 1) : Colors.white),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(63, 193, 192, 1),
                      ),
                    ),
                  ),
                ),
                onFocusChange: (hasFocus) {
                  setState(() {
                    _focusChange = hasFocus;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
