import 'package:flutter/material.dart';
import 'package:uptodo/helper/color.dart';
import 'package:uptodo/model/category_model.dart';

import '../../view/create_category_screen.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel cat;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.onTap,
    required this.cat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Color(cat.color!),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Icon(Icons.add),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            cat.title!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
