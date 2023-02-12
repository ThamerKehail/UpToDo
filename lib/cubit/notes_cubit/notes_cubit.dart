import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:uptodo/model/note_model.dart';

import '../../helper/const.dart';

part "notes_state.dart";

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> notes = [];
  void getNotes() async {
    var noteBox = Hive.box<NoteModel>(kNotesBox);

    notes = noteBox.values.toList();
    emit(NotesSuccess());
  }
}
