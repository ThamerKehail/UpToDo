import 'package:flutter/material.dart';
import 'package:uptodo/helper/color.dart';
import 'package:uptodo/widgets/home/cusom_note_box.dart';
import 'package:uptodo/widgets/home/custom_appbar.dart';
import 'package:uptodo/widgets/home/custom_search_box.dart';

class AllNotes extends StatelessWidget {
  const AllNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(
          title: 'Home Screen',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtLFlEKjQHLInSZGzlfwIAnCrqCOF3chDGhR6ZKfSw&s',
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomSearchBox(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    height: 15,
                  ),
              scrollDirection: Axis.vertical,
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return const CustomNoteBox();
              }),
        ),
      ],
    );
  }
}
