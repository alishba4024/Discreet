import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator; // Add validator

  const CustomTextField({
    Key? key,
    required this.labelText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.validator, // Accept validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate scaling factor for font size
    double baseWidth = 375;
    double scaleFactor = screenWidth / baseWidth;

    return Container(
      constraints: const BoxConstraints(maxWidth: 600),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        validator: validator, // Pass validator to TextFormField
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
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.grey, // Focused border color
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(
              color: Colors.grey, // Default border color
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 15 * scaleFactor,
            horizontal: 20 * scaleFactor,
          ),
        ),
      ),
    );
  }
}
