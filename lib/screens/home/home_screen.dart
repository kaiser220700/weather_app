import 'package:flutter/material.dart';

import 'components/list_daily_forecast.dart';
import 'components/list_hourly_forecast.dart';
import 'components/weather_status.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final _dailyForecast = isTapped
        ? GestureDetector(
            child: const DailyForecast(),
            onTap: () {
              setState(() {
                isTapped = false;
              });
            })
        : GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Forecast 7 Days',
                  style: TextStyle(fontSize: 16.0, color: Color(0xFF0A44E6)),
                ),
                Image.asset('assets/icons/ic_arrow-ios-downward-outline.png'),
              ],
            ),
            onTap: () {
              setState(() {
                isTapped = true;
              });
            },
          );
    return Scaffold(
        body: SingleChildScrollView(
      physics: isTapped
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(height: 60.0),
          WeatherStatus(check: isTapped),
          const SizedBox(height: 20.0),
          const HourlyForecast(),
          const SizedBox(height: 20.0),
          _dailyForecast,
          const SizedBox(height: 40.0),
        ],
      ),
    ));
  }
}
