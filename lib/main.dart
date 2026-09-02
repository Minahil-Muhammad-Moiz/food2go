import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_colors.dart';
import 'routes/app_routes.dart';
import 'routes/app_pages.dart';

/// main.dart - Entry point of the app
///
/// WHAT HAPPENS:
/// 1. Flutter starts
/// 2. main() is called
/// 3. App is created and shown
void main() {
  // WHY: We call this first to remove the splash screen
  // The splash screen is shown natively while Flutter loads
  // After this, our Flutter UI takes over
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  
  // Start the app
  runApp(const Food2GoApp());
}

/// Food2GoApp - The root widget
///
/// WHY: This is the foundation of our app
/// Everything else is built inside this
class Food2GoApp extends StatelessWidget {
  const Food2GoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Remove splash screen after first frame
    FlutterNativeSplash.remove();
    
    return GetMaterialApp(
      // App Metadata
      title: 'Food2Go',
      debugShowCheckedModeBanner: false, // Removes "DEBUG" banner
      
      // Theme
      theme: AppTheme.lightTheme,
      
      // Routing with GetX
      initialRoute: AppPages.initialRoute,
      getPages: AppPages.pages,
      
      // Fallback if route not found
      unknownRoute: GetPage(
        name: '/not-found',
        page: () => const NotFoundScreen(),
      ),
    );
  }
}

/// NotFoundScreen - Shown when user navigates to invalid route
/// 
/// WHY: Good UX - tells user something went wrong
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 80, color: AppColors.error),
            const SizedBox(height: 16),
            Text(
              'Page Not Found',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'The page you\'re looking for doesn\'t exist.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Get.offAllNamed(AppRoutes.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    );
  }
}