import 'package:flutter/material.dart';
import 'package:flutter_application_1/colors_constants.dart';
import 'package:flutter_application_1/components/GradientButton.dart';
import 'package:flutter_application_1/components/footer_component.dart';

class CreateQRScreen extends StatefulWidget {
  const CreateQRScreen({super.key});

  @override
  State<CreateQRScreen> createState() => _CreateQRScreenState();
}

class _CreateQRScreenState extends State<CreateQRScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _idTypeController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _expiresController = TextEditingController();

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
          'Create A QR',
          style: TextStyle(
            fontFamily: 'hellix',
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: AppColors.HText,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Upload Document Section
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3D57B5),
                      Color(0xFF1B264F),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: AppColors.Text,
                              width: screenWidth * 0.008),
                        ),
                        child: Icon(
                          Icons.add,
                          size: screenWidth * 0.1,
                          color: AppColors.Text,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Upload Document',
                        style: TextStyle(
                          fontFamily: 'hellix',
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                          color: AppColors.Text,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // OR Section
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.025),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'OR',
                        style: TextStyle(
                          fontSize: screenWidth * 0.043,
                          fontFamily: 'hellix',
                          color: AppColors.HText,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Enter Details',
                        style: TextStyle(
                          fontFamily: 'hellix',
                          fontSize: screenWidth * 0.065,
                          color: AppColors.HText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        'Please check your data before submitting it',
                        style: TextStyle(
                          fontFamily: 'hellix',
                          fontSize: screenWidth * 0.04,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Form Section
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                        _nameController, 'Name', screenWidth, screenHeight),
                    Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.04, top: screenHeight * 0.005),
                      child: Text(
                        'First scanned ID',
                        style: TextStyle(
                          fontFamily: 'hellix',
                          fontSize: screenWidth * 0.045, // Responsive font size
                          color: AppColors.HText,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildTextField(_dobController, 'Date of Birth',
                        screenWidth, screenHeight),
                    _buildTextField(
                        _sexController, 'Sex', screenWidth, screenHeight),
                    _buildTextField(_idTypeController, 'ID Type', screenWidth,
                        screenHeight),
                    _buildTextField(_idNumberController, 'ID Number',
                        screenWidth, screenHeight),
                    _buildTextField(_expiresController, 'Expires', screenWidth,
                        screenHeight),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // Proceed Button
              GradientButton(
                label: 'Proceed Next',
                onPressed: () {},
              ),

              SizedBox(height: screenHeight * 0.05),

              // Footer Component
              const FooterComponent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: screenWidth * 0.04,
          ),
          fillColor: const Color(0xFFF5EFEF),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.06),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.06),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.06),
            borderSide: const BorderSide(color: Colors.grey, width: 1.5),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02,
            horizontal: screenWidth * 0.05,
          ),
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
