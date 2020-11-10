import 'package:flutter/material.dart';

class DSProgressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: GridView.count(
        crossAxisCount: 2,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        mainAxisSpacing: 10,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(10.0),
        childAspectRatio: 0.75,
        children: [
          GridTileGenerator(
            title: "Appointed",
            description: "Appointed Patients",
            progressDigit: 40,
          ),
          GridTileGenerator(
            title: "Erned",
            description: "Generated Revenue",
            isRuppy: true,
            progressDigit: 20,
          ),
          GridTileGenerator(
            title: "Popularity",
            description: "Current Rating",
            isStar: true,
            progressDigit: 5,
          ),
          GridTileGenerator(
            title: "Availability",
            description: "Clinic + Telemedication",
            isPercent: true,
            progressDigit: 100,
          ),
        ],
      ),
    );
  }
}

class GridTileGenerator extends StatelessWidget {
  final String title;
  final bool isRuppy;
  final bool isPercent;
  final bool isStar;
  final int progressDigit;
  final String description;

  const GridTileGenerator({
    Key key,
    @required this.title,
    this.isRuppy = false,
    this.isStar = false,
    this.isPercent = false,
    @required this.progressDigit,
    @required this.description,
  }) : super(key: key);

  String get sign {
    if (this.isPercent) {
      return "%";
    } else if (this.isRuppy) {
      return "₹";
    } else {
      return " ";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  progressDigit.toString(),
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(sign),
                Icon(
                  isStar ? Icons.star : null,
                  color: Colors.amber,
                  size: 17,
                )
              ],
            ),
            Text(
              description,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
