import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:uptodo/helper/const.dart';
import 'package:uptodo/model/category_model.dart';

part 'create_category_state.dart';

class CreateCategoryCubit extends Cubit<CreateCategoryState> {
  CreateCategoryCubit() : super(CreateCategoryInitial());

  List<Color> colors = [
    const Color(0xffff0000),
    const Color(0xffff9900),
    const Color(0xff00ff00),
    const Color(0xff00ffff),
    const Color(0xff0000ff),
    const Color(0xff000000),
    const Color(0xff073763),
    const Color(0xffff00ff),
  ];
  int currentIndex = 0;
  changeColor(int colors) {
    currentIndex = colors;
    emit(CreateCategorySuccess());
  }

  int getCurrentColor() {
    return colors[currentIndex].value;
  }

  addCategory(CategoryModel category) async {
    emit(CreateCategoryLoading());
    try {
      var noteBox = Hive.box<CategoryModel>(kCategoryBox);

      await noteBox.add(category);

      emit(CreateCategorySuccess());
    } catch (e) {
      emit(CreateCategoryFailure(e.toString()));
    }
  }
}
