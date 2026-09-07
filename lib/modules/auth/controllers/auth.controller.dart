import 'package:flutter/material.dart';
import 'package:food2go/core/constants/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/auth.provider.dart';
import '../models/user.model.dart';
import '../../../routes/app_routes.dart';

/// AuthController - Manages authentication state and logic
///
/// WHY: Central place for all authentication logic
/// - Controls UI state (loading, logged in)
/// - Handles business logic (login, register)
/// - Connects UI with data layer
class AuthController extends GetxController {
  // ─────────────────────────────────────────────
  // 1. DEPENDENCIES
  // ─────────────────────────────────────────────
  
  // Our messenger to talk to the server
  final AuthProvider _authProvider = AuthProvider();
  
  // ─────────────────────────────────────────────
  // 2. OBSERVABLE STATE
  // ─────────────────────────────────────────────
  
  // .obs makes variables observable
  // UI will rebuild when these change
  
  var isLoading = false.obs;           // Show loading indicator
  var isLoggedIn = false.obs;          // User session status
  var currentUser = Rxn<User>();       // Current user (nullable)
  
  // ─────────────────────────────────────────────
  // 3. LOGIN FORM STATE
  // ─────────────────────────────────────────────
  
  var email = ''.obs;
  var password = ''.obs;
  var rememberMe = false.obs;
  
  // ─────────────────────────────────────────────
  // 4. REGISTER FORM STATE
  // ─────────────────────────────────────────────
  
  var regName = ''.obs;
  var regEmail = ''.obs;
  var regUsername = ''.obs;
  var regPassword = ''.obs;
  var regConfirmPassword = ''.obs;
  var regAge = Rxn<int>();
  var regCountry = ''.obs;
  
  // ─────────────────────────────────────────────
  // 5. LIFECYCLE METHODS
  // ─────────────────────────────────────────────
  
  @override
  void onInit() {
    super.onInit();
    // Check if user is already logged in when app starts
    _checkLoginStatus();
  }
  
  // ─────────────────────────────────────────────
  // 6. CHECK LOGIN STATUS
  // ─────────────────────────────────────────────
  
  /// Check if user is already logged in
  ///
  /// Why: Restore session when app starts
  /// If token exists, we go directly to home
  Future<void> _checkLoginStatus() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(AppConstants.keyToken);
      
      if (token != null && token.isNotEmpty) {
        // Get user data from storage
        final user = await _authProvider.getCurrentUser();
        if (user != null) {
          currentUser.value = user;
          isLoggedIn.value = true;
          // Navigate to home
          Get.offAllNamed(AppRoutes.home);
        }
      }
    } catch (e) {
      // If error, stay on login screen
      print('Error checking login status: $e');
    }
  }
  
  // ─────────────────────────────────────────────
  // 7. LOGIN METHOD
  // ─────────────────────────────────────────────
  
  /// Login user with email and password
  ///
  /// Why: Authenticate user and start session
  /// Steps:
  /// 1. Validate inputs
  /// 2. Show loading
  /// 3. Call API
  /// 4. Handle response
  /// 5. Navigate on success
  Future<void> login() async {
    // 1. Validate inputs
    if (email.value.isEmpty || password.value.isEmpty) {
      _showSnackbar('Error', 'Please fill all fields');
      return;
    }
    
    // 2. Show loading
    isLoading.value = true;
    
    try {
      // 3. Call API
      final result = await _authProvider.login(
        email: email.value,
        password: password.value,
      );
      
      // 4. Handle response
      if (result['success']) {
        // Update state
        currentUser.value = result['user'];
        isLoggedIn.value = true;
        
        // Show success
        _showSnackbar(
          'Success',
          'Welcome back, ${currentUser.value?.name}!',
          isSuccess: true,
        );
        
        // 5. Navigate to home
        Get.offAllNamed(AppRoutes.home);
      } else {
        // Show error
        _showSnackbar('Login Failed', result['message']);
      }
    } catch (e) {
      _showSnackbar('Error', 'An unexpected error occurred');
    } finally {
      // Always hide loading
      isLoading.value = false;
    }
  }
  
  // ─────────────────────────────────────────────
  // 8. REGISTER METHOD
  // ─────────────────────────────────────────────
  
  /// Register new user
  ///
  /// Why: Create new account
  /// Steps:
  /// 1. Validate inputs
  /// 2. Check password match
  /// 3. Show loading
  /// 4. Call API
  /// 5. Navigate on success
  Future<void> register() async {
    // 1. Validate inputs
    if (regName.value.isEmpty || 
        regEmail.value.isEmpty || 
        regUsername.value.isEmpty || 
        regPassword.value.isEmpty) {
      _showSnackbar('Error', 'Please fill all required fields');
      return;
    }
    
    // 2. Check password match
    if (regPassword.value != regConfirmPassword.value) {
      _showSnackbar('Error', 'Passwords do not match');
      return;
    }
    
    // 3. Show loading
    isLoading.value = true;
    
    try {
      // 4. Call API
      final result = await _authProvider.register(
        name: regName.value,
        email: regEmail.value,
        username: regUsername.value,
        password: regPassword.value,
        age: regAge.value,
        country: regCountry.value.isEmpty ? null : regCountry.value,
      );
      
      // 5. Handle response
      if (result['success']) {
        _showSnackbar(
          'Success',
          'Account created successfully! Please login.',
          isSuccess: true,
          duration: 3,
        );
        
        // Navigate to login
        Get.offAllNamed(AppRoutes.login);
      } else {
        _showSnackbar('Registration Failed', result['message']);
      }
    } catch (e) {
      _showSnackbar('Error', 'An unexpected error occurred');
    } finally {
      isLoading.value = false;
    }
  }
  
  // ─────────────────────────────────────────────
  // 9. LOGOUT METHOD
  // ─────────────────────────────────────────────
  
  /// Logout user
  ///
  /// Why: End session and clear data
  Future<void> logout() async {
    await _authProvider.logout();
    isLoggedIn.value = false;
    currentUser.value = null;
    Get.offAllNamed(AppRoutes.login);
    
    _showSnackbar('Goodbye!', 'You have been logged out', isSuccess: true);
  }
  
  // ─────────────────────────────────────────────
  // 10. UPDATE PROFILE
  // ─────────────────────────────────────────────
  
  /// Update user profile
  ///
  /// Why: Users can update their information
  Future<void> updateProfile(User updatedUser) async {
    // Update local state
    currentUser.value = updatedUser;
    
    // TODO: Call API to update on server
    // For now, just update local
    
    _showSnackbar('Success', 'Profile updated successfully', isSuccess: true);
  }
  
  // ─────────────────────────────────────────────
  // 11. HELPER METHODS
  // ─────────────────────────────────────────────
  
  /// Show snackbar message
  ///
  /// Why: User feedback for actions
  void _showSnackbar(
    String title,
    String message, {
    bool isSuccess = false,
    int duration = 2,
  }) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      icon: Icon(
        isSuccess ? Icons.check_circle : Icons.error,
        color: Colors.white,
      ),
    );
  }
}