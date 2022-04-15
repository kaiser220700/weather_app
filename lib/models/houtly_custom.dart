

class HourlyCustom {
  String time = "";
  String image = "";
  num temp = 0.0;
  num feelsLike = 0.0;
  num pop = 0.0;

  HourlyCustom({
    required this.time,
    required this.image,
    required this.temp,
    required this.feelsLike,
    required this.pop,
  });

  // HourlyCustom.fromJson(Map<String, dynamic> jsonData) {
  //   var hourly = jsonData["hourly"];
  //   // for (int i = 0; i < 24; i++) {
  //     var second = hourly[0]["dt"];
  //     time = formatDate(
  //         DateTime.fromMillisecondsSinceEpoch(second * 1000), [hh, ":", nn]);
  //     image = hourly[0]["weather"][0]["icon"] as String;
  //     tempMin = hourly[0]["temp"] as double;
  //     tempMax = hourly[0]['feels_like'] as double;
  //     pop = hourly[0]['pop'] as double;
  //     hourlyCustom.add(HourlyCustom(
  //         time: time,
  //         image: image,
  //         tempMin: tempMin,
  //         tempMax: tempMax,
  //         pop: pop));
  //   // }
  // }
}


