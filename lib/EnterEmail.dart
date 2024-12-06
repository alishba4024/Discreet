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

class Enteremail extends StatefulWidget {
  const Enteremail({super.key});

  @override
  State<Enteremail> createState() => _EnteremailState();
}

class _EnteremailState extends State<Enteremail> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.3),

                // title
                Text(
                  'Enter your email!',
                  style: TextStyle(
                    fontFamily: 'hellix',
                    fontSize: 28 * (screenWidth / 375),
                    fontWeight: FontWeight.bold,
                    color: AppColors.HText,
                  ),
                ),

                SizedBox(height: screenHeight * 0.04),

                // Email Address Input
                const CustomTextField(
                  labelText: 'Email address',
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: screenHeight * 0.03),

                GradientButton(
                  label: 'Continue',
                  onPressed: () {
                    Get.to(OTPVerificationScreen());
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
      ),
    );
  }
}
