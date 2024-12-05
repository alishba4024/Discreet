import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/components/GradientButton.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // OTP Verification Header
            const Text(
              'OTP Verification',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),

            // Subheading
            const Text(
              'We have sent you a 6 digit code.\nEnter the code to verify your identity.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 40),

            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(6, (index) {
                return SizedBox(
                  width: screenWidth * 0.12,
                  child: TextField(
                    autofocus: true,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          vertical:
                              10), // Adjust vertical padding to ensure circle shape
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              }),
            ),

            SizedBox(height: 40),

            // Countdown Timer
            const Text(
              '01:24',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40),

            // Verify Button
            GradientButton(
              label: 'Verify',
              onPressed: () {},
            ),
            SizedBox(height: 20),

            // Didn't receive a code
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Didn’t receive a code?',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
