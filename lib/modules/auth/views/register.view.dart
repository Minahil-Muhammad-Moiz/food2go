import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth.controller.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../routes/app_routes.dart';

/// RegisterView - User registration screen
///
/// Why: New users can create an account
class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        title: Text(
          'Create Account',
          style: GoogleFonts.poppins(
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─────────────────────────────────────
              // 1. HEADER
              // ─────────────────────────────────────
              _buildHeader(),
              
              const SizedBox(height: 30),
              
              // ─────────────────────────────────────
              // 2. REGISTER FORM
              // ─────────────────────────────────────
              _buildRegisterForm(),
              
              const SizedBox(height: 30),
              
              // ─────────────────────────────────────
              // 3. REGISTER BUTTON
              // ─────────────────────────────────────
              _buildRegisterButton(),
              
              const SizedBox(height: 20),
              
              // ─────────────────────────────────────
              // 4. LOGIN LINK
              // ─────────────────────────────────────
              _buildLoginLink(),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 1. HEADER
  // ─────────────────────────────────────────────
  
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.registerTitle,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.registerSubtitle,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 2. REGISTER FORM
  // ─────────────────────────────────────────────
  
  Widget _buildRegisterForm() {
    return Column(
      children: [
        // Full Name
        CustomTextField(
          label: AppStrings.fullName,
          hint: 'Enter your full name',
          prefixIcon: Icons.person,
          onChanged: (value) => controller.regName.value = value,
        ),
        const SizedBox(height: 16),
        
        // Email
        CustomTextField(
          label: AppStrings.email,
          hint: 'Enter your email',
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => controller.regEmail.value = value,
        ),
        const SizedBox(height: 16),
        
        // Username
        CustomTextField(
          label: AppStrings.username,
          hint: 'Choose a username',
          prefixIcon: Icons.alternate_email,
          onChanged: (value) => controller.regUsername.value = value,
        ),
        const SizedBox(height: 16),
        
        // Password
        CustomTextField(
          label: AppStrings.password,
          hint: 'Create a password',
          prefixIcon: Icons.lock,
          obscureText: true,
          onChanged: (value) => controller.regPassword.value = value,
        ),
        const SizedBox(height: 16),
        
        // Confirm Password
        CustomTextField(
          label: 'Confirm Password',
          hint: 'Confirm your password',
          prefixIcon: Icons.lock_outline,
          obscureText: true,
          onChanged: (value) => controller.regConfirmPassword.value = value,
        ),
        const SizedBox(height: 16),
        
        // Age (Optional)
        CustomTextField(
          label: 'Age (Optional)',
          hint: 'Enter your age',
          prefixIcon: Icons.calendar_today,
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.isNotEmpty) {
              controller.regAge.value = int.tryParse(value);
            }
          },
        ),
        const SizedBox(height: 16),
        
        // Country (Optional)
        CustomTextField(
          label: 'Country (Optional)',
          hint: 'Enter your country',
          prefixIcon: Icons.location_on,
          onChanged: (value) => controller.regCountry.value = value,
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 3. REGISTER BUTTON
  // ─────────────────────────────────────────────
  
  Widget _buildRegisterButton() {
    return Obx(() => CustomButton(
      onPressed: controller.isLoading.value ? null : controller.register,
      text: controller.isLoading.value ? 'Creating account...' : AppStrings.register,
      isLoading: controller.isLoading.value,
    ));
  }

  // ─────────────────────────────────────────────
  // 4. LOGIN LINK
  // ─────────────────────────────────────────────
  
  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account?",
          style: GoogleFonts.poppins(
            color: AppColors.textSecondary,
          ),
        ),
        TextButton(
          onPressed: () => Get.offAllNamed(AppRoutes.login),
          child: Text(
            'Login',
            style: GoogleFonts.poppins(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}