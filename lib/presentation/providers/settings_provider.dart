import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  String _copyrightText = 'جميع الحقوق محفوظة © 2024';
  String _developerLink = '';
  bool _hideParentPhone = false;
  int _maxStudentsPerHalqa = 30;
  bool _biometricLoginEnabled = false;
  bool _allowTeacherActivityRequests = true;
  bool _allowTeacherReports = true;
  
  ThemeMode get themeMode => _themeMode;
  String get copyrightText => _copyrightText;
  String get developerLink => _developerLink;
  bool get hideParentPhone => _hideParentPhone;
  int get maxStudentsPerHalqa => _maxStudentsPerHalqa;
  bool get biometricLoginEnabled => _biometricLoginEnabled;
  bool get allowTeacherActivityRequests => _allowTeacherActivityRequests;
  bool get allowTeacherReports => _allowTeacherReports;
  
  SettingsProvider() {
    _loadSettings();
  }
  
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    
    final themeModeIndex = prefs.getInt('theme_mode') ?? 0;
    _themeMode = ThemeMode.values[themeModeIndex];
    
    _copyrightText = prefs.getString('copyright_text') ?? _copyrightText;
    _developerLink = prefs.getString('developer_link') ?? _developerLink;
    _hideParentPhone = prefs.getBool('hide_parent_phone') ?? false;
    _maxStudentsPerHalqa = prefs.getInt('max_students_per_halqa') ?? 30;
    _biometricLoginEnabled = prefs.getBool('biometric_login_enabled') ?? false;
    _allowTeacherActivityRequests = prefs.getBool('allow_teacher_activity_requests') ?? true;
    _allowTeacherReports = prefs.getBool('allow_teacher_reports') ?? true;
    
    notifyListeners();
  }
  
  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme_mode', mode.index);
    notifyListeners();
  }
  
  Future<void> setCopyrightText(String text) async {
    _copyrightText = text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('copyright_text', text);
    notifyListeners();
  }
  
  Future<void> setDeveloperLink(String link) async {
    _developerLink = link;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('developer_link', link);
    notifyListeners();
  }
  
  Future<void> setHideParentPhone(bool hide) async {
    _hideParentPhone = hide;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hide_parent_phone', hide);
    notifyListeners();
  }
  
  Future<void> setMaxStudentsPerHalqa(int max) async {
    _maxStudentsPerHalqa = max;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('max_students_per_halqa', max);
    notifyListeners();
  }
  
  Future<void> setBiometricLoginEnabled(bool enabled) async {
    _biometricLoginEnabled = enabled;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometric_login_enabled', enabled);
    notifyListeners();
  }
  
  Future<void> setAllowTeacherActivityRequests(bool allow) async {
    _allowTeacherActivityRequests = allow;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('allow_teacher_activity_requests', allow);
    notifyListeners();
  }
  
  Future<void> setAllowTeacherReports(bool allow) async {
    _allowTeacherReports = allow;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('allow_teacher_reports', allow);
    notifyListeners();
  }
}
