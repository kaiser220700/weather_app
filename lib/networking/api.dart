// import 'dart:convert';

// import 'package:http/http.dart';

// class WeatherRepository {
//   final client = Client();
//   Future getWeather() async {
//     var response = await client.get(Uri.parse(
//           'https://api.openweathermap.org/data/2.5/onecall?lat=20.9870268&lon=105.8497007&appid=07477f5316bccf0a26594fcf75e042c1&units=metric&exclude=minutely'));
//       var currentWeather = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
//       // final model = HourlyCustom.fromJson(Map.from(currentWeather));
//       // return model;
//   }
// }
