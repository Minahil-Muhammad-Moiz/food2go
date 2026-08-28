/// AppConstants - Configuration values for the app
///
/// WHY: Environment-specific values change between development and production.
/// Having them here makes deployment easy.
class AppConstants {
  AppConstants._();
  // API Configuration
  // WHY: In development, use localhost; in production, use your server
  static const String apiBaseUrl = 'http://localhost:3000/api'; // Development
  // static const String apiBaseUrl = 'https://api.food2go.com/api'; // Production

  // Timeouts
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Storage Keys
  // WHY: Consistency when saving/retrieving from local storage
  static const String keyToken = 'auth_token';
  static const String keyUser = 'user_data';
  static const String keyRememberMe = 'remember_me';
  static const String keyThemeMode = 'theme_mode';
  static const String keyOnboardingComplete = 'onboarding_complete';

  // Pagination
  static const int itemsPerPage = 20;
  static const int maxRecentItems = 10;

  // Daily Nutrition Goals
  // WHY: These are the recommended daily values
  static const Map<String, double> dailyGoals = {
    'calories': 2000,
    'protein': 50,
    'carbs': 250,
    'fat': 70,
  };

  // Meal Types
  static const List<String> mealTypes = [
    'Breakfast',
    'Lunch',
    'Dinner',
    'Snack',
  ];
}
