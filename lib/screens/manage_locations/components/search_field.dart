import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32.0,
      width: 326.0,
      padding: const EdgeInsets.only(left: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Image.asset('assets/icons/ic_search.png', height: 12.67, width: 12.67),
          const SizedBox(width: 10.0),
          Container(
            height: 32.0,
            width: 280.0,
            alignment: Alignment.center,
            child: const TextField(
              autofocus: true,
              decoration: InputDecoration.collapsed(
                hintText: 'Search Your City',
                hintStyle: TextStyle(color: Color(0xFF828282), fontSize: 12.0),

               ),
            ),
          ),
        ],
      ),
    );
  }

}