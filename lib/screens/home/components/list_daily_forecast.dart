import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../../models/daily_forecast.dart';
import 'daily_forecast_card.dart';

class DailyForecast extends StatefulWidget {
  const DailyForecast({Key? key}) : super(key: key);

  @override
  _DailyForecastState createState() => _DailyForecastState();
}

class _DailyForecastState extends State<DailyForecast> {
  List<DailyCustom> dailyCustom = [];
  void _onInit() async {
    final client = Client();
    var response = await client.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=20.9870268&lon=105.8497007&appid=07477f5316bccf0a26594fcf75e042c1&units=metric&exclude=minutely'));
    var currentWeather = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var daily = currentWeather["daily"];

    setState(() {
      for (int i = 0; i < 7; i++) {
        var second = daily[i]["dt"];
        var time = formatDate(
            DateTime.fromMillisecondsSinceEpoch(second * 1000), [D]);
        var image = daily[i]["weather"][0]["icon"] as String;
        var pop = daily[i]['pop'] as num;
        var tempMin = daily[i]["temp"]["min"] as num;
        var tempMax = daily[i]["temp"]["max"] as num;

        dailyCustom.add(
          DailyCustom(
            time: time,
            image: image,
            pop: pop,
            tempMin: tempMin,
            tempMax: tempMax,
          ),
        );
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
      height: 470.0,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(left: 15.0, top: 20.0),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(190, 10, 69, 230), Color(0xFF2C79C1)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Forecast for 7 Days',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          const SizedBox(height: 10.0),
          Column(
            children: List.generate(
              dailyCustom.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 16),
                child: DailyForecastCard(
                  time: dailyCustom[index].time,
                  image: dailyCustom[index].image,
                  pop: dailyCustom[index].pop * 100,
                  tempMin: dailyCustom[index].tempMin,
                  tempMax: dailyCustom[index].tempMax,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
