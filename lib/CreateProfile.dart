import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ProfileCreated.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/CustomTextField.dart';
import 'package:flutter_application_1/components/GradientButton.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class CreateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1),

              // Camera Icon
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.login,
                child: Icon(
                  Icons.camera_alt,
                  size: 40,
                  color: AppColors.Text,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Create Profile Title
              Text(
                'Create Profile',
                style: TextStyle(
                  fontFamily: 'hellix',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.HText,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Input Fields
              // Email Address Input
              const CustomTextField(
                labelText: 'Phone Number',
                keyboardType: TextInputType.phone,
              ),

              SizedBox(height: screenHeight * 0.02),
              // Email Address Input
              const CustomTextField(
                labelText: 'Email address',
                keyboardType: TextInputType.emailAddress,
              ),

              SizedBox(height: screenHeight * 0.02),
              // Password Input
              const CustomTextField(
                labelText: 'Password',
                isPassword: true,
              ),
              SizedBox(height: screenHeight * 0.02),
              // Password Input
              const CustomTextField(
                labelText: 'Location',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: screenHeight * 0.05),

              // Continue Button
              GradientButton(
                label: 'Continue',
                onPressed: () {
                  Get.to(ProfileCreated());
                },
              ),
              SizedBox(height: screenHeight * 0.07),

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
            ],
          ),
        ),
      ),
    );
  }
}
