import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors_constants.dart';

class FooterComponent extends StatelessWidget {
  const FooterComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04; // Responsive font size

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Powered By ",
          style: TextStyle(
            fontFamily: 'hellix',
            color: AppColors.HText,
            fontSize: fontSize,
          ),
        ),
        Text(
          "DSL",
          style: TextStyle(
            fontFamily: 'hellix',
            color: AppColors.login,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
