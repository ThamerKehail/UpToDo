import 'package:flutter/material.dart';
import 'package:uptodo/helper/color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.width * .16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: primaryColor,
        ),
        child: Center(
            child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        )),
      ),
    );
  }
}
