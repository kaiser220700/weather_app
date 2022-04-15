import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HourlyForecastCard extends StatelessWidget {
  const HourlyForecastCard({
    Key? key,
    required this.time,
    required this.image,
    required this.temp,
    required this.feelsLike,
    required this.pop,
  }) : super(key: key);
  final String time, image;
  final num temp, feelsLike, pop;

  @override
  Widget build(BuildContext context) {
    String url = 'https://openweathermap.org/img/wn/' + image + '@2x.png';
    return Container(
      height: 100.0,
      width: 75,
      margin: const EdgeInsets.only(left: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          const SizedBox(height: 3.0),
          image == ""
              ? const SizedBox()
              : CachedNetworkImage(
                  imageUrl: url,
                  height: 35.0,
                  width: 35.0,
                ),
          const SizedBox(height: 3.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${temp.toInt()}°",
                style: const TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              const Text(
                '/',
                style: TextStyle(fontSize: 12.0, color: Colors.white),
              ),
              Text(
                "${feelsLike.toInt()}°",
                style: const TextStyle(fontSize: 12.0, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 3.0),
          Text(
            "${pop.toInt()}% rain",
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
