import 'package:flutter/material.dart';
import 'package:weather_app/screens/settings/components/temperature_unit.dart';

import 'components/atmospheric_pressure_unit.dart';
import 'components/custom_appbar_setting.dart';
import 'components/wind_speed_unit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 766.0,
        width: 358.0,
        margin: const EdgeInsets.fromLTRB(25.0, 25.0, 15.0, 15.0),
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF62B8F6), Color(0xFF2C79C1)],
          ),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomAppbarSetting(),
            SizedBox(height: 30.0),
            Text(
              'UNIT',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            SizedBox(height: 20.0),
            TemperatureUnitRow(),
            SizedBox(height: 20.0),
            WindSpeedUnitRow(),
            SizedBox(height: 20.0),
            AtmosphericPressureUnitRow(),
            Divider(
              height: 80,
              color: Colors.white,
              thickness: 1.0,
            ),
            Text(
              'EXTRA',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'About',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Privacy policy',
              style: TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
