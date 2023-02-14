import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/cubit/notes_cubit/notes_cubit.dart';
import 'package:uptodo/providers/home_view_model.dart';
import 'package:uptodo/widgets/home/all_notes.dart';
import 'package:uptodo/widgets/home/body_empty_notes.dart';
import 'package:uptodo/widgets/home/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: BlocProvider.of<NotesCubit>(context).notes.isNotEmpty
              ? const AllNotes()
              : const BodyEmptyNotes(),
        )),
      );
    });
  }
}
