part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class ChangePriorityState extends AddNoteState {
  ChangePriorityState();
}

class AddNoteSuccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errorMessage;
  AddNoteFailure(this.errorMessage);
}
