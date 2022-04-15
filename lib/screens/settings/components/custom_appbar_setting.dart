import 'package:flutter/material.dart';

class CustomAppbarSetting extends StatelessWidget {
  const CustomAppbarSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            child: const Icon(
              Icons.keyboard_backspace_outlined,
              color: Colors.white,
              size: 25,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 100.0),
          const Text(
            'Setting',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
