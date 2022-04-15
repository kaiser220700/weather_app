import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/models/houtly_custom.dart';

import 'hourly_forecast_card.dart';

class HourlyForecast extends StatefulWidget {
  const HourlyForecast({Key? key}) : super(key: key);

  @override
  _HourlyForecastState createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {
  List<HourlyCustom> hourlyCustom = [];
  String _dayOfWeek = "";
  String _date = "";
  void _onInit() async {
    final client = Client();
    var response = await client.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=20.9870268&lon=105.8497007&appid=07477f5316bccf0a26594fcf75e042c1&units=metric&exclude=minutely'));
    var currentWeather = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var hourly = currentWeather["hourly"];

    setState(() {
      DateTime date = DateTime.now();
      var convertDay = formatDate(date, [DD]);
      var convertDate = formatDate(DateTime.now(), [M, ' ', dd]);
      _dayOfWeek = convertDay;
      _date = convertDate;
      for (int i = 0; i < 23; i++) {
        if(i == 0) {
        var time = "Now"; 
        var image = hourly[i]["weather"][0]["icon"] as String;
        var temp = hourly[i]["temp"] as num;
        var feelsLike = hourly[i]['feels_like'] as num;
        var pop = hourly[i]['pop'] as num;
        hourlyCustom.add(
          HourlyCustom(
              time: time,
              image: image,
              temp: temp,
              feelsLike: feelsLike,
              pop: pop),
        );
        }
        else {
           var second = hourly[i]["dt"];
        var time = formatDate(
            DateTime.fromMillisecondsSinceEpoch(second * 1000), [HH, ":", nn]);
        var image = hourly[i]["weather"][0]["icon"] as String;
        var temp = hourly[i]["temp"] as num;
        var feelsLike = hourly[i]['feels_like'] as num;
        var pop = hourly[i]['pop'] as num;
        hourlyCustom.add(
          HourlyCustom(
              time: time,
              image: image,
              temp: temp,
              feelsLike: feelsLike,
              pop: pop),
        );
        }
        
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 15.0, top: 11.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(190, 10, 69, 230), Color(0xFF2C79C1)],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(_dayOfWeek,
                  style: const TextStyle(fontSize: 16.0, color: Colors.white)),
              Container(
                  margin: const EdgeInsets.only(left: 11, right: 11),
                  child: Image.asset('assets/icons/ic_rect.png')),
              Text(_date,
                  style: const TextStyle(fontSize: 16.0, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 10.0),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                hourlyCustom.length,
                (index) => Center(
                  child: HourlyForecastCard(
                    time: hourlyCustom[index].time,
                    image: hourlyCustom[index].image,
                    temp: hourlyCustom[index].temp,
                    feelsLike: hourlyCustom[index].feelsLike,
                    pop: hourlyCustom[index].pop * 100,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
