import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:provider/provider.dart';
import '../colors.dart';
import '../../Model/doctor.dart';
import '../../Model/patient.dart';
import '../../Model/userType.dart';

class PESPickImage extends StatelessWidget {
  final picker = ImagePicker();

  static File croppedImage;
  //! this is a call back function
  //* We getting a function named imagePickedFn
  //* We execute it here by passing a picked image
  final void Function(File pickedImage) imagePickedFn;

  PESPickImage({Key key, this.imagePickedFn}) : super(key: key);

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
        imagePickedFn(croppedImage);
      } else {
        return;
      }
    } catch (error) {
      print("Error in picking image as $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    var _isPatient = Provider.of<UserType>(context).isPatient;
    var _userData;
    if (_isPatient) {
      _userData = Provider.of<Patient>(context, listen: true);
    } else {
      _userData = Provider.of<Doctor>(context, listen: true);
    }
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: "ProfileHeroKey",
            child: CircleAvatar(
              maxRadius: 40,
              child: ClipOval(
                child: _userData.profileImageUrl == null
                    ? SvgPicture.asset(
                        "assets/images/male.svg",
                      )
                    : Image.network(
                        "${_userData.profileImageUrl}",
                      ),
              ),
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
