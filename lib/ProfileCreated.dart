import 'package:flutter/material.dart';
import 'package:flutter_application_1/CreateAccountScreen.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/GradientButton.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class ProfileCreated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(screenWidth * 0.05),
            ),
            padding: EdgeInsets.all(screenWidth * 0.06),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Circular Check Icon
                CircleAvatar(
                  radius: screenWidth * 0.13,
                  backgroundColor: AppColors.login,
                  child: const Icon(
                    Icons.check,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),

                // Success Message
                Text(
                  'Your profile has been created.',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'hellix',
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),

                // Continue Button
                GradientButton(
                  label: 'Continue',
                  onPressed: () {
                    Get.to(Dashboard());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
