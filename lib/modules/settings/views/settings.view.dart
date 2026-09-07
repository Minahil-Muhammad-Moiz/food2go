import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../routes/app_routes.dart';

/// SettingsView - Main settings screen
///
/// Features:
/// - Profile section
/// - Notification settings
/// - App preferences
/// - Logout
class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // ─────────────────────────────────────────────
      // APP BAR
      // ─────────────────────────────────────────────
      appBar: AppBar(
        title: Text(
          'Settings',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),

      // ─────────────────────────────────────────────
      // BODY
      // ─────────────────────────────────────────────
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Profile Section
          _buildProfileSection(),

          const SizedBox(height: 16),

          // 2. General Settings
          _buildSettingsSection(
            title: 'General',
            items: [
              SettingsItem(
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () => Get.toNamed(AppRoutes.profile),
              ),
              SettingsItem(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () => Get.toNamed(AppRoutes.notifications),
              ),
              SettingsItem(
                icon: Icons.language,
                title: 'Language',
                onTap: () {
                  Get.snackbar(
                    'Language',
                    'Language settings coming soon!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 3. Preferences
          _buildSettingsSection(
            title: 'Preferences',
            items: [
              SettingsItem(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                trailing: Switch(
                  value: false,
                  onChanged: (value) {
                    Get.snackbar(
                      'Dark Mode',
                      'Dark mode coming soon!',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  activeColor: AppColors.primary,
                ),
              ),
              SettingsItem(
                icon: Icons.notifications_active,
                title: 'Reminders',
                trailing: Switch(
                  value: true,
                  onChanged: (value) {
                    Get.snackbar(
                      'Reminders',
                      'Reminders ${value ? "enabled" : "disabled"}',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  activeColor: AppColors.primary,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // 4. Support
          _buildSettingsSection(
            title: 'Support',
            items: [
              SettingsItem(
                icon: Icons.help_outline,
                title: 'Help Center',
                onTap: () {
                  Get.snackbar(
                    'Help Center',
                    'Help content coming soon!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              SettingsItem(
                icon: Icons.feedback_outlined,
                title: 'Send Feedback',
                onTap: () {
                  Get.snackbar(
                    'Feedback',
                    'Thank you for your feedback!',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                },
              ),
              SettingsItem(
                icon: Icons.info_outline,
                title: 'About',
                onTap: () {
                  _showAboutDialog(context);
                },
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 5. Logout Button
          _buildLogoutButton(),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 1. PROFILE SECTION
  // ─────────────────────────────────────────────

  Widget _buildProfileSection() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.primaryLight,
            child: const Icon(Icons.person, size: 35, color: AppColors.primary),
          ),
          const SizedBox(width: 16),

          // User info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'John Doe',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  'john@email.com',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Edit button
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.profile),
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 2. SETTINGS SECTION
  // ─────────────────────────────────────────────

  Widget _buildSettingsSection({
    required String title,
    required List<SettingsItem> items,
  }) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          // Items
          ...items,
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 3. LOGOUT BUTTON
  // ─────────────────────────────────────────────

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _showLogoutDialog,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.error,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Logout',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 4. DIALOGS
  // ─────────────────────────────────────────────

  void _showLogoutDialog() {
    Get.dialog(
      AlertDialog(
        title: Text(
          'Logout',
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Are you sure you want to logout?',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel', style: GoogleFonts.poppins()),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              // TODO: Implement logout
              Get.offAllNamed(AppRoutes.login);
              Get.snackbar(
                'Logged Out',
                'You have been logged out successfully',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            child: Text('Logout', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Food2Go',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.restaurant,
        size: 40,
        color: AppColors.primary,
      ),
      children: [
        const SizedBox(height: 8),
        Text(
          'Track your food intake and eat healthy!',
          style: GoogleFonts.poppins(),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// SETTINGS ITEM WIDGET
// ─────────────────────────────────────────────

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingsItem({
    Key? key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 22, color: AppColors.textSecondary),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.textLight,
                ),
          ],
        ),
      ),
    );
  }
}
