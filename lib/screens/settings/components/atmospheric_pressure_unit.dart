import 'package:flutter/material.dart';

import '../../../menus/item_atmospheric_pressure_unit.dart';

class AtmosphericPressureUnitRow extends StatefulWidget {
  const AtmosphericPressureUnitRow({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AtmosphericPressureUnitRowState();
}

class _AtmosphericPressureUnitRowState
    extends State<AtmosphericPressureUnitRow> {
  final GlobalKey _menuKey = GlobalKey();
  String unit = AtmosphericPressureUnit.miliBar;

  @override
  Widget build(BuildContext context) {
    void choiceAction(String choice) {
      setState(() {
        switch (choice) {
          case AtmosphericPressureUnit.physicalAtmosphere:
            unit = choice;
            break;
          case AtmosphericPressureUnit.milimetresOfMercury:
            unit = choice;
            break;
          case AtmosphericPressureUnit.inchOfMercury:
            unit = choice;
            break;
          case AtmosphericPressureUnit.hetoPascal:
            unit = choice;
            break;
          default:
            unit = AtmosphericPressureUnit.miliBar;
            break;
        }
      });
    }

    final _atmosphericPressureUnit = PopupMenuButton<String>(
      child: GestureDetector(
          child: Container(
            width: 80,
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
        return AtmosphericPressureUnit.choices.map((String choice) {
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
          'Atmospheric pressure unit',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        _atmosphericPressureUnit
      ],
    );
  }
}
