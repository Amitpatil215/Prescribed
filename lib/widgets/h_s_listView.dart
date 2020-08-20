import 'package:flutter/material.dart';

class HSListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            maxRadius: 25,
          ),
          title: Text("Dr. Sunil Chaturvedhi"),
          subtitle: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Heart Surgeon-Apex Hospital"),
                  Text("Exp: 15yrs"),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
