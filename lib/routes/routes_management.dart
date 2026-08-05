import 'package:flutter/material.dart';

import '../screens/auth/login_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/cart/cart_screen.dart';
import '../screens/food/food_detail_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/splash_screen.dart';
import 'app_routes.dart';

class RouteManagement {
  static const String initialRoute = AppRoutes.splash;

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.splash: (context) => const SplashScreen(),
    AppRoutes.login: (context) => const LoginScreen(),
    AppRoutes.signup: (context) => const SignupScreen(),
    AppRoutes.home: (context) => const HomeScreen(),
    AppRoutes.detail: (context) => const FoodDetailScreen(),
    AppRoutes.cart: (context) => const CartScreen(),
    AppRoutes.profile: (context) => const ProfileScreen(),
  };
}
