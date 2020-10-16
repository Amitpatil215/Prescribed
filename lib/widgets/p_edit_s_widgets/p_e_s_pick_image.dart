import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../colors.dart';

class PESPickImage extends StatefulWidget {
  //! this is a call back function
  //* We getting a function named imagePickedFn
  //* We execute it here by passing a picked image
  final void Function(File pickedImage) imagePickedFn;

  const PESPickImage({Key key, this.imagePickedFn}) : super(key: key);
  @override
  _PESPickImageState createState() => _PESPickImageState();
}

class _PESPickImageState extends State<PESPickImage> {
  final picker = ImagePicker();
  File _pickedImage;
  File croppedImage;

  void _pickImage() async {
    try {
      final pickedImage = await picker.getImage(
        source: ImageSource.gallery,
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
        widget.imagePickedFn(_pickedImage);
      } else {
        return;
      }
    } catch (error) {
      print("Error in picking image as $error");
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
