import 'package:flutter/material.dart';

class HSPromoCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 1.5 / 5.5,
        scrollDirection: Axis.horizontal,
        children: [
          EachCard(),
          EachCard(),
        ],
      ),
    );
  }
}

class EachCard extends StatelessWidget {
  const EachCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
      clipBehavior: Clip.hardEdge,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.blue],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "General Physician",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Try for cold, fever..",
                ),
              ],
            ),
            //?To Do:Image related physician appear here
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
