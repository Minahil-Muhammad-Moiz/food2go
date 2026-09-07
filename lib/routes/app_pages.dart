import 'package:food2go/modules/notification/views/notification.view.dart';
import 'package:food2go/modules/settings/views/profile.view.dart';
import 'package:food2go/modules/settings/views/settings.view.dart';
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
     // Main App Pages
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => const NotificationView(),
      transition: Transition.rightToLeft,
    ),
  ];
  
  // Initial route
  static const String initialRoute = AppRoutes.login;
}