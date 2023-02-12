import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/view/home_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

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
    emit(AppSuccess());
  }
}
