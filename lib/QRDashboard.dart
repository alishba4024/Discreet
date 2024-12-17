import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/footer_component.dart';

class Qrdashboard extends StatefulWidget {
  const Qrdashboard({super.key});

  @override
  State<Qrdashboard> createState() => _QrdashboardState();
}

class _QrdashboardState extends State<Qrdashboard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.04;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dashboard',
                              style: TextStyle(
                                fontFamily: 'hellix',
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Hey TOM!',
                              style: TextStyle(
                                fontFamily: 'hellix',
                                fontSize: screenWidth * 0.045,
                                color: AppColors.login,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.settings,
                            color: AppColors.login,
                            size: screenWidth * 0.08,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                    Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.09),
                        // Card 1: MY QR's
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height *
                                  0.23, // Responsive height
                              padding: EdgeInsets.all(screenWidth * 0.05),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(10), // Top-left corner
                                  topRight:
                                      Radius.circular(10), // Top-right corner
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFF3D57B5),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: -30,
                              left: screenWidth * 0.1,
                              right: screenWidth * 0.1,
                              child: Center(
                                child: Image.asset(
                                  'assets/images/QrCode.png',
                                  width: screenWidth * 0.4,
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.05),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: AppColors.Text,
                          ),
                          child: InkWell(
                            onTap: () {
                              // Get.to(Scantheqr());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Scan Qr/Check Record",
                                      style: TextStyle(
                                        fontFamily: 'hellix',
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.login,
                                      ),
                                    ),
                                    const Text(
                                      '180+ countries supported',
                                      style: TextStyle(
                                        fontFamily: 'hellix',
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: screenWidth * 0.05,
                                  color: AppColors.login,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Use FooterComponent
            Positioned(
              bottom: 20,
              left: screenWidth * 0.1,
              right: screenWidth * 0.1,
              child: const FooterComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
