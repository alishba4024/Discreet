import 'package:flutter/material.dart';
import 'package:flutter_application_1/selectToBegin.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();

    // Redirect to SelectToBeginScreen after 3 seconds using GetX
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(SelectToBegin());
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =
        MediaQuery.of(context).size.height; // Correct height usage

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFBAC9FF),
                  Color(0xffFFFFFF),
                  Color(0xff9FB3F9),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo container
                Container(
                  height: screenHeight * 0.3,
                  width: screenWidth * 0.7,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
