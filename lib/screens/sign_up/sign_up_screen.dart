import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plane_vite/screens/sign_up/sign_up_controller.dart';
import 'dart:io';
import '../../constants.dart';
import '../../widgets/custom_text_field.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController phonelController=new TextEditingController();
  final SignupController _signUpController = Get.find();
  File? _file1;


  Future gellarypicker() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);


      _file1 = File(myfile!.path);
      _signUpController.imageFile=_file1;


    if(_file1 != null){
      _signUpController.PickFile();
    }
  }
  Future upload()async{
    if(_file1==null) { return;}
    String base64=base64Encode(_file1!.readAsBytesSync());
    String imagename=_file1!.path.split("/").last;
    _signUpController.encodedImage=base64;
    _signUpController.imageName=imagename;


  }

  @override
  Widget build(BuildContext context) {
    final String locale = Get.locale.toString();

      return  Scaffold(
        backgroundColor:context.theme.backgroundColor,
        body: InteractiveViewer(
          child: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    const Positioned(
                      width: 100,
                      height: 100,
                      top: -20,
                      child: Image(
                        image: AssetImage('images/sign_up_first_flower.png'),
                      ),
                    ),
                    const Positioned(
                      top: 150,
                      child: Image(
                          image: AssetImage(
                              'images/sign_up_second_flower.png')),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: height * 0.08),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Create New Account'.tr,
                                style:  TextStyle(fontFamily: 'HacenN',
                                  fontSize: 30,
                                  color:context.theme.textTheme.caption!.color,
                                ),
                              ),
                              Text(
                                'please fill in the form to continue'.tr,
                                style:  TextStyle(fontFamily: 'HacenN',
                                  fontSize: 18,
                                  color: context.theme.textTheme.caption!.color,
                                ),
                              ),
                              SizedBox(height: height*0.015,),
                              Container(
                                decoration: BoxDecoration(
                                  color: context.theme.cardColor,
                                  border: Border.all(
                                    color: context.theme.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                width: 120,
                                height: 120,

                                child: Obx((){
                                  return  GestureDetector(
                                    onTap: (){
                                      _signUpController.fileBool.value=false;
                                      gellarypicker();
                                    },
                                    child: (_signUpController.fileBool.value)
                                        ?CircleAvatar(
                                      foregroundImage: Image.file(_file1!).image,
                                    )
                                        : Icon(
                                      Icons.add_a_photo,
                                      size: 50,
                                      color: context.theme.primaryColor,
                                    ),
                                  );
                                }),



                              ),
                            ],
                          ),
                          SizedBox(height: height*0.03,),
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    width * 0.1, 0, width * 0.1, 0),
                                child: Form(
                                  key: _globalKey,
                                  child: Column(
                                    children: [
                                      SizedBox(height: height*0.03,),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: CustomTextField(
                                          passwordBool: false,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Name is Empty ! '.tr;
                                            }
                                          },
                                          controller2: nameController,
                                          hintText: 'Name'.tr,
                                          icon: Icons.person,
                                        ),
                                      ),
                                      SizedBox(height: height*0.015,),
                                      CustomTextField(
                                        passwordBool: false,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Email is empty ! '.tr;
                                          }
                                        },
                                        controller2: emailController,
                                        hintText: 'Email'.tr,
                                        icon: Icons.email,
                                        textInputType: TextInputType.emailAddress,
                                      ),
                                      SizedBox(height: height*0.015,),
                                      Obx(() {
                                        return CustomTextField(
                                          passwordBool:
                                          _signUpController.passwordBool.value,
                                          secureText: _signUpController.securePassword,
                                          icon2:
                                          _signUpController.passwordBool.value == true
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Password Is Empty ! '.tr;
                                            }
                                            else if (value.length<8){
                                              return 'Please Enter at least 8 Characters !'.tr;
                                            }
                                          },
                                          controller2: passwordController,
                                          hintText: 'Password'.tr,
                                          icon: Icons.lock,
                                        );
                                      }),
                                      SizedBox(height: height*0.015,),
                                      Obx(() {
                                        return CustomTextField(
                                          passwordBool:
                                          _signUpController.confirmPasswordBool.value,
                                          secureText:
                                          _signUpController.secureConfirmPassword,
                                          icon2: _signUpController
                                              .confirmPasswordBool.value ==
                                              true
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Confirm Password Is Empty ! '.tr;
                                            }
                                            else if (value.length<8){
                                              return 'Please Enter at least 8 Characters !'.tr;
                                            }
                                            if(value != passwordController.text){
                                              return 'Not equal to the password ! '.tr;
                                            }
                                          },
                                          controller2: confirmPasswordController,
                                          hintText: 'Confirm Password'.tr,
                                          icon: Icons.lock,
                                        );
                                      }),
                                      SizedBox(height: height*0.015,),
                                      CustomTextField(
                                        passwordBool: false,
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Phone number is empty !'.tr;
                                          }


                                        },
                                        controller2: phonelController,
                                        hintText: 'Phone '.tr,
                                        icon: Icons.add_call,
                                        textInputType: TextInputType.phone,
                                      ),
                                      SizedBox(height: locale == 'en'?height*0.07:height*0.02,),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                              color: context.theme.primaryColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  if (_globalKey.currentState!.validate()) {
                                    _signUpController.name = nameController.text;
                                    _signUpController.email = emailController.text;
                                    _signUpController.password = passwordController.text;
                                    _signUpController.confirmPassword = confirmPasswordController.text;
                                    _signUpController.phoneNumber = phonelController.text;
                                    upload();
                                    _signUpController.onButtonTap(context);
                                  }
                                },
                                child: Text(
                                  'Register'.tr,
                                  style: const TextStyle(fontFamily: 'HacenN',
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                )),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: height*0.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?'.tr,
                                    style: const TextStyle(fontFamily: 'HacenN',
                                      color: kGrey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.offNamed('/login');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Sign in'.tr,
                                      style:  TextStyle(fontFamily: 'HacenN',
                                        color:context.theme.primaryColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: height*0.01,),
                              // Padding(
                              //   padding:  EdgeInsets.only(left: width*0.33,right: width*0.02,top: height*0.04,bottom: 0),
                              //   child: Row(
                              //     children: [
                              //       TextButton(onPressed: (){}, child: Text('English',
                              //         style: TextStyle(
                              //           color: kTextFieldBorder,
                              //           fontSize: 18,
                              //         ),
                              //       )),
                              //       TextButton(onPressed: (){}, child: Text('العربية',
                              //         style: TextStyle(
                              //           color: kGrey,
                              //           fontSize: 18,
                              //         ),
                              //       ))
                              //     ],
                              //   ),
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      );

  }

}
