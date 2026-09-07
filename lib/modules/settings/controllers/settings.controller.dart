import 'package:get/get.dart';

/// SettingsController - Manages settings state
class SettingsController extends GetxController {
  var isDarkMode = false.obs;
  var areRemindersEnabled = true.obs;
  
  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
    // TODO: Apply theme change
  }
  
  void toggleReminders(bool value) {
    areRemindersEnabled.value = value;
    // TODO: Enable/disable reminders
  }
}