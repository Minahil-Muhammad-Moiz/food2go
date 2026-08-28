/// AppStrings - All text strings in one place
///
/// WHY: Text changes often during development. Having all strings here:
/// - Easy to update text
/// - Supports multi-language later
/// - Avoids hardcoded text in widgets
class AppStrings {
  AppStrings._();
  // App Metadata
  static const String appName = 'Food2Go';
  static const String appSubtitle = 'Track your food, eat healthy!';

  // Auth Screens
  static const String loginTitle = 'Welcome Back!';
  static const String loginSubtitle =
      'Login to continue tracking your food intake';
  static const String registerTitle = 'Let\'s Get Started!';
  static const String registerSubtitle =
      'Create your account to track your food intake';

  // Form Labels
  static const String email = 'Email';
  static const String password = 'Password';
  static const String confirmPassword = 'Confirm Password';
  static const String fullName = 'Full Name';
  static const String username = 'Username';
  static const String age = 'Age';
  static const String country = 'Country';

  // Buttons
  static const String login = 'Login';
  static const String register = 'Create Account';
  static const String logout = 'Logout';
  static const String save = 'Save Changes';
  static const String cancel = 'Cancel';

  // Food Related
  static const String addFood = 'Add Food';
  static const String foodName = 'Food Name';
  static const String calories = 'Calories';
  static const String protein = 'Protein (g)';
  static const String carbs = 'Carbs (g)';
  static const String fat = 'Fat (g)';
  static const String mealType = 'Meal Type';
  static const String portionSize = 'Portion Size';

  // Validation Messages
  static const String emailRequired = 'Email is required';
  static const String emailInvalid = 'Enter a valid email address';
  static const String passwordRequired = 'Password is required';
  static const String passwordMinLength =
      'Password must be at least 6 characters';
  static const String nameRequired = 'Name is required';
  static const String usernameRequired = 'Username is required';
}
