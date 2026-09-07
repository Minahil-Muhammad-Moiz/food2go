import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';

/// DailyProgress - Show daily nutrition progress
///
/// Displays:
/// - Calorie progress
/// - Protein progress
/// - Carbs progress
/// - Fat progress
class DailyProgress extends StatelessWidget {
  const DailyProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Row(
            children: [
              Icon(
                Icons.trending_up,
                color: AppColors.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Daily Progress',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Calorie Progress
          _buildProgressBar(
            label: 'Calories',
            current: 1200,
            target: 2000,
            color: AppColors.primary,
            icon: Icons.local_fire_department,
          ),
          
          const SizedBox(height: 12),
          
          // Protein Progress
          _buildProgressBar(
            label: 'Protein',
            current: 45,
            target: 50,
            color: AppColors.protein,
            icon: Icons.fitness_center,
            unit: 'g',
          ),
          
          const SizedBox(height: 12),
          
          // Carbs Progress
          _buildProgressBar(
            label: 'Carbs',
            current: 150,
            target: 250,
            color: AppColors.grains,
            icon: Icons.grain,
            unit: 'g',
          ),
          
          const SizedBox(height: 12),
          
          // Fat Progress
          _buildProgressBar(
            label: 'Fat',
            current: 40,
            target: 70,
            color: AppColors.warning,
            icon: Icons.emoji_food_beverage,
            unit: 'g',
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar({
    required String label,
    required double current,
    required double target,
    required Color color,
    required IconData icon,
    String unit = '',
  }) {
    // Calculate percentage (cap at 100%)
    double percentage = (current / target).clamp(0.0, 1.0);
    String displayText = '$current$unit / $target$unit';
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label row
        Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            Text(
              displayText,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        
        // Progress bar
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            widthFactor: percentage,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}