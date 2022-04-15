import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'current_weather_default.dart';
import 'custom_appbar.dart';
import 'current_weather_format.dart';

class WeatherStatus extends StatefulWidget {
  const WeatherStatus({Key? key, required this.check}) : super(key: key);

  final bool check;

  @override
  _WeatherStatusState createState() => _WeatherStatusState();
}

class _WeatherStatusState extends State<WeatherStatus> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _icon = "";
  num _temp = 0;
  String _status = "";
  String _dayOfWeek = "";
  String _date = "";
  num _wind = 0.0;
  num _pop = 0.0;
  num _pressure = 0;
  num _humidity = 0;

  String toUpperCase (String str) {
    var result = str.split('');
    String strResult = "";

    int unitString = str[0].codeUnitAt(0);

    
    if(String.fromCharCode(unitString) != ' ' && unitString >= 97) {
      result[0] = String.fromCharCode(unitString - 32);
    } else {
      result[0] = S[0];
    }
    for (int i = 0; i < result.length; i++) {
      strResult += result[i];
    }

    return strResult;
    
  }

  void _onInit() async {
    var client = Client();
    final SharedPreferences prefs = await _prefs;
    try {

      var response = await client.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/onecall?lat=20.9870268&lon=105.8497007&appid=07477f5316bccf0a26594fcf75e042c1&units=metric&exclude=minutely'));
      var currentWeather = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      
      var icon = currentWeather['current']['weather'][0]['icon'] as String;
      var temp = currentWeather['current']['temp'] as num;
      var status =
          currentWeather['current']['weather'][0]['description'] as String;
      var wind = currentWeather['current']['wind_speed'] as num;
      var pop = currentWeather['daily'][0]['pop'] as num;
      var pressure = currentWeather['current']['pressure'] as num;
      var humidity = currentWeather['current']['humidity'] as num;
      setState(() {
        _icon = icon;
        DateTime date = DateTime.now();
        var convertDay = formatDate(date, [DD]);
        var convertDate = formatDate(DateTime.now(), [M, ' ', dd]);
        _dayOfWeek = convertDay;
        _date = convertDate;
        _wind = wind;
        _pop = pop * 100;
        _pressure = pressure;
        _humidity = humidity;
        _status = toUpperCase(status);
        final String? getUnitTemperature = prefs.getString("Unit Temperature");
        if ( getUnitTemperature == "F") {
          var tempUnitF = (temp * 1.8) + 32;
          _temp = tempUnitF;
        }
        else {
          _temp = temp;
        }
          
      });
    } finally {
      client.close();
    }
  }


  @override
  void initState() {
    super.initState();

    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    final _tile = widget.check
        ? RowComponent(
            icon: _icon,
            temp: _temp.toInt(),
            status: _status,
            date: _date,
            dayOfWeek: _dayOfWeek,
          )
        : ColumnComponent(
            icon: _icon,
            temp: _temp.toInt(),
            status: _status,
            date: _date,
            dayOfWeek: _dayOfWeek,
          );
    return Container(
      height: widget.check ? 353.0 : 565.0,
      width: 358.0,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF62B8F6), Color(0xFF2C79C1)],
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: [
          const SizedBox(height: 15),
          const CustomAppBar(),
          _tile,
          const Divider(
            height: 30,
            color: Colors.white,
            thickness: 1.0,
            indent: 15,
            endIndent: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, top: 5.0, right: 45.0),
            child: Row(
              children: [
                Image.asset('assets/icons/ic_paper_plane.png'),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$_wind km/h',
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                    const SizedBox(height: 3),
                    const Text('Wind',
                        style: TextStyle(fontSize: 12.0, color: Colors.white))
                  ],
                ),
                const SizedBox(width: 60.0),
                Image.asset('assets/icons/ic_cloud_rain.png'),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${_pop.toInt()}%',
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.white)),
                    const SizedBox(height: 3),
                    const Text('Chance of rain',
                        style: TextStyle(fontSize: 12.0, color: Colors.white))
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 30.0, right: 40.0),
            child: Row(
              children: [
                Image.asset('assets/icons/ic_thermometer.png'),
                const SizedBox(width: 12.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$_pressure mbar',
                      style:
                          const TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                    const SizedBox(height: 3),
                    const Text('Pressure',
                        style: TextStyle(fontSize: 12.0, color: Colors.white))
                  ],
                ),
                const SizedBox(width: 67.0),
                Stack(children: [
                  Image.asset('assets/icons/ic_humidity.png'),
                  Positioned(
                    top: 17.7,
                    left: 9.7,
                    child: Image.asset('assets/icons/ic_extra.png'),
                  )
                ]),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$_humidity%',
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.white)),
                    const SizedBox(height: 3),
                    Text('Humidity $_humidity%',
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.white))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
