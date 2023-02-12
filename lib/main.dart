import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:uptodo/helper/const.dart';
import 'package:uptodo/helper/simple_bloc_observer.dart';
import 'package:uptodo/model/note_model.dart';
import 'package:uptodo/view/main_home_screen.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(MultiProvider(providers: [
    BlocProvider(create: (context) => AddNoteCubit()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff121212),
        fontFamily: "Lato",
      ),
      home: MainHomeScreen(),
    );
  }
}
