import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors_constants.dart';

class ButtonGroupComponent extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color borderColor; // Border color
  final double borderWidth; // Border width
  final bool isSelected; // Selection state

  const ButtonGroupComponent({
    Key? key,
    required this.label,
    required this.onPressed,
    this.borderColor = const Color(0xFF1D2955), // Default border color
    this.borderWidth = 1.0, // Default border width
    this.isSelected = false, // Default unselected state
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final horizontalPadding = screenWidth * 0.07;
    final fontSize = screenWidth * 0.035;
    final buttonHeight = screenHeight * 0.06;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected
                ? AppColors.selectToBegin
                : borderColor, // Border color changes
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(50),
          color: isSelected
              ? AppColors.selectToBegin // Dark blue when selected
              : Colors.transparent, // Transparent when not selected
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected
                ? AppColors.selectToBegin // Background for selected state
                : Colors.transparent, // Background for unselected state
            shadowColor: Colors.transparent, // Remove shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            minimumSize: Size(double.infinity, buttonHeight),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              color: isSelected
                  ? AppColors.Text // Text color changes to white when selected
                  : borderColor, // Match text color with border when unselected
            ),
          ),
        ),
      ),
    );
  }
}
