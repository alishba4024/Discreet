import 'package:flutter/material.dart';
import 'package:flutter_application_1/CreateAccountScreen.dart';
import 'package:flutter_application_1/CreateNewPass.dart';
import 'package:flutter_application_1/CreateProfile.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:flutter_application_1/selectToBegin.dart';
import 'package:flutter_application_1/splashScreen.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
