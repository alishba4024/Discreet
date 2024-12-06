import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CreateAccountScreen.dart';
import 'package:flutter_application_1/OTPVerification.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/CustomTextField.dart';
import 'package:flutter_application_1/components/GradientButton.dart';
import 'package:flutter_application_1/loginScreen.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class Createnewpass extends StatefulWidget {
  const Createnewpass({super.key});

  @override
  State<Createnewpass> createState() => _CreatenewpassState();
}

class _CreatenewpassState extends State<Createnewpass> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.3),

              // title
              Text(
                'Create New Password!',
                style: TextStyle(
                  fontFamily: 'hellix',
                  fontSize: 28 * (screenWidth / 375),
                  fontWeight: FontWeight.bold,
                  color: AppColors.HText,
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              // Password Input
              const CustomTextField(
                labelText: 'Enter New Password',
                isPassword: true,
              ),

              SizedBox(height: screenHeight * 0.02),

              // Password Input
              const CustomTextField(
                labelText: 'Re-Enter Password',
                isPassword: true,
              ),

              SizedBox(height: screenHeight * 0.03),

              GradientButton(
                label: 'Continue',
                onPressed: () {
                  // Get.to(OTPVerificationScreen());
                },
              ),

              SizedBox(height: screenHeight * 0.20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: 'hellix',
                      fontSize: 12 * (screenWidth / 375),
                      color: Colors.black87,
                    ),
                    children: [
                      const TextSpan(
                        text: 'By continuing you accept our standard ',
                      ),
                      TextSpan(
                        text: 'terms and conditions',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black87,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(
                        text: ' and our ',
                      ),
                      TextSpan(
                        text: 'privacy policy.',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.black87,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14 * (screenWidth / 375),
                    color: AppColors.HText,
                    fontFamily: 'hellix',
                  ),
                  children: [
                    const TextSpan(
                      text: 'Back to: ',
                      style: TextStyle(
                        fontFamily: 'hellix',
                      ),
                    ),
                    TextSpan(
                      text: 'Login ',
                      style: TextStyle(
                        fontFamily: 'hellix',
                        color: AppColors.login,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(Loginscreen());
                        },
                    ),
                    TextSpan(text: '/'),
                    TextSpan(
                      text: ' Sign Up',
                      style: TextStyle(
                        fontFamily: 'hellix',
                        color: AppColors.HText,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(CreateAccountScreen());
                        },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
