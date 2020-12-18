import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

bool _lights = false;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoSwitch(
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });
              },
            ),
            FittedBox(
              child: LiteRollingSwitch(
                //initial value
                value: true,
                textOn: ' ON ',
                textOff: ' OFF ',
                colorOn: Colors.green,
                colorOff: Colors.red[700],
                iconOn: Icons.nights_stay,
                iconOff: Icons.wb_sunny,
                //textSize: 40.0,
                onChanged: (bool state) {
                  //Use it to manage the different states
                  print('Current State of SWITCH IS: $state');
                },
              ),
            ),
            Container(
              width: 75,
              height: 60,
              child: DayNightSwitcher(
                isDarkModeEnabled: _lights,
                onStateChanged: (isDarkModeEnabled) {
                  setState(() {
                    _lights = !_lights;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
