import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'category_model.g.dart';

@HiveType(typeId: 2)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String? title;
  @HiveField(1)
  int? color;

  CategoryModel({
    this.title,
    this.color,
  });
}
