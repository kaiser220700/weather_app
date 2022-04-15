import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DailyForecastCard extends StatelessWidget {
  const DailyForecastCard({
    Key? key,
    required this.time,
    required this.image,
    required this.pop,
    required this.tempMin,
    required this.tempMax,
  }) : super(key: key);
  final String time, image;
  final num tempMin, tempMax, pop;

  @override
  Widget build(BuildContext context) {
    String url = 'https://openweathermap.org/img/wn/' + image + '@2x.png';
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.only(left: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 40.0,
            child: Text(
              time,
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
          const SizedBox(width: 100.0),
          image == ""
              ? const SizedBox()
              : CachedNetworkImage(
                  imageUrl: url,
                  height: 40.0,
                  width: 40.0,
                ),
          const SizedBox(width: 5.0),
          SizedBox(
            width: 60.0,
            child: Text(
              "${pop.toInt()}% rain",
              style: const TextStyle(fontSize: 12.0, color: Colors.white),
            ),
          ),
          const SizedBox(width: 80.0),
          Text(
            "${tempMin.toInt()}°",
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          const Text(
            '/',
            style: TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          Text(
            "${tempMax.toInt()}°",
            style: const TextStyle(fontSize: 12.0, color: Colors.white),
          ),
          const SizedBox(height: 3.0),
        ],
      ),
    );
  }
}
