import 'package:flutter/material.dart';

import '../../helper/color.dart';

class CustomRowNoteDetails extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;

  const CustomRowNoteDetails(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
          const Spacer(
            flex: 1,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(
            flex: 10,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .3,
            height: MediaQuery.of(context).size.width * .12,
            decoration: BoxDecoration(
              color: grayColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
