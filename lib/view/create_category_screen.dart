import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:uptodo/cubit/category_cubit/category_cubit.dart';
import 'package:uptodo/cubit/create_category_cubit/create_category_cubit.dart';
import 'package:uptodo/helper/color.dart';
import 'package:uptodo/model/category_model.dart';
import 'package:uptodo/widgets/custom_button.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocProvider(
            create: (_) => CreateCategoryCubit(),
            child: BlocBuilder<CreateCategoryCubit, CreateCategoryState>(
                builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create new category",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Category name:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    controller:
                        BlocProvider.of<CreateCategoryCubit>(context).catName,
                    decoration: const InputDecoration(
                        hintText: "Category Name",
                        fillColor: grayColor,
                        filled: true,
                        hintStyle: TextStyle(
                          color: Color(0xffAFAFAF),
                          fontSize: 18,
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: grayColor)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Category Icon:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CreateCategoryCubit>(context)
                            .pickIcon(context);
                      },
                      child: Text("Choose Icons")),
                  BlocProvider.of<CreateCategoryCubit>(context).icons ??
                      SizedBox(),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Category Color:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 65,
                    child: ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 8,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemCount: BlocProvider.of<CreateCategoryCubit>(context)
                            .colors
                            .length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              BlocProvider.of<CreateCategoryCubit>(context)
                                  .changeColor(index);
                              print(
                                  BlocProvider.of<CreateCategoryCubit>(context)
                                      .getCurrentColor());
                            },
                            child: CircleAvatar(
                              radius:
                                  BlocProvider.of<CreateCategoryCubit>(context)
                                              .currentIndex ==
                                          index
                                      ? 28
                                      : 26,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 26,
                                backgroundColor:
                                    BlocProvider.of<CreateCategoryCubit>(
                                            context)
                                        .colors[index],
                              ),
                            ),
                          );
                        }),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      CustomButton(
                        onTap: () async {
                          Navigator.pop(context);
                          var blocProvide =
                              BlocProvider.of<CreateCategoryCubit>(context);
                          CategoryModel cat = CategoryModel(
                            color: blocProvide.getCurrentColor(),
                            title: blocProvide.catName.text,
                          );
                          await BlocProvider.of<CreateCategoryCubit>(context)
                              .addCategory(cat);
                          BlocProvider.of<AddNoteCubit>(context).getCategory();
                        },
                        text: "Create Category",
                      ),
                    ],
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
