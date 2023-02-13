// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
// import 'package:uptodo/helper/const.dart';
// import 'package:uptodo/model/category_model.dart';
// part "category_state.dart";
//
// class CategoryCubit extends Cubit<CategoryState> {
//   CategoryCubit() : super(CategoryInitial());
//   List<CategoryModel> categories = [];
//   void getCategory() async {
//     var noteBox = Hive.box<CategoryModel>(kCategoryBox);
//
//     categories = noteBox.values.toList();
//     emit(CategorySuccess());
//   }
// }
