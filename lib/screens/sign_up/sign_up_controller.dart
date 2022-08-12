import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plane_vite/screens/sign_up/sign_up_service.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/user.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

import '../Drawer/drawer_controller.dart';

class SignupController extends GetxController {
  var name;
  var email;
  var password;
  var confirmPassword;
  var passwordBool;
  var confirmPasswordBool;
  var phoneNumber;
  bool signupStatus = false;
  var message;
  var encodedImage='';
  var imageName='';
  Rxn<File> file1 = Rxn<File>();

  late SignupService _service = SignupService();


  @override
  void onInit() {
    name = '';
    email = '';
    password = '';
    confirmPassword = '';
    phoneNumber = '';
    passwordBool = true.obs;
    confirmPasswordBool = true.obs;
    _service=SignupService();
    super.onInit();
  }

  void securePassword() {
    passwordBool.value = !passwordBool.value;
  }

  void secureConfirmPassword() {
    confirmPasswordBool.value = !confirmPasswordBool.value;
  }

  Future<void> registerOnClick() async {

    User user = User(
        encodedImage: encodedImage,
        imageName: imageName,
        userName: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        phoneNumber: phoneNumber,
        imageFile: file1.value,
    );

    signupStatus = await _service.register(user);


/*
    if(message is List){
      String temp ='';
      for(String s in message)temp += s + '\n';
      message=temp;
    }*/
  }

  void onButtonTap(BuildContext context) async {

    loaderBoxGet(context);
    await registerOnClick();
    message = _service.message;
    Get.back();

    if (signupStatus) {
      Get.lazyPut(() => MyDrawerController());
      Get.offAllNamed('/skeleton');
      //EasyLoading.showSuccess(message);
    }
    else {
      errorMessageBoxGet(message,context);
      log('error here');
    }
  }

  Future gellarypicker() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (myfile != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: myfile.path,
        cropStyle: CropStyle.circle,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper'
              //toolbarColor:kBlueColor2,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
        ],
      );
      if ( croppedFile != null){
        file1.value = File(croppedFile.path);
      }

    }
    update();
  }
}
