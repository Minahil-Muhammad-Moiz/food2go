import 'package:get/get.dart';
import '../modules/auth/views/login.view.dart';
import '../modules/auth/views/register.view.dart';
import '../modules/auth/bindings/auth.binding.dart';
import '../modules/home/views/home.view.dart';
import 'app_routes.dart';

/// AppPages - All routes configuration
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterView(), 
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      transition: Transition.fadeIn,
    ),
  ];
  
  // Initial route
  static const String initialRoute = AppRoutes.login;
}