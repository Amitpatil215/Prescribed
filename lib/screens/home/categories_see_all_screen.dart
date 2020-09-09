import 'package:flutter/material.dart';

class CatergoriesSeeAllScreen extends StatelessWidget {
  static const routName = "/catergory-all";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 1.5,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      boxShadow: [
                        BoxShadow(blurRadius: 5, color: Colors.grey.shade300),
                      ]),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 105.0,
                      left: 20,
                    ),
                    child: Text(
                      "Dental Surgeon",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 94.0),
                  child: Container(
                    height: 90,
                    width: 80,
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
        ),
      ),
    );
  }
}
