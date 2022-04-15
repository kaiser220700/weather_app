import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key? key,
    required this.location,
    required this.icon,
    required this.tempMin,
    required this.tempMax,
    required this.image,
    required this.status,
  }) : super(key: key);
  final String location, icon, tempMin, tempMax, image, status;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 326.0,
      padding: const EdgeInsets.all(17.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0)
      ),
      margin: const EdgeInsets.only(left: 15.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    location,
                    style: const TextStyle(
                        fontSize: 16.0, color: Color(0xFF545B70)),
                  ),
                  const SizedBox(width: 3.0),
                  Image.asset(icon),
                ],
              ),
              const SizedBox(height: 3.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tempMin,
                    style: const TextStyle(
                        fontSize: 12.0, color: Color(0xFF545B70)),
                  ),
                  const Text(
                    '/',
                    style: TextStyle(fontSize: 12.0, color: Color(0xFF545B70)),
                  ),
                  Text(
                    tempMax,
                    style: const TextStyle(
                        fontSize: 12.0, color: Color(0xFF545B70)),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 45,
            width: 60,
            child: Column(
              children: [
                Image.asset(image, color: Colors.black, width: 26.67),
                const SizedBox(height: 3.0),
                Text(
                  status,
                  style: const TextStyle(fontSize: 12.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
