import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/home.controller.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../routes/app_routes.dart';
import '../widgets/food_card.dart';
import '../widgets/daily_progress.dart';

/// HomeView - Main dashboard screen
///
/// Features:
/// - Daily progress tracker
/// - Food list
/// - Quick add button
/// - Navigation to settings
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      
      // ─────────────────────────────────────────────
      // APP BAR
      // ─────────────────────────────────────────────
      appBar: AppBar(
        title: Text(
          AppStrings.appName,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
        actions: [
          // Notification Icon
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.notifications),
            icon: Stack(
              children: [
                const Icon(Icons.notifications_outlined),
                // Notification Badge
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Settings Icon
          IconButton(
            onPressed: () => Get.toNamed(AppRoutes.settings),
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      
      // ─────────────────────────────────────────────
      // BODY
      // ─────────────────────────────────────────────
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Welcome Message
            _buildWelcomeSection(),
            
            const SizedBox(height: 24),
            
            // 2. Daily Progress
            const DailyProgress(),
            
            const SizedBox(height: 24),
            
            // 3. Today's Meals Section
            _buildMealsSection(),
            
            const SizedBox(height: 16),
            
            // 4. Food List
            _buildFoodList(),
          ],
        ),
      ),
      
      // ─────────────────────────────────────────────
      // FLOATING ACTION BUTTON
      // ─────────────────────────────────────────────
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to add food screen
          Get.snackbar(
            'Add Food',
            'Food addition screen coming soon!',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // ─────────────────────────────────────────────
  // 1. WELCOME SECTION
  // ─────────────────────────────────────────────
  
  Widget _buildWelcomeSection() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: AppColors.primaryLight,
          child: const Icon(
            Icons.person,
            size: 30,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning! 👋',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              'Let\'s track your food today',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 2. MEALS SECTION HEADER
  // ─────────────────────────────────────────────
  
  Widget _buildMealsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Today\'s Meals',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        TextButton(
          onPressed: () {
            // TODO: Show all meals
          },
          child: Text(
            'View All',
            style: GoogleFonts.poppins(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 3. FOOD LIST
  // ─────────────────────────────────────────────
  
  Widget _buildFoodList() {
    return Column(
      children: [
        // Breakfast
        _buildMealCategory('Breakfast', Icons.bedtime, [
          FoodCard(
            name: 'Oatmeal with Berries',
            calories: 350,
            protein: 12,
            time: '08:30 AM',
            color: AppColors.fruits,
          ),
          FoodCard(
            name: 'Green Smoothie',
            calories: 200,
            protein: 8,
            time: '09:00 AM',
            color: AppColors.vegetables,
          ),
        ]),
        
        const SizedBox(height: 16),
        
        // Lunch
        _buildMealCategory('Lunch', Icons.lunch_dining, [
          FoodCard(
            name: 'Grilled Chicken Salad',
            calories: 450,
            protein: 35,
            time: '12:30 PM',
            color: AppColors.protein,
          ),
        ]),
        
        const SizedBox(height: 16),
        
        // Dinner
        _buildMealCategory('Dinner', Icons.dinner_dining, [
          FoodCard(
            name: 'Salmon with Vegetables',
            calories: 550,
            protein: 40,
            time: '07:00 PM',
            color: AppColors.protein,
          ),
        ]),
        
        const SizedBox(height: 16),
        
        // Snacks
        _buildMealCategory('Snacks', Icons.cookie, [
          FoodCard(
            name: 'Apple with Peanut Butter',
            calories: 180,
            protein: 5,
            time: '03:30 PM',
            color: AppColors.fruits,
          ),
        ]),
      ],
    );
  }

  // ─────────────────────────────────────────────
  // 4. MEAL CATEGORY
  // ─────────────────────────────────────────────
  
  Widget _buildMealCategory(String title, IconData icon, List<FoodCard> foods) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: AppColors.textSecondary),
            const SizedBox(width: 8),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            const Spacer(),
            Text(
              '${foods.length} items',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.textLight,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...foods,
      ],
    );
  }
}