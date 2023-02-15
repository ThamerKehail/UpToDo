import 'package:flutter/material.dart';
import 'package:uptodo/widgets/custom_button.dart';

import '../../helper/color.dart';

class EditTaskTitlePopUp extends StatelessWidget {
  final String title;
  final String description;
  const EditTaskTitlePopUp(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: grayColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Task Priority",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            TextFormField(
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  hintText: title,
                  hintStyle: const TextStyle(
                    color: Color(0xffAFAFAF),
                    fontSize: 18,
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: grayColor)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            TextFormField(
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  hintText: description,
                  hintStyle: const TextStyle(
                    color: Color(0xffAFAFAF),
                    fontSize: 18,
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: grayColor)),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Cancel",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
                CustomButton(text: 'text', onTap: () {})
              ],
            )
          ],
        ),
      ),
    );
  }
}
