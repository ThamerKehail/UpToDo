import 'package:flutter/material.dart';

class CustomSearchBox extends StatelessWidget {
  const CustomSearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: const InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.search,
              size: 40,
              color: Color(0xff979797),
            ),
          ),
          hintText: "Search for our task...",
          hintStyle: TextStyle(
            color: Color(0xff979797),
            fontSize: 18,
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff979797))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff979797))),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff979797)))),
    );
  }
}
