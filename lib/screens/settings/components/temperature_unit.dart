import 'package:flutter/material.dart';
import 'package:weather_app/menus/item_temperature_unit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TemperatureUnitRow extends StatefulWidget {
  const TemperatureUnitRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TemperatureUnitRowState();
}

class _TemperatureUnitRowState extends State<TemperatureUnitRow> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey _menuKey = GlobalKey();
  String temp = TempUnit.celsius;


  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice) async {
      final SharedPreferences prefs = await _prefs;
      setState(() {
        switch (choice) {
          case TempUnit.fahrenheit:
            {
              temp = choice;
              prefs.setString("Unit Temperature", "F");
            }
            break;
          default:
            {
              temp = choice;
              prefs.remove("Unit Temperature");
            }
        }
      });
    }

    final _temp = PopupMenuButton<String>(
      child: GestureDetector(
          child: Container(
            width: 120,
            alignment: Alignment.centerRight,
            child: Text(
              temp,
              style: const TextStyle(color: Colors.white, fontSize: 14.0),
            ),
          ),
          onTap: () {
            dynamic state = _menuKey.currentState;
            state.showButtonMenu();
          }),
      key: _menuKey,
      itemBuilder: (_) {
        return TempUnit.choices.map((String choice) {
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
          'Temperature unit',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        _temp,
      ],
    );
  }
}
