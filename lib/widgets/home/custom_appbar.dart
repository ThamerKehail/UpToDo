import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppbar extends StatelessWidget {
  final String title;
  final String image;
  const CustomAppbar({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(
          'assets/icons/menue.svg',
          color: Colors.white,
        ),
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        CircleAvatar(
          maxRadius: 19,
          backgroundImage: NetworkImage(image),
        )
      ],
    );
  }
}
