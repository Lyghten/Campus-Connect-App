import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // ... existing code ...

  // Register with SharedPreferences
  static Future<bool> registerUser(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Check if email exists
    if (prefs.containsKey('user_$email')) {
      return false;
    }
    
    // Save user data
    await prefs.setString('user_$email', '$name,$password');
    return true;
  }

  // Validate login with SharedPreferences
  static Future<bool> validateLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_$email');
    
    if (userData == null) return false;
    
    final parts = userData.split(',');
    if (parts.length != 2) return false;
    
    return parts[1] == password;
  }

  // Get user name with SharedPreferences
  static Future<String?> getUserName(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_$email');
    
    if (userData == null) return null;
    
    final parts = userData.split(',');
    if (parts.length != 2) return null;
    
    return parts[0];
  }
}