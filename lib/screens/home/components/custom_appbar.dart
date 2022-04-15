import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/menus/item_menu.dart';
import 'package:weather_app/screens/manage_locations/manage_location_screen.dart';
import 'package:weather_app/screens/settings/settings_screen.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppBar> {
  String _nameCity = "";
  void _onInit() async {
    var client = Client();
    try {
      var response = await client.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?'
            'lat=20.9870268&lon=105.8497007&'
            'appid=07477f5316bccf0a26594fcf75e042c1'),
      );
      var currentWeather = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      var name = currentWeather['name'] as String;
      setState(() {
        _nameCity = name;
      });
    } finally {
      client.close();
    }
  }

  @override
  void initState() {
    super.initState();
    _onInit();
  }

  final GlobalKey _menuKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice) {
      if (choice == Menus.setting) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingScreen()),
        );
      }
    }

    final _menu = PopupMenuButton<String>(
      child: GestureDetector(
          child: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onTap: () {
            dynamic state = _menuKey.currentState;
            state.showButtonMenu();
          }),
      key: _menuKey,
      itemBuilder: (_) {
        return Menus.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
      onSelected: choiceAction,
    );

    return Row(
      children: [
        const SizedBox(width: 18),
        GestureDetector(
          child: const Icon(
            Icons.add_outlined,
            color: Colors.white,
            size: 33,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const ManageLocationScreen()),
            );
          },
        ),
        const SizedBox(width: 110),
        Column(
          children: [
            Text(
              _nameCity,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4.0),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5.0),
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.0,
                      color: Colors.white,
                    ),
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  margin: const EdgeInsets.only(right: 5.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(width: 110),
        _menu,
      ],
    );
  }
}
