import 'package:flutter/material.dart';
import 'package:flutter_application_1/CreateAccountScreen.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/button_component.dart';
import 'package:flutter_application_1/loginScreen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class SelectToBegin extends StatefulWidget {
  const SelectToBegin({super.key});

  @override
  State<SelectToBegin> createState() => _SelectToBeginState();
}

class _SelectToBeginState extends State<SelectToBegin> {
  String? selectedButton; // To track which button is selected

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // Define dynamic spacing and font sizes
    final double titleFontSize = screenWidth * 0.08;
    final double buttonSpacing = screenHeight * 0.02;
    final double bottomPadding = screenHeight * 0.05;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFBAC9FF),
              Color(0xFFFFFFFF),
              Color(0xFF9FB3F9),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.38), // Top spacing dynamically
              Text(
                'Select To Begin',
                style: TextStyle(
                  fontFamily: 'Hellix',
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: AppColors.selectToBegin,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Buttons Section
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonGroupComponent(
                    label: 'Continue As A Customer',
                    isSelected: selectedButton == 'customer',
                    onPressed: () {
                      setState(() {
                        selectedButton = 'customer';
                      });
                      Get.to(Loginscreen());
                    },
                  ),
                  SizedBox(height: buttonSpacing),
                  ButtonGroupComponent(
                    label: 'Continue As An Employee',
                    isSelected: selectedButton == 'employee',
                    onPressed: () {
                      setState(() {
                        selectedButton = 'employee';
                      });
                      Get.to(Loginscreen());
                    },
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.3), // Spacing before terms

              // Terms and Conditions
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By continuing you accept our standard ",
                    style: TextStyle(
                      fontFamily: 'Hellix',
                      fontSize: screenWidth * 0.033,
                      color: AppColors.TermConditionText,
                    ),
                    children: [
                      TextSpan(
                        text: "terms and conditions",
                        style: TextStyle(
                          fontFamily: 'Hellix',
                          fontSize: screenWidth * 0.033,
                          color: AppColors.TermConditionText,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(
                        text: " and our ",
                        style: TextStyle(
                          fontSize: screenWidth * 0.033,
                          fontFamily: 'Hellix',
                        ),
                      ),
                      TextSpan(
                        text: "privacy policy.",
                        style: TextStyle(
                          fontFamily: 'Hellix',
                          fontSize: screenWidth * 0.033,
                          color: AppColors.TermConditionText,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: bottomPadding),
            ],
          ),
        ),
      ),
    );
  }
}
