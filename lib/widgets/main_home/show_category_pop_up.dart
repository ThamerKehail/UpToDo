import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/cubit/category_cubit/category_cubit.dart';
import 'package:uptodo/cubit/create_category_cubit/create_category_cubit.dart';
import 'package:uptodo/model/category_model.dart';
import 'package:uptodo/widgets/custom_button.dart';

import '../../helper/color.dart';
import '../../view/create_category_screen.dart';

class ShowCategoryPopUp extends StatelessWidget {
  const ShowCategoryPopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: grayColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Choose Category",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
              List<CategoryModel> categories =
                  BlocProvider.of<CategoryCubit>(context).categories ?? [];
              print(categories.length);
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 10),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      const CreateCategoryScreen()));
                        },
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: greenOneColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: greenTwoColor,
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            CustomButton(text: "ggg", onTap: () {}),
          ],
        ),
      ),
    );
  }
}
