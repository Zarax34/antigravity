import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import '../constants/app_constants.dart';
import '../../data/models/user.dart';
import '../../data/datasources/local/database.dart';

/// Service for handling authentication
class AuthService {
  final AppDatabase database;
  
  User? _currentUser;
  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;
  
  AuthService({required this.database});
  
  /// Login with username and password
  Future<User?> login(String username, String password) async {
    try {
      // Try to authenticate against local database first
      final user = await database.authenticateUser(username, password);
      
      if (user != null) {
        _currentUser = user;
        await _saveSession(user);
        debugPrint('Login successful: ${user.fullName}');
        return user;
      }
      
      debugPrint('Login failed: Invalid credentials');
      return null;
    } catch (e) {
      debugPrint('Login error: $e');
      return null;
    }
  }
  
  /// Login with username and password, validating against selected center
  /// Returns a tuple-like map with user and error message
  Future<Map<String, dynamic>> loginForCenter(String username, String password, String? centerId) async {
    try {
      // Try to authenticate against local database first
      final user = await database.authenticateUser(username, password);
      
      if (user == null) {
        return {'user': null, 'error': 'invalid_credentials'};
      }
      
      // SystemAdmin can login to any center
      if (user.role == UserRole.systemAdmin) {
        _currentUser = user;
        await _saveSession(user);
        debugPrint('SystemAdmin login successful: ${user.fullName}');
        return {'user': user, 'error': null};
      }
      
      // For other users, validate they belong to the selected center
      if (centerId != null && user.centerId != null && user.centerId != centerId) {
        debugPrint('Login failed: User ${user.fullName} belongs to different center');
        return {'user': null, 'error': 'wrong_center', 'userCenterId': user.centerId};
      }
      
      _currentUser = user;
      await _saveSession(user);
      debugPrint('Login successful: ${user.fullName}');
      return {'user': user, 'error': null};
    } catch (e) {
      debugPrint('Login error: $e');
      return {'user': null, 'error': 'unknown_error'};
    }
  }
  
  /// Logout current user
  Future<void> logout() async {
    _currentUser = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.userKey);
    await prefs.remove(AppConstants.tokenKey);
    debugPrint('Logged out successfully');
  }
  
  /// Check if user session exists
  Future<bool> checkSession() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString(AppConstants.userKey);
      
      if (userId != null) {
        final user = await database.getUserById(userId);
        if (user != null && !user.isBlocked) {
          _currentUser = user;
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint('Session check error: $e');
      return false;
    }
  }
  
  /// Save user session
  Future<void> _saveSession(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.userKey, user.id);
  }
  
  /// Create a new user account
  Future<User?> createUser({
    required String username,
    required String password,
    required String fullName,
    required UserRole role,
    String? email,
    String? phone,
    String? centerId,
    String? halqaId,
  }) async {
    try {
      const uuid = Uuid();
      final now = DateTime.now();
      
      final user = User(
        id: uuid.v4(),
        username: username,
        fullName: fullName,
        email: email,
        phone: phone,
        role: role,
        centerId: centerId,
        halqaId: halqaId,
        isActive: true,
        isBlocked: false,
        createdAt: now,
        updatedAt: now,
        syncStatus: SyncStatus.pending,
      );
      
      await database.insertUser(user, password);
      debugPrint('User created: ${user.fullName}');
      return user;
    } catch (e) {
      debugPrint('Create user error: $e');
      return null;
    }
  }
  
  /// Create parent account automatically
  Future<User?> createParentAccount({
    required String parentName,
    required String parentPhone,
    String? centerId,
  }) async {
    // Check if parent already exists
    final existingUser = await database.getUserByUsername(parentName);
    if (existingUser != null) {
      return existingUser;
    }
    
    return createUser(
      username: parentName,
      password: parentPhone, // Phone as password
      fullName: parentName,
      role: UserRole.parent,
      phone: parentPhone,
      centerId: centerId,
    );
  }
  
  /// Create student account automatically
  Future<User?> createStudentAccount({
    required String studentName,
    required String password, // Student phone or parent phone
    required String halqaId,
    String? centerId,
  }) async {
    return createUser(
      username: studentName,
      password: password,
      fullName: studentName,
      role: UserRole.student,
      halqaId: halqaId,
      centerId: centerId,
    );
  }
  
  /// Reset user password
  Future<bool> resetPassword(String userId, String newPassword) async {
    try {
      await database.updateUserPassword(userId, newPassword);
      debugPrint('Password reset for user: $userId');
      return true;
    } catch (e) {
      debugPrint('Password reset error: $e');
      return false;
    }
  }
  
  /// Block/unblock user
  Future<bool> setUserBlocked(String userId, bool blocked) async {
    try {
      await database.setUserBlocked(userId, blocked);
      debugPrint('User $userId blocked: $blocked');
      return true;
    } catch (e) {
      debugPrint('Block user error: $e');
      return false;
    }
  }
  
  /// Delete user
  Future<bool> deleteUser(String userId) async {
    try {
      await database.deleteUser(userId);
      debugPrint('User deleted: $userId');
      return true;
    } catch (e) {
      debugPrint('Delete user error: $e');
      return false;
    }
  }
  
  /// Check if current user has permission
  bool hasPermission(Permission permission) {
    return _currentUser?.hasPermission(permission) ?? false;
  }
}
