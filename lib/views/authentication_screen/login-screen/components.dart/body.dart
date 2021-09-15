import 'package:flutter/material.dart';
import 'package:food_recipe/views/widgets/tabView.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.elliptical(30, 30))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 180, 10, 0),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  height: 500,
                  width: 300,
                  child: Container(
                    child: TabView(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
