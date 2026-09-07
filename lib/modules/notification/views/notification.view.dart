import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

/// NotificationView - Notification settings screen
///
/// Features:
/// - Enable/disable notifications
/// - Select habits to notify
/// - Select notification times
class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─────────────────────────────────────────
            // 1. ENABLE NOTIFICATIONS
            // ─────────────────────────────────────────
            _buildEnableNotifications(),
            
            const SizedBox(height: 24),
            
            // ─────────────────────────────────────────
            // 2. SELECT HABITS
            // ─────────────────────────────────────────
            _buildSelectHabits(),
            
            const SizedBox(height: 24),
            
            // ─────────────────────────────────────────
            // 3. SELECT TIMES
            // ─────────────────────────────────────────
            _buildSelectTimes(),
            
            const SizedBox(height: 30),
            
            // ─────────────────────────────────────────
            // 4. SAVE BUTTON
            // ─────────────────────────────────────────
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 1. ENABLE NOTIFICATIONS
  // ─────────────────────────────────────────────
  
  Widget _buildEnableNotifications() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.notifications_active,
                color: AppColors.primary,
                size: 24,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enable Notifications',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  Text(
                    'Receive reminders to log your food',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Switch(
            value: true,
            onChanged: (value) {
              Get.snackbar(
                'Notifications',
                'Notifications ${value ? "enabled" : "disabled"}',
                snackPosition: SnackPosition.BOTTOM,
              );
            },
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 2. SELECT HABITS
  // ─────────────────────────────────────────────
  
  Widget _buildSelectHabits() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Habits to Track',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose which habits you want to be reminded about',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          
          // Habit Checkboxes
          _buildHabitCheckbox('Drink 8 glasses of water'),
          _buildHabitCheckbox('Eat 5 servings of fruits/vegetables'),
          _buildHabitCheckbox('Exercise for 30 minutes'),
          _buildHabitCheckbox('Get 8 hours of sleep'),
          _buildHabitCheckbox('Practice mindful eating'),
        ],
      ),
    );
  }

  Widget _buildHabitCheckbox(String habit) {
    return CheckboxListTile(
      value: true,
      onChanged: (value) {
        // Toggle habit selection
      },
      title: Text(
        habit,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: AppColors.textPrimary,
        ),
      ),
      activeColor: AppColors.primary,
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      dense: true,
    );
  }

  // ─────────────────────────────────────────────
  // 3. SELECT TIMES
  // ─────────────────────────────────────────────
  
  Widget _buildSelectTimes() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Times for Notification',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Choose when you want to receive reminders',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          
          // Time Selection
          _buildTimeChip('Morning', Icons.wb_sunny, true),
          const SizedBox(height: 8),
          _buildTimeChip('Afternoon', Icons.wb_sunny, false),
          const SizedBox(height: 8),
          _buildTimeChip('Evening', Icons.wb_twilight, false),
          const SizedBox(height: 8),
          _buildTimeChip('Night', Icons.nights_stay, false),
        ],
      ),
    );
  }

  Widget _buildTimeChip(String label, IconData icon, bool isSelected) {
    return InkWell(
      onTap: () {
        Get.snackbar(
          'Time Selected',
          '$label notifications enabled',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.textLight,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
              ),
            ),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppColors.primary,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 4. SAVE BUTTON
  // ─────────────────────────────────────────────
  
  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.back();
          Get.snackbar(
            'Success',
            'Notification settings saved!',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Save Settings',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}