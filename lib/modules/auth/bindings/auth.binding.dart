import 'package:get/get.dart';
import '../controllers/auth.controller.dart';

/// AuthBinding - Manages dependencies for auth module
///
/// WHY: This tells GetX:
/// "When user goes to login or register page, create AuthController"
///
/// Benefits:
/// - Lazy loading (controller created only when needed)
/// - Clean dependency management
/// - Easy to test
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // 🔥 Register AuthController
    // This will be created when user navigates to auth pages
    Get.lazyPut<AuthController>(() => AuthController());
    
    // You can also register other dependencies here
    // Get.lazyPut<AuthProvider>(() => AuthProvider());
  }
}