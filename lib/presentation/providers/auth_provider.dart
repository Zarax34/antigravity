import 'package:flutter/material.dart';
import '../../core/services/auth_service.dart';
import '../../data/models/user.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;
  
  bool _isLoading = false;
  String? _error;
  
  AuthProvider({required AuthService authService}) : _authService = authService;
  
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _authService.isAuthenticated;
  User? get currentUser => _authService.currentUser;
  
  /// Check if user session exists
  Future<bool> checkSession() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      final hasSession = await _authService.checkSession();
      return hasSession;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Login with username and password
  Future<bool> login(String username, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final user = await _authService.login(username, password);
      if (user != null) {
        return true;
      }
      _error = 'اسم المستخدم أو كلمة المرور غير صحيحة';
      return false;
    } catch (e) {
      _error = 'حدث خطأ أثناء تسجيل الدخول';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Login with username and password, validating against selected center
  /// Returns a result map with success status and error type
  Future<Map<String, dynamic>> loginForCenter(String username, String password, String? centerId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final result = await _authService.loginForCenter(username, password, centerId);
      final user = result['user'];
      final error = result['error'];
      
      if (user != null) {
        return {'success': true, 'error': null};
      }
      
      // Handle different error types
      if (error == 'invalid_credentials') {
        _error = 'اسم المستخدم أو كلمة المرور غير صحيحة';
        return {'success': false, 'error': 'invalid_credentials'};
      } else if (error == 'wrong_center') {
        _error = 'هذا المستخدم مسجل في مركز آخر';
        return {'success': false, 'error': 'wrong_center', 'userCenterId': result['userCenterId']};
      }
      
      _error = 'حدث خطأ غير معروف';
      return {'success': false, 'error': 'unknown'};
    } catch (e) {
      _error = 'حدث خطأ أثناء تسجيل الدخول';
      return {'success': false, 'error': 'exception'};
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Logout
  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      await _authService.logout();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Check if user has permission
  bool hasPermission(Permission permission) {
    return _authService.hasPermission(permission);
  }
  
  /// Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
