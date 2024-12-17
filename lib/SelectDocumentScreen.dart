import 'package:flutter/material.dart';
import 'package:flutter_application_1/CreateQRScreen.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/footer_component.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class SelectDocumentScreen extends StatefulWidget {
  const SelectDocumentScreen({super.key});

  @override
  State<SelectDocumentScreen> createState() => _SelectDocumentScreenState();
}

class _SelectDocumentScreenState extends State<SelectDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final fontScale = screenWidth * 0.003;
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
                        size: screenWidth * 0.05,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Select Document Type",
                          style: TextStyle(
                            fontFamily: 'hellix',
                            fontSize: fontScale * 19,
                            fontWeight: FontWeight.bold,
                            color: AppColors.HText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.1),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                // Description
                Center(
                  child: Text(
                    "A 60-second timer has been started.\nYour photo from the chosen document\nwill be compared with your selfie.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'hellix',
                      fontSize: fontScale * 13,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04),
                // Document Options
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      // Document Card
                      buildDocumentCard(
                        screenWidth,
                        screenHeight,
                        fontScale,
                        "Passport",
                        "180+ countries supported",
                        Icons.book,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      buildDocumentCard(
                        screenWidth,
                        screenHeight,
                        fontScale,
                        "Driver’s License",
                        "180+ countries supported",
                        Icons.credit_card,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      buildDocumentCard(
                        screenWidth,
                        screenHeight,
                        fontScale,
                        "National ID Card",
                        "180+ countries supported",
                        Icons.account_box,
                      ),
                    ],
                  ),
                ),
                // Footer Component
                const FooterComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDocumentCard(
    double screenWidth,
    double screenHeight,
    double fontScale,
    String title,
    String subtitle,
    IconData icon,
  ) {
    return InkWell(
      onTap: () {
        Get.to(CreateQRScreen());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenWidth * 0.04,
        ),
        decoration: BoxDecoration(
          color: AppColors.Text.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: const BoxDecoration(
                    color: Color(0xff8EB6E6),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: screenWidth * 0.08,
                    color: AppColors.Text,
                  ),
                ),
                SizedBox(width: screenWidth * 0.04),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'hellix',
                        fontSize: fontScale * 16, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: AppColors.login,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: 'hellix',
                        fontSize: fontScale * 12, // Responsive font size
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: screenWidth * 0.04,
              color: AppColors.login,
            ),
          ],
        ),
      ),
    );
  }
}
