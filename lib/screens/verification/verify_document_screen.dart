import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyDocumentScreen extends StatefulWidget {
  static const routeName = 'verify';

  @override
  _VerifyDocumentScreenState createState() => _VerifyDocumentScreenState();
}

class _VerifyDocumentScreenState extends State<VerifyDocumentScreen> {
  final picker = ImagePicker();
  File _pickedImage;
  File croppedImage;
  void _pickImage(ImageSource source) async {
    try {
      final pickedImage = await picker.getImage(
        source: source,
      );
      if (pickedImage != null) {
        croppedImage = await ImageCropper.cropImage(
          sourcePath: pickedImage.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 75,
          maxHeight: 700,
          maxWidth: 700,
          compressFormat: ImageCompressFormat.jpg,
          androidUiSettings: AndroidUiSettings(
            toolbarTitle: "Crop Image",
            toolbarColor: appBarColor,
            cropFrameColor: Colors.white,
            backgroundColor: appBarColor,
            dimmedLayerColor: appBarColor,
            statusBarColor: appBarColor,
          ),
        );
      }
      if (croppedImage != null) {
        setState(() {
          _pickedImage = croppedImage;
        });
      } else {
        return;
      }
    } catch (error) {
      print("Error in picking image as $error");
    }
  }

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
          const Text(
            "Verify Your Documents",
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 7),
          Center(
            child: Container(
              height: 200,
              width: 250,
              child: _pickedImage == null
                  ? SvgPicture.asset(
                      "assets/images/document_verify.svg",
                      fit: BoxFit.fill,
                    )
                  : Image.file(_pickedImage),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18),
            child: const Text(
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
                const Text(
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
                onPressed: () {
                  _pickImage(ImageSource.camera);
                },
              ),
              OutlineButton.icon(
                icon: Icon(Icons.photo_size_select_large),
                label: Text("Gallery"),
                onPressed: () {
                  _pickImage(ImageSource.gallery);
                },
              )
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Text(
              "Submit",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(width: 10),
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          ],
        ),
        isExtended: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {},
      ),
    );
  }
}
