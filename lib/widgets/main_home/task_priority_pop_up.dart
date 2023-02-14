import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:uptodo/widgets/custom_button.dart';
import 'package:uptodo/widgets/main_home/priority_card.dart';

import '../../helper/color.dart';

class TaskPriorityPopUp extends StatelessWidget {
  const TaskPriorityPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: grayColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
        child:
            BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
          List<int> priority = BlocProvider.of<AddNoteCubit>(context).priority;
          return Column(
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10),
                    itemCount: priority.length,
                    itemBuilder: (context, index) {
                      return PriorityCard(
                        priority: priority[index],
                        onTap: () {
                          context.read<AddNoteCubit>().changePriority(index);
                        },
                      );
                    }),
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
                  CustomButton(
                      text: 'Save',
                      onTap: () {
                        BlocProvider.of<AddNoteCubit>(context).getPriority();
                        Navigator.pop(context);
                      }),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
