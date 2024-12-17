import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CreateAccountScreen.dart';
import 'package:flutter_application_1/Dashboard.dart';
import 'package:flutter_application_1/EnterEmail.dart';
import 'package:flutter_application_1/OTPVerification.dart';
import 'package:flutter_application_1/auth/auth_service.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/CustomTextField.dart';
import 'package:flutter_application_1/components/GradientButton.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.15),

                // Logo Widget
                Image.asset(
                  'assets/images/logo.png',
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.1,
                ),

                SizedBox(height: screenHeight * 0.03),

                // Google Sign-In Button
                ElevatedButton.icon(
                  onPressed: () {
                    signInWithGoogle();
                  },
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
                CustomTextField(
                  controller: emailController,
                  labelText: 'Email address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    return null;
                  },
                ),

                SizedBox(height: screenHeight * 0.02),

                // Password Input
                CustomTextField(
                  controller: passwordController,
                  labelText: 'Password',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),

                // Forgot Password? Text
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(Enteremail());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 12 * (screenWidth / 375),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: screenHeight * 0.04),

                // Login Button
                GradientButton(
                  label: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigate to OTPVerification if validation passes
                      Get.to(OTPVerificationScreen(userType: 'customer'));
                    }
                  },
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

                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14 * (screenWidth / 375),
                      color: AppColors.HText,
                      fontFamily: 'hellix',
                    ),
                    children: [
                      const TextSpan(
                        text: 'Don’t have an account? ',
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

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);

    if (userCredential.user != null) {
      Get.to(Dashboard());
    }
  }
}
