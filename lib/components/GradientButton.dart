import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final double borderRadius;
  final double minWidth;
  final double minHeight;
  final TextStyle textStyle;

  const GradientButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.gradientColors = const [
      Color(0xFF3D57B5),
      Color(0xFF1B264F),
    ], // Default gradient colors
    this.borderRadius = 30.0,
    this.minWidth = double.infinity,
    this.minHeight = 60.0,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
      color: Colors.white, // Default text color
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent, // Transparent background
        disabledForegroundColor: Colors.transparent.withOpacity(0.38),
        disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
        minimumSize: Size(minWidth, minHeight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        shadowColor: Colors.transparent, // Remove shadow
        padding: EdgeInsets.zero,
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradientColors, // Gradient colors
          ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            minWidth: minWidth,
            minHeight: minHeight,
          ), // Ensures button size
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
