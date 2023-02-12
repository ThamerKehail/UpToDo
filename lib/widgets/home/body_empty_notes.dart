import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uptodo/widgets/home/custom_appbar.dart';

class BodyEmptyNotes extends StatelessWidget {
  const BodyEmptyNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(
          flex: 1,
        ),
        SvgPicture.asset("assets/icons/empty_task.svg"),
        const Text(
          "What do you want to do today?",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          "Tap + to add your tasks",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
