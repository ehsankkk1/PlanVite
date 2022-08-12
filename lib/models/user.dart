import 'dart:io';

import 'package:image_picker/image_picker.dart';

class User {
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  String? encodedImage;
  String? imageName;
  File? imageFile;

  User({
    this.userName,
    this.email,
    this.password,
    this.confirmPassword,
    this.phoneNumber,
    this.encodedImage,
    this.imageName,
    this.imageFile,
  });
}
