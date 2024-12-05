import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Calculate scaling factor for font size and padding
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    double baseWidth = 375;
    double scaleFactor = screenWidth / baseWidth;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: screenWidth * 0.9, // 90% of the screen width
          constraints: const BoxConstraints(
              maxWidth: 600), // Max width for larger screens
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            style: TextStyle(
              fontSize: 15 * scaleFactor,
            ),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: TextStyle(
                fontSize: 15 * scaleFactor,
                fontFamily: 'hellix',
                color: Colors.black87,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 15 * scaleFactor,
                horizontal: 20 * scaleFactor,
              ),
            ),
          ),
        );
      },
    );
  }
}
