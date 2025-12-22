import 'package:flutter/material.dart';
import '../../data/models/user.dart';
import '../../data/datasources/local/database.dart';
import '../../core/constants/app_constants.dart';

class UserProvider extends ChangeNotifier {
  final AppDatabase _database;
  
  List<User> _users = [];
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';
  String? _roleFilter;
  String? _currentUserCenterId;
  UserRole? _currentUserRole;

  UserProvider({required AppDatabase database}) : _database = database {
    loadUsers();
  }
  
  /// تعيين معلومات المستخدم الحالي لفلترة البيانات
  void setCurrentUserInfo(String? centerId, UserRole? role) {
    _currentUserCenterId = centerId;
    _currentUserRole = role;
    notifyListeners();
  }

  List<User> get users {
    var filtered = _users;
    
    // إخفاء مسؤول النظام عن مسؤولي المراكز
    if (_currentUserRole == UserRole.centerManager) {
      filtered = filtered.where((u) => u.role != UserRole.systemAdmin).toList();
    }
    
    // فلترة حسب المركز (لغير مسؤولي النظام)
    if (_currentUserRole != UserRole.systemAdmin && _currentUserCenterId != null) {
      filtered = filtered.where((u) => 
        u.centerId == _currentUserCenterId || u.centerId == null
      ).toList();
    }
    
    // Apply role filter
    if (_roleFilter != null && _roleFilter != 'all') {
      filtered = filtered.where((u) {
        switch (_roleFilter) {
          case 'مسؤولين':
            return u.role == UserRole.systemAdmin || u.role == UserRole.centerManager;
          case 'معلمين':
            return u.role == UserRole.teacher;
          case 'أولياء أمور':
            return u.role == UserRole.parent;
          case 'طلاب':
            return u.role == UserRole.student;
          default:
            return true;
        }
      }).toList();
    }
    
    // Apply search
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filtered = filtered.where((u) =>
        u.fullName.toLowerCase().contains(query) ||
        (u.email?.toLowerCase().contains(query) ?? false) ||
        (u.phone?.contains(query) ?? false)
      ).toList();
    }
    
    return filtered;
  }
  
  List<User> get allUsers => _users;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
  
  void setRoleFilter(String? role) {
    _roleFilter = role;
    notifyListeners();
  }
  
  Future<void> loadUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      _users = await _database.getAllUsers();
      notifyListeners();
    } catch (e) {
      _error = 'فشل في تحميل المستخدمين';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addUser({
    required String username,
    required String fullName,
    required String email,
    required String phone,
    required UserRole role,
    String? centerId,
    String? profileImage,
    String? password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      // Check if username exists
      final existing = await _database.getUserByUsername(username);
      if (existing != null) {
        _error = 'اسم المستخدم موجود مسبقاً';
        return false;
      }
      
      final user = User(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        username: username,
        fullName: fullName,
        email: email.isEmpty ? null : email,
        phone: phone.isEmpty ? null : phone,
        role: role,
        centerId: centerId,
        profileImage: profileImage,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        syncStatus: SyncStatus.pending,
      );
      
      await _database.insertUser(user, password ?? phone);
      await loadUsers();
      return true;
    } catch (e) {
      _error = 'فشل في إضافة المستخدم';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> toggleUserStatus(String id) async {
    final index = _users.indexWhere((u) => u.id == id);
    if (index == -1) return false;
    
    try {
      final user = _users[index];
      await _database.setUserBlocked(id, user.isActive);
      await loadUsers();
      return true;
    } catch (e) {
      _error = 'فشل في تحديث حالة المستخدم';
      return false;
    }
  }

  Future<bool> deleteUser(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      await _database.deleteUser(id);
      await loadUsers();
      return true;
    } catch (e) {
      _error = 'فشل في حذف المستخدم';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  User? getUserById(String id) {
    try {
      return _users.firstWhere((u) => u.id == id);
    } catch (_) {
      return null;
    }
  }
  
  List<User> getManagersList() {
    return _users.where((u) => 
      u.role == UserRole.centerManager && u.isActive
    ).toList();
  }
}
