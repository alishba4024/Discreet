import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/CreateProfile.dart';
import 'package:flutter_application_1/OTPVerification.dart';
import 'package:flutter_application_1/QRDashboard.dart';
import 'package:flutter_application_1/auth/auth_service.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/CustomTextField.dart';
import 'package:flutter_application_1/components/GradientButton.dart';
import 'package:flutter_application_1/loginScreen.dart';
import 'package:flutter_application_1/selectToBegin.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // Controllers for input fields
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

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
                SizedBox(height: screenHeight * 0.10),

                // Logo Widget
                Image.asset(
                  'assets/images/logo.png',
                  width: screenWidth * 0.7,
                  height: screenHeight * 0.1,
                ),
                SizedBox(height: screenHeight * 0.03),

                // Google Sign-In Button
                ElevatedButton.icon(
                  onPressed: signInWithGoogle,
                  icon: Image.asset(
                    'assets/images/google.png',
                    width: 24 * (screenWidth / 375),
                    height: 24 * (screenWidth / 375),
                  ),
                  label: Text(
                    'Sign up with Google',
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
                  'or Sign up with Email',
                  style: TextStyle(
                    fontFamily: 'hellix',
                    fontSize: 13 * (screenWidth / 375),
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // First Name Input
                CustomTextField(
                  controller: firstNameController,
                  labelText: 'First Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Last Name Input
                CustomTextField(
                  controller: lastNameController,
                  labelText: 'Last Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Email Input
                CustomTextField(
                  controller: emailController,
                  labelText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
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
                      return 'Please enter a password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Confirm Password Input
                CustomTextField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.04),

                // Sign-Up Button
                GradientButton(
                  label: 'Sign up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Proceed with form submission
                      Get.to(const Qrdashboard());
                    }
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Terms and Conditions
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

                // Login Redirect
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 14 * (screenWidth / 375),
                      color: AppColors.HText,
                      fontFamily: 'hellix',
                    ),
                    children: [
                      const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontFamily: 'hellix',
                        ),
                      ),
                      TextSpan(
                        text: 'Login',
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Google Sign-In Method
  Future<void> signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredential.user != null) {
      Get.to(Qrdashboard());
    }
  }
}
