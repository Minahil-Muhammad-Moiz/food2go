import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth.controller.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../routes/app_routes.dart';

/// LoginView - User login screen
///
/// WHY: First screen users see (unless already logged in)
/// Design philosophy:
/// - Clean and welcoming
/// - Easy to use
/// - Brand consistent
class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─────────────────────────────────────
              // 1. APP LOGO & BRAND
              // ─────────────────────────────────────
              _buildBrandSection(),
              
              const SizedBox(height: 40),
              
              // ─────────────────────────────────────
              // 2. WELCOME TEXT
              // ─────────────────────────────────────
              _buildWelcomeSection(),
              
              const SizedBox(height: 30),
              
              // ─────────────────────────────────────
              // 3. LOGIN FORM
              // ─────────────────────────────────────
              _buildLoginForm(),
              
              const SizedBox(height: 24),
              
              // ─────────────────────────────────────
              // 4. LOGIN BUTTON
              // ─────────────────────────────────────
              _buildLoginButton(),
              
              const SizedBox(height: 20),
              
              // ─────────────────────────────────────
              // 5. DIVIDER
              // ─────────────────────────────────────
              _buildDivider(),
              
              const SizedBox(height: 20),
              
              // ─────────────────────────────────────
              // 6. REGISTER LINK
              // ─────────────────────────────────────
              _buildRegisterLink(),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 1. BRAND SECTION
  // ─────────────────────────────────────────────
  
  /// Brand section with logo and app name
  ///
  /// Why: Builds brand recognition
  /// First impression matters!
  Widget _buildBrandSection() {
    return Center(
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.restaurant,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppStrings.appName,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          Text(
            AppStrings.appSubtitle,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 2. WELCOME SECTION
  // ─────────────────────────────────────────────
  
  /// Welcome message
  ///
  /// Why: Makes the user feel welcomed
  /// Personal touch improves UX
  Widget _buildWelcomeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.loginTitle,
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.loginSubtitle,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 3. LOGIN FORM
  // ─────────────────────────────────────────────
  
  /// Login form with email and password
  ///
  /// Why: Uses CustomTextField for consistency
  /// Binds directly to controller values
  Widget _buildLoginForm() {
    return Column(
      children: [
        // Email Field
        CustomTextField(
          label: AppStrings.email,
          hint: 'Enter your email',
          prefixIcon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => controller.email.value = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.emailRequired;
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        
        // Password Field
        CustomTextField(
          label: AppStrings.password,
          hint: 'Enter your password',
          prefixIcon: Icons.lock,
          obscureText: true,
          onChanged: (value) => controller.password.value = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return AppStrings.passwordRequired;
            }
            return null;
          },
        ),
        const SizedBox(height: 12),
        
        // Remember Me & Forgot Password
        _buildRememberAndForgotRow(),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 4. REMEMBER ME & FORGOT PASSWORD
  // ─────────────────────────────────────────────
  
  /// Row with remember me checkbox and forgot password link
  ///
  /// Why: Provides additional options
  /// Remember me improves UX for returning users
  Widget _buildRememberAndForgotRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Remember Me
        Obx(() => Row(
          children: [
            Checkbox(
              value: controller.rememberMe.value,
              onChanged: (value) => 
                  controller.rememberMe.value = value ?? false,
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            Text(
              'Remember me',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        )),
        
        // Forgot Password
        TextButton(
          onPressed: _showForgotPasswordDialog,
          child: Text(
            'Forgot password?',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 5. LOGIN BUTTON
  // ─────────────────────────────────────────────
  
  /// Login button with loading state
  ///
  /// Why: Uses CustomButton for consistency
  /// Shows loading state to prevent double taps
  Widget _buildLoginButton() {
    return Obx(() => CustomButton(
      onPressed: controller.isLoading.value ? null : controller.login,
      text: controller.isLoading.value ? 'Logging in...' : AppStrings.login,
      isLoading: controller.isLoading.value,
    ));
  }

  // ─────────────────────────────────────────────
  // 6. DIVIDER
  // ─────────────────────────────────────────────
  
  /// "or" divider
  ///
  /// Why: Visually separates login from register
  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider(color: AppColors.textLight)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'or',
            style: GoogleFonts.poppins(
              color: AppColors.textLight,
            ),
          ),
        ),
        const Expanded(child: Divider(color: AppColors.textLight)),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 7. REGISTER LINK
  // ─────────────────────────────────────────────
  
  /// Link to register screen
  ///
  /// Why: Easy access for new users
  Widget _buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: GoogleFonts.poppins(
            color: AppColors.textSecondary,
          ),
        ),
        TextButton(
          onPressed: () => Get.toNamed(AppRoutes.register),
          child: Text(
            'Sign Up',
            style: GoogleFonts.poppins(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 8. DIALOGS
  // ─────────────────────────────────────────────
  
  /// Show forgot password dialog
  ///
  /// Why: Users need a way to reset password
  void _showForgotPasswordDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Reset Password',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your email address and we\'ll send you a link to reset your password.',
              style: GoogleFonts.poppins(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Email',
              hint: 'Enter your email',
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel', style: GoogleFonts.poppins()),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Check Your Email',
                'Password reset link sent!',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            child: Text('Send', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }
}