import 'package:flutter/material.dart';
import 'package:uptodo/helper/color.dart';

class CustomAppbar extends StatelessWidget {
  final IconData iconOne;
  final IconData iconTwo;
  const CustomAppbar({Key? key, required this.iconOne, required this.iconTwo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: grayColor),
          child: Center(
            child: Icon(
              iconOne,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: grayColor),
          child: Center(
            child: Icon(
              iconTwo,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
