import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uptodo/providers/home_view_model.dart';
import 'package:uptodo/widgets/home/all_notes.dart';
import 'package:uptodo/widgets/home/body_empty_notes.dart';
import 'package:uptodo/widgets/home/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
      child: true ? const BodyEmptyNotes() : const AllNotes(),
    ));
  }
}
