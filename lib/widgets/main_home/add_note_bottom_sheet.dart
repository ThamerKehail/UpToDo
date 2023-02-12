import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uptodo/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:uptodo/helper/color.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uptodo/model/note_model.dart';
import 'package:uptodo/widgets/main_home/custom_table_calender.dart';

import '../../cubit/notes_cubit/notes_cubit.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => AddNoteCubit(),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
          if (state is AddNoteFailure) {
            debugPrint("Failure");
          }
          if (state is AddNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          }
        }, builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: grayColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20.0,
                    left: 20,
                    right: 20,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Add Task",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                            hintText: "Task Title",
                            hintStyle: TextStyle(
                              color: Color(0xffAFAFAF),
                              fontSize: 18,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grayColor)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                            hintText: "Task Title",
                            hintStyle: TextStyle(
                              color: Color(0xffAFAFAF),
                              fontSize: 18,
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: grayColor)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white))),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.timer_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              var date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.utc(2010, 10, 16),
                                lastDate: DateTime.utc(2030),
                              );
                              print(DateFormat.yMd()
                                  .format(date ?? DateTime.now())
                                  .toString());
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.discount_outlined,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.flag_outlined,
                            color: Colors.white,
                          ),
                          const Spacer(),
                          state is AddNoteLoading?
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : IconButton(
                                  icon: const Icon(
                                    Icons.send_outlined,
                                    color: primaryColor,
                                  ),
                                  onPressed: () {
                                    NoteModel notes = NoteModel(
                                      title: 'ffff',
                                      date: 'date',
                                      time: 'time',
                                      category: 'category',
                                      description: 'description',
                                      priority: 1,
                                    );
                                    BlocProvider.of<AddNoteCubit>(context)
                                        .addNote(notes);
                                  },
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
