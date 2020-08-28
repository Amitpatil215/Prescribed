import 'package:flutter/material.dart';

class PSDetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Health Measures",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Helath Parameters like Blodd Sugar,\n Presure appears here",
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.amber,
                ),
                OutlineButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("Add"),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
