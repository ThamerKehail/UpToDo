import 'package:flutter/material.dart';

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
            Divider(
              color: Colors.white,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const CreateCategoryScreen()));
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
            )
          ],
        ),
      ),
    );
  }
}
