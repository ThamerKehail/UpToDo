import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:uptodo/helper/const.dart';
import 'package:uptodo/model/note_model.dart';
import 'package:uptodo/view/home_screen.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel notes) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);

      await noteBox.add(notes);

      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }

  int currentIndex = 0;
  List<Widget> pages = [
    const HomeScreen(),
    Container(
      color: Colors.amberAccent,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.black,
    ),
  ];
  void changePage(int index) {
    currentIndex = index;
    emit(AddNoteSuccess());
  }
}
