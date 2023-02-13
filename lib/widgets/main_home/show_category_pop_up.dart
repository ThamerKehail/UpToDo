import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:uptodo/cubit/category_cubit/category_cubit.dart';
import 'package:uptodo/model/category_model.dart';
import 'package:uptodo/widgets/custom_button.dart';
import 'package:uptodo/widgets/main_home/categoty_card.dart';

import '../../helper/color.dart';
import '../../view/create_category_screen.dart';

class ShowCategoryPopUp extends StatefulWidget {
  const ShowCategoryPopUp({Key? key}) : super(key: key);

  @override
  State<ShowCategoryPopUp> createState() => _ShowCategoryPopUpState();
}

class _ShowCategoryPopUpState extends State<ShowCategoryPopUp> {
  @override
  void initState() {
    BlocProvider.of<AddNoteCubit>(context).getCategory();
    super.initState();
  }

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
            const Text(
              "Choose Category",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
              List<CategoryModel> categories =
                  BlocProvider.of<AddNoteCubit>(context).categories;
              print(categories.length);
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        onTap: () {
                          BlocProvider.of<AddNoteCubit>(context)
                              .changeCatTitle(categories[index].title ?? "");
                          BlocProvider.of<AddNoteCubit>(context).getCatTitle();
                          Navigator.pop(context);
                          print(categories[index].title);
                        },
                        cat: categories[index],
                      );
                    }),
              );
            }),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
                text: "Add Category",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const CreateCategoryScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
