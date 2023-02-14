import 'package:flutter/material.dart';
import 'package:uptodo/helper/color.dart';
import 'package:uptodo/model/note_model.dart';

class NoteDetailsScreen extends StatelessWidget {
  final NoteModel notes;
  const NoteDetailsScreen({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: grayColor),
                    child: const Center(
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: grayColor),
                    child: const Center(
                      child: Icon(
                        Icons.repeat,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
