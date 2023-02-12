import 'package:flutter/material.dart';

class CustomBottomButton extends StatelessWidget {
  final void Function() onTap;
  final IconData icons;
  final String label;
  bool isActive = true;

  CustomBottomButton(
      {Key? key,
      required this.onTap,
      required this.icons,
      required this.label,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icons,
              color: Colors.white,
              size: isActive == false ? 25 : 35,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        )); //
  }
}
