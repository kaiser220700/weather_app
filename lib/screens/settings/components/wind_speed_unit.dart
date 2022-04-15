import 'package:flutter/material.dart';
import 'package:weather_app/menus/item_wind_speed_unit.dart';

class WindSpeedUnitRow extends StatefulWidget {
  const WindSpeedUnitRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WindSpeedUnitRowState();
}

class _WindSpeedUnitRowState extends State<WindSpeedUnitRow> {
  final GlobalKey _menuKey = GlobalKey();
  String unit = WindSpeedUnit.kilometerPerHour;

  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice) {
      setState(() {
        switch (choice) {
          case WindSpeedUnit.milimeterPerHour:
            unit = choice;
            break;
          case WindSpeedUnit.milimeterPerSecond:
            unit = choice;
            break;
          case WindSpeedUnit.kiloNewton:
            unit = choice;
            break;
          default:
            unit = WindSpeedUnit.kilometerPerHour;
            break;
        }
      });
    }

    final _windSpeedUint = PopupMenuButton<String>(
      child: GestureDetector(
          child: Container(
            width: 120,
            alignment: Alignment.centerRight,
            child: Text(
              unit,
              style: const TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ),
          onTap: () {
            dynamic state = _menuKey.currentState;
            state.showButtonMenu();
          }),
      key: _menuKey,
      itemBuilder: (_) {
        return WindSpeedUnit.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
      onSelected: choiceAction,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Wind speed unit',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        _windSpeedUint,
      ],
    );
  }
}
