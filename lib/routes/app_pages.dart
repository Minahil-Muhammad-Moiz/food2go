import 'package:food2go/routes/app_routes.dart';
import 'package:get/get.dart';
import '../modules/auth/views/login.view.dart';
// import '../modules/auth/views/register.view.dart';
// import '../modules/home/views/home.view.dart';

/// AppPages - GetX routing configuration
///
/// WHY: GetX provides a powerful routing system. We configure all routes here:
/// - Named routes with their corresponding pages
/// - Bindings for dependency injection
/// - Transitions between screens
class AppPages {
  // List of all routes
  // WHY: Single place to see all screens in the app
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      // binding: AuthBinding(), // We'll add this later
      transition: Transition.fadeIn,
    ),
    // GetPage(
    //   name: AppRoutes.register,
    //   page: () => const RegisterView(),
    //   transition: Transition.rightToLeft,
    // ),
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomeView(),
    //   transition: Transition.fadeIn,
    // ),
    // Add more routes as we build them
  ];
  
  // Initial route
  // WHY: Which screen to show when app starts
  static const String initialRoute = AppRoutes.login;
}