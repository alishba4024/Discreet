import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/footer_component.dart';

class Successfullycreated extends StatefulWidget {
  const Successfullycreated({super.key});

  @override
  State<Successfullycreated> createState() => _SuccessfullycreatedState();
}

class _SuccessfullycreatedState extends State<Successfullycreated> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: screenWidth * 0.05,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Successfully Created',
          style: TextStyle(
            fontFamily: 'hellix',
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: AppColors.HText,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Scan The QR",
                style: TextStyle(
                  fontFamily: 'hellix',
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                  color: AppColors.HText,
                ),
              ),
            ),
          ),

          // QR Code Image
          Center(
            child: Image.asset(
              'assets/images/qrcode3.png',
              width: screenWidth * 0.6,
              height: screenWidth * 0.6,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),

          // Scanning Status
          Container(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.0060,
                horizontal: screenWidth * 0.05),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.login, width: 1.5),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.qr_code_scanner,
                  color: AppColors.login,
                  size: screenHeight * 0.03,
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  "Scanning QR Code...",
                  style: TextStyle(
                    fontFamily: 'hellix',
                    fontSize: screenWidth * 0.042,
                    fontWeight: FontWeight.w500,
                    color: AppColors.login,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.05),

          // Circular Icon Button
          Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.login,
            ),
            child: Icon(
              Icons.share,
              size: screenWidth * 0.1,
              color: AppColors.Text,
            ),
          ),
          const Spacer(),

          // Footer Component
          const FooterComponent(),
          SizedBox(height: screenHeight * 0.03),
        ],
      ),
    );
  }
}
