import 'package:flutter/material.dart';
import 'package:uptodo/helper/color.dart';

class CustomTitleNoteAndDescription extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  const CustomTitleNoteAndDescription(
      {Key? key,
      required this.title,
      required this.description,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: grayColor,
              border: Border.all(
                color: Colors.white,
              )),
        ),
        const Spacer(
          flex: 1,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                maxLines: 2,
                style: const TextStyle(
                  color: grayTextColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.edit_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
