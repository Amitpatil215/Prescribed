import 'package:flutter/material.dart';
import '../../widgets/h_s_widgets/h_s_listView.dart';

class TopDoctorsSeeAllScreen extends StatelessWidget {
  static const routeName = "TopDoctors-seeAll";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Descover Life Savers"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: HSListView(),
      ),
    );
  }
}
