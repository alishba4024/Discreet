import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/footer_component.dart';

class Scantheqr extends StatefulWidget {
  const Scantheqr({super.key});

  @override
  State<Scantheqr> createState() => _ScantheqrState();
}

class _ScantheqrState extends State<Scantheqr> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFFFFF),
              Color(0xFFBAC9FF),
              Color(0xFFFFFFFF),
              Color(0xFF9FB3F9),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.login,
                        size: screenWidth * 0.06,
                      ),
                    ),
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
                    SizedBox(width: screenWidth * 0.1),
                  ],
                ),
                SizedBox(height: screenHeight * 0.09),

                // QR Code Image
                Center(
                  child: Image.asset(
                    'assets/images/qrcode2.png',
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
                SizedBox(height: screenHeight * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
