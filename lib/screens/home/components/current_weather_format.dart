import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RowComponent extends StatelessWidget {
  const RowComponent(
      {Key? key,
      required this.icon,
      required this.temp,
      required this.status,
      required this.date,
      required this.dayOfWeek})
      : super(key: key);

  final num temp;
  final String icon, status, date, dayOfWeek;

  @override
  Widget build(BuildContext context) {
    String url = 'https://openweathermap.org/img/wn/' + icon + '@2x.png';
    return Row(
      children: [
        const SizedBox(width: 20),
        icon == "" ?
        const SizedBox(height: 160,) : 
        CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          height: 160,
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dayOfWeek,
                  style: const TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 11, right: 11),
                    child: Image.asset('assets/icons/ic_rect.png')),
                Text(
                  date,
                  style: const TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                '$temp°',
                style: const TextStyle(
                    fontSize: 72.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              status,
              style: const TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ],
        )
      ],
    );
  }
}
