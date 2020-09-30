import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class PESPickImage extends StatefulWidget {
  @override
  _PESPickImageState createState() => _PESPickImageState();
}

class _PESPickImageState extends State<PESPickImage> {
  final picker = ImagePicker();
  File _pickedImage;

  void _pickImage() async {
    final pickedImage = await picker
        .getImage(
      source: ImageSource.gallery,
      imageQuality: 75,
      maxWidth: 150,
    )
        .catchError((error) {
      print("Error in picking image as $error");
    });
    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: "ProfileHeroKey",
            child: CircleAvatar(
              maxRadius: 40,
              backgroundImage:
                  _pickedImage != null ? FileImage(_pickedImage) : null,
              child: _pickedImage == null
                  ? SvgPicture.asset("assets/images/male.svg")
                  : null,
            ),
          ),
          Positioned(
            right: -20,
            bottom: 0,
            child: IconButton(
              color: Colors.black,
              iconSize: 30,
              icon: Icon(
                Icons.camera,
                color: Colors.purple,
              ),
              onPressed: _pickImage,
            ),
          ),
        ],
        overflow: Overflow.visible,
      ),
    );
  }
}
