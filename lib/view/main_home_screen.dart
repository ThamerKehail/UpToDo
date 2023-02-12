import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uptodo/cubit/add_note_cubit/add_note_cubit.dart';
import 'package:uptodo/cubit/app_cubit/app_cubit.dart';
import 'package:uptodo/helper/color.dart';
import 'package:uptodo/widgets/main_home/add_note_bottom_sheet.dart';
import 'package:uptodo/widgets/main_home/cutom_bottom_buton.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          child: const Center(
            child: Icon(Icons.add),
          ),
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                context: context,
                builder: (context) {
                  return const AddNoteBottomSheet();
                });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: const Color(0xff363636),
          height: 80,
          child: Row(
            children: [
              Row(
                children: [
                  CustomBottomButton(
                    onTap: () {
                      BlocProvider.of<AppCubit>(context).changePage(0);
                    },
                    label: "Home",
                    icons: BlocProvider.of<AppCubit>(context).currentIndex == 0
                        ? Icons.home
                        : Icons.home_outlined,
                    isActive:
                        BlocProvider.of<AppCubit>(context).currentIndex == 0
                            ? true
                            : false,
                  ), //
                  CustomBottomButton(
                    isActive:
                        BlocProvider.of<AppCubit>(context).currentIndex == 1
                            ? true
                            : false,
                    onTap: () {
                      BlocProvider.of<AppCubit>(context).changePage(1);
                    },
                    label: "Calender",
                    icons: BlocProvider.of<AppCubit>(context).currentIndex == 1
                        ? Icons.calendar_month
                        : Icons.calendar_today_rounded,
                  ), //
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  CustomBottomButton(
                    isActive:
                        BlocProvider.of<AppCubit>(context).currentIndex == 2
                            ? true
                            : false,
                    icons: BlocProvider.of<AppCubit>(context).currentIndex == 2
                        ? Icons.access_time_filled
                        : Icons.access_time,
                    label: "Focus",
                    onTap: () {
                      BlocProvider.of<AppCubit>(context).changePage(2);
                    },
                  ),
                  CustomBottomButton(
                    isActive:
                        BlocProvider.of<AppCubit>(context).currentIndex == 3
                            ? true
                            : false,
                    icons: BlocProvider.of<AppCubit>(context).currentIndex == 3
                        ? Icons.person_2
                        : Icons.person_2_outlined,
                    label: "Profile",
                    onTap: () {
                      BlocProvider.of<AppCubit>(context).changePage(3);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        body: BlocProvider.of<AppCubit>(context)
            .pages
            .elementAt(BlocProvider.of<AppCubit>(context).currentIndex),
      );
    });
  }
}
