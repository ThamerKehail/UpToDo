import 'package:flutter/material.dart';
import 'package:uptodo/helper/color.dart';
import 'package:uptodo/model/note_model.dart';
import 'package:uptodo/view/main_home_screen.dart';
import 'package:uptodo/widgets/custom_button.dart';
import 'package:uptodo/widgets/note_details/custom_row_note_details.dart';
import 'package:uptodo/widgets/note_details/custom_title_desc_note.dart';
import 'package:uptodo/widgets/note_details/edit_task_title_pop_up.dart';

import '../widgets/note_details/custom_appbar.dart';

class NoteDetailsScreen extends StatelessWidget {
  final NoteModel notes;
  const NoteDetailsScreen({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              const CustomAppbar(
                iconOne: Icons.close,
                iconTwo: Icons.repeat,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTitleNoteAndDescription(
                  title: notes.title,
                  description: notes.description,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: EditTaskTitlePopUp(
                                title: notes.title,
                                description: notes.description),
                          );
                        });
                  }),
              const SizedBox(
                height: 35,
              ),
              const CustomRowNoteDetails(
                title: "Task Time:",
                subTitle: "TodayAt 16:45",
                icon: Icons.timer_outlined,
              ),
              CustomRowNoteDetails(
                title: "Task Category:",
                subTitle: notes.category,
                icon: Icons.discount_outlined,
              ),
              CustomRowNoteDetails(
                title: "Task Priority:",
                subTitle: notes.priority.toString(),
                icon: Icons.flag_outlined,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  notes.delete();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => MainHomeScreen()),
                      (route) => false);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 35,
                    ),
                    Text(
                      "Delete Task",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              CustomButton(
                text: 'Edit Text',
                onTap: () {
                  notes.title = "New Note Edit";
                  notes.save();
                },
                width: double.infinity,
              )
            ],
          ),
        ),
      ),
    );
  }
}
