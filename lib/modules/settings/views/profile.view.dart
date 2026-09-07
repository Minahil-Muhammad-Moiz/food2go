import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';

/// ProfileView - Edit user profile
///
/// Features:
/// - Edit name
/// - Edit email
/// - Edit username
/// - Edit age
/// - Edit country
class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Avatar
            _buildAvatarSection(),
            
            const SizedBox(height: 30),
            
            // Form Fields
            CustomTextField(
              label: 'Full Name',
              hint: 'Enter your full name',
              prefixIcon: Icons.person,
              initialValue: 'John Doe',
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              label: 'Email',
              hint: 'Enter your email',
              prefixIcon: Icons.email,
              initialValue: 'john@email.com',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              label: 'Username',
              hint: 'Enter your username',
              prefixIcon: Icons.alternate_email,
              initialValue: 'johndoe',
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              label: 'Age',
              hint: 'Enter your age',
              prefixIcon: Icons.calendar_today,
              initialValue: '25',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            
            CustomTextField(
              label: 'Country',
              hint: 'Enter your country',
              prefixIcon: Icons.location_on,
              initialValue: 'United States',
            ),
            
            const SizedBox(height: 30),
            
            // Save Button
            CustomButton(
              onPressed: () {
                Get.back();
                Get.snackbar(
                  'Success',
                  'Profile updated successfully!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              text: 'Save Changes',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primaryLight,
              child: const Icon(
                Icons.person,
                size: 50,
                color: AppColors.primary,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Get.snackbar(
                      'Camera',
                      'Camera feature coming soon!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Change Photo',
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}