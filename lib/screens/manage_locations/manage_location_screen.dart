import 'package:flutter/material.dart';
import 'package:weather_app/screens/manage_locations/components/list_location.dart';

import 'components/custom_appbar_ml.dart';
import 'components/search_field.dart';

class ManageLocationScreen extends StatelessWidget {
  const ManageLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          height: 766.0,
          width: 358.0,
          margin: const EdgeInsets.fromLTRB(25.0, 25.0, 15.0, 15.0),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF62B8F6), Color(0xFF2C79C1)],
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            children: const [
              CustomAppbarML(),
              SizedBox(height: 35.0),
              SearchField(),
              SizedBox(height: 35.0),
              LocationList(),
            ],
          ),
        ),
      ),
    );
  }
}
