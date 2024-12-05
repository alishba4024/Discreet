import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/CustomTextField.dart';
import 'package:flutter_application_1/components/GradientButton.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
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
              SizedBox(height: screenHeight * 0.15),

              // Create account title
              Text(
                'Login to your account!',
                style: TextStyle(
                  fontFamily: 'hellix',
                  fontSize: 28 * (screenWidth / 375),
                  fontWeight: FontWeight.bold,
                  color: AppColors.HText,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'Find the things that you love!',
                style: TextStyle(
                  fontFamily: 'hellix',
                  fontSize: 16 * (screenWidth / 375),
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: screenHeight * 0.04),

              // Google Sign-In Button
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/google.png',
                  width: 24 * (screenWidth / 375),
                  height: 24 * (screenWidth / 375),
                ),
                label: Text(
                  'Login with Google',
                  style: TextStyle(
                    fontFamily: 'hellix',
                    color: AppColors.Text,
                    fontSize: 16 * (screenWidth / 375),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.HText,
                  minimumSize: Size(screenWidth, screenHeight * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              Text(
                'or Login with Email',
                style: TextStyle(
                  fontFamily: 'hellix',
                  fontSize: 13 * (screenWidth / 375),
                  color: Colors.black54,
                ),
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

              SizedBox(height: screenHeight * 0.04),

              GradientButton(
                label: 'Login',
                onPressed: () {},
              ),

              SizedBox(height: screenHeight * 0.02),

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

              SizedBox(height: screenHeight * 0.03),

              GestureDetector(
                onTap: () {},
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14 * (screenWidth / 375),
                      color: AppColors.HText,
                      fontFamily: 'hellix',
                    ),
                    children: [
                      const TextSpan(
                        text: 'Dont have an account?',
                        style: TextStyle(
                          fontFamily: 'hellix',
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          fontFamily: 'hellix',
                          color: AppColors.login,
                          decoration: TextDecoration.underline,
                        ),
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
    ;
  }
}
