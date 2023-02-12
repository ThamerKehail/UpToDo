import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/helper/color.dart';
import 'package:uptodo/model/note_model.dart';

import '../../cubit/notes_cubit/notes_cubit.dart';

class CustomNoteBox extends StatelessWidget {
  final NoteModel noteModel;
  const CustomNoteBox({Key? key, required this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    return Dismissible(
      key: key,
      onDismissed: (v) {
        noteModel.delete();
        BlocProvider.of<NotesCubit>(context).getNotes();
      },
      child: Container(
        color: grayColor,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                    )),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noteModel.title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "TodayAt 16:45",
                        style: TextStyle(
                          color: Color(0xffAFAFAF),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .2,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 87,
                            height: 29,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: const Color(0xff809CFF),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 42,
                            height: 29,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: const Color(0xff8687E7),
                                )),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
