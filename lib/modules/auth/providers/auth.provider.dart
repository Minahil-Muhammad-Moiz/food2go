import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.model.dart';
import '../../../core/constants/app_constants.dart';

/// AuthProvider - Handles all authentication API calls
///
/// WHY: Separates API logic from UI
/// - Easier to test
/// - Single source of truth for auth operations
/// - Can change API without affecting UI
class AuthProvider {
  // Dio is our HTTP Client
  // Think of it as a messenger that talks to the server
  final Dio _dio = Dio();
  
  // Constructor - Set up our messenger
  AuthProvider() {
    // Set base URL (where to send messages)
    _dio.options.baseUrl = AppConstants.apiBaseUrl;
    
    // Timeout settings (how long to wait)
    _dio.options.connectTimeout = AppConstants.connectionTimeout;
    _dio.options.receiveTimeout = AppConstants.receiveTimeout;
    
    // Headers (information about our message)
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }
  
  // ─────────────────────────────────────────────
  // 1. REGISTER
  // ─────────────────────────────────────────────
  
  /// Register new user
  ///
  /// Why: Creates a new account
  /// Returns: Success or error message
  Future<Map<String, dynamic>> register({
    required String name,
    required String email,
    required String username,
    required String password,
    int? age,
    String? country,
  }) async {
    try {
      // 📤 SEND: POST request to /auth/register
      final response = await _dio.post(
        '/auth/register',
        data: {
          'name': name,
          'email': email,
          'username': username,
          'password': password,
          'age': age,
          'country': country,
        },
      );
      
      // 📥 RECEIVE: Check if successful
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {
          'success': true,
          'data': response.data,
        };
      } else {
        return {
          'success': false,
          'message': response.data['message'] ?? 'Registration failed',
        };
      }
    } on DioException catch (e) {
      // ❌ ERROR: Something went wrong with the request
      return {
        'success': false,
        'message': _handleDioError(e),
      };
    } catch (e) {
      // ❌ ERROR: Something else went wrong
      return {
        'success': false,
        'message': 'An unexpected error occurred',
      };
    }
  }
  
  // ─────────────────────────────────────────────
  // 2. LOGIN
  // ─────────────────────────────────────────────
  
  /// Login user
  ///
  /// Why: Authenticates user and returns token
  /// Returns: Success with token and user, or error
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      // 📤 SEND: POST request to /auth/login
      final response = await _dio.post(
        '/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      
      // 📥 RECEIVE: Check if successful
      if (response.statusCode == 200) {
        // Extract data from response
        final token = response.data['token'];
        final userData = response.data['user'];
        
        // 💾 SAVE: Store token and user locally
        await _saveAuthData(token, userData);
        
        return {
          'success': true,
          'token': token,
          'user': User.fromJson(userData),
        };
      } else {
        return {
          'success': false,
          'message': response.data['message'] ?? 'Login failed',
        };
      }
    } on DioException catch (e) {
      return {
        'success': false,
        'message': _handleDioError(e),
      };
    } catch (e) {
      return {
        'success': false,
        'message': 'An unexpected error occurred',
      };
    }
  }
  
  // ─────────────────────────────────────────────
  // 3. LOGOUT
  // ─────────────────────────────────────────────
  
  /// Logout user
  ///
  /// Why: Clear local storage and end session
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.keyToken);
    await prefs.remove(AppConstants.keyUser);
  }
  
  // ─────────────────────────────────────────────
  // 4. STORAGE HELPERS
  // ─────────────────────────────────────────────
  
  /// Save auth data locally
  ///
  /// Why: We need to remember the user between app restarts
  Future<void> _saveAuthData(String token, dynamic userData) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.keyToken, token);
    await prefs.setString(AppConstants.keyUser, jsonEncode(userData));
  }
  
  /// Get current user from storage
  ///
  /// Why: Restore user session when app starts
  Future<User?> getCurrentUser() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString(AppConstants.keyUser);
      if (userJson != null) {
        final userData = jsonDecode(userJson);
        return User.fromJson(userData);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
  
  /// Get auth token from storage
  ///
  /// Why: Need token for authenticated API calls
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.keyToken);
  }
  
  /// Check if user is logged in
  ///
  /// Why: Determine if we should show login or home
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
  
  // ─────────────────────────────────────────────
  // 5. ERROR HANDLING
  // ─────────────────────────────────────────────
  
  /// Handle Dio errors with user-friendly messages
  ///
  /// Why: Technical errors confuse users
  /// We convert them to understandable messages
  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return 'Connection timeout. Please check your internet.';
        
      case DioExceptionType.badResponse:
        // Server responded with an error
        if (e.response != null) {
          // Try to get the error message from server
          final data = e.response?.data;
          if (data is Map && data.containsKey('message')) {
            return data['message'];
          }
          return 'Server error. Please try again.';
        }
        return 'Server error. Please try again.';
        
      case DioExceptionType.connectionError:
        return 'No internet connection.';
        
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}