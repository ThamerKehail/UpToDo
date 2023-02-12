import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:uptodo/helper/color.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uptodo/model/note_model.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(listener: (context, state) {
      if (state is AddNoteFailure) {
        print("Failure");
      }
      if (state is AddNoteSuccess) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is AddNoteLoading ? true : false,
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
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.discount_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.flag_outlined,
                        color: Colors.white,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.send_outlined,
                          color: primaryColor,
                        ),
                        onPressed: () {
                          NoteModel notes = NoteModel(
                            title: 'title',
                            date: 'date',
                            time: 'time',
                            category: 'category',
                            description: 'description',
                            priority: 1,
                          );
                          BlocProvider.of<AddNoteCubit>(context).addNote(notes);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
