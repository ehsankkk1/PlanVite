import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plane_vite/constants.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGround,
      body: Center(
        child :Image.asset(
            "images/loader.gif"
        ),
      ),
    );
  }
}

/*class LoaderScreen extends StatelessWidget {
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
  }
}*/