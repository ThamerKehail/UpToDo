import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uptodo/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:uptodo/cubit/app_cubit/app_cubit.dart';
import 'package:uptodo/cubit/notes_cubit/notes_cubit.dart';
import 'package:uptodo/helper/const.dart';
import 'package:uptodo/helper/simple_bloc_observer.dart';
import 'package:uptodo/model/category_model.dart';
import 'package:uptodo/model/note_model.dart';
import 'package:uptodo/view/main_home_screen.dart';

import 'cubit/edit_note_cubit/edit_note_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  Hive.registerAdapter(CategoryModelAdapter());
  await Hive.openBox<CategoryModel>(kCategoryBox);
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesCubit()),
        BlocProvider(create: (context) => AddNoteCubit()),
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => EditNoteCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff121212),
          fontFamily: "Lato",
        ),
        home: const MainHomeScreen(),
      ),
    );
  }
}
