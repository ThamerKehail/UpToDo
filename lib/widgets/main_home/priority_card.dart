import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/add_note_cubit/add_note_cubit.dart';
import '../../helper/color.dart';

class PriorityCard extends StatelessWidget {
  final int priority;
  final VoidCallback onTap;
  const PriorityCard({Key? key, required this.priority, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: BlocProvider.of<AddNoteCubit>(context).currentPriority ==
                  (priority - 1)
              ? Colors.black38
              : primaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.flag_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "$priority",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
