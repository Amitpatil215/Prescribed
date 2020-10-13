import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyDocumentScreen extends StatelessWidget {
  static const routeName = 'verify';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          Text(
            "Verify Your Documents",
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 7),
          Center(
            child: Container(
              height: 200,
              width: 250,
              child: SvgPicture.asset(
                "assets/images/document_verify.svg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: Text(
              "Please upload your institution/ Company Identity Card with valid current date",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: 350.w,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Privacy",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  "All your documents are verified manually If your identity verification attempt was unsuccessful, it simply means that the information you provided did not match the authoritative sources we use for verification. Unsuccessful verification attempts may be due to many reasons. ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 7),
          Container(
            padding: const EdgeInsets.all(18),
            child: Text(
              "Select appropriate method to upload document.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlineButton.icon(
                icon: Icon(Icons.camera_enhance),
                label: Text("Camera"),
                onPressed: () {},
              ),
              OutlineButton.icon(
                icon: Icon(Icons.photo_size_select_large),
                label: Text("Gallery"),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
