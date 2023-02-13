import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:uptodo/helper/const.dart';
import 'package:uptodo/model/category_model.dart';
import 'package:uptodo/model/note_model.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String? catTitle;
  var date;

  addNote(NoteModel notes) async {
    emit(AddNoteLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);

      await noteBox.add(notes);
      print(notes.title);

      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }

  List<int> priority = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int currentPriority = 0;
  changePriority(int priority) {
    currentPriority = priority;
    print(currentPriority);
    emit(AddNoteSuccess());
  }

  int getPriority() {
    return priority[currentPriority];
  }

  chooseDateTime(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.utc(2010, 10, 16),
      lastDate: DateTime.utc(2030),
    );
  }

  List<CategoryModel> categories = [];
  void getCategory() async {
    var noteBox = Hive.box<CategoryModel>(kCategoryBox);

    categories = noteBox.values.toList();
    emit(AddNoteSuccess());
  }

  changeCatTitle(String title) {
    catTitle = title;
    print(catTitle);
    emit(AddNoteSuccess());
  }

  String getCatTitle() {
    return catTitle ?? "Cat not found";
  }
}
