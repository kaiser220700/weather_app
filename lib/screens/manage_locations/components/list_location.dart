import 'package:flutter/material.dart';
import 'package:weather_app/models/location.dart';

import 'location_card.dart';

class LocationList extends StatelessWidget {
  const LocationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        locationCustom.length,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: LocationCard(
            location: locationCustom[index].location,
            icon: locationCustom[index].icon,
            tempMin: locationCustom[index].tempMin,
            tempMax: locationCustom[index].tempMax,
            image: locationCustom[index].image,
            status: locationCustom[index].status,
          ),
        ),
      ),
    );
  }
}
