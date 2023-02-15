part of 'edit_note_cubit.dart';

@immutable
abstract class EditNoteState {}

class EditNoteInitial extends EditNoteState {}

class EditNoteLoading extends EditNoteState {}

class ChangePriorityState extends EditNoteState {
  ChangePriorityState();
}

class EditNoteSuccess extends EditNoteState {}

class EditNoteFailure extends EditNoteState {
  final String errorMessage;
  EditNoteFailure(this.errorMessage);
}
