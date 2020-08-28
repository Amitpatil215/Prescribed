import 'package:flutter/material.dart';

class HSGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 2.5 / 2.4,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 80.0,
                  left: 30,
                ),
                child: Text("Dental\nSurgeon"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 53.0),
              child: Container(
                height: 70,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
