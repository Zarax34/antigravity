import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/student.dart';
import '../../data/datasources/local/database.dart';
import '../../core/constants/app_constants.dart';
import 'auth_provider.dart';

class StudentProvider extends ChangeNotifier {
  AppDatabase? _database;
  AuthProvider? _authProvider;
  
  List<Student> _students = [];
  bool _isLoading = false;
  String? _error;
  String? _selectedHalqaId;
  String _searchQuery = '';
  
  StudentProvider();
  
  void setDatabase(AppDatabase db) {
    _database = db;
    loadStudents();
  }
  
  List<Student> get students {
    var filtered = _selectedHalqaId != null
        ? _students.where((s) => s.halqaId == _selectedHalqaId).toList()
        : _students;
    
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filtered = filtered.where((s) =>
        s.fullName.toLowerCase().contains(query) ||
        s.parentName.toLowerCase().contains(query) ||
        (s.phone?.contains(query) ?? false)
      ).toList();
    }
    
    return filtered;
  }
  
  List<Student> get allStudents => _students;
  List<Student> get activeStudents => _students.where((s) => s.isActive).toList();
  bool get isLoading => _isLoading;
  String? get error => _error;
  int get totalCount => _students.length;
  
  void updateAuth(AuthProvider auth) {
    _authProvider = auth;
    loadStudents();
  }
  
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
  
  /// Set halqa filter
  void setHalqaFilter(String? halqaId) {
    _selectedHalqaId = halqaId;
    notifyListeners();
  }
  
  /// Load all students
  Future<void> loadStudents() async {
    if (_database == null) return;
    
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final centerId = _authProvider?.currentUser?.centerId;
      _students = await _database!.getStudents(centerId: centerId);
      notifyListeners();
    } catch (e) {
      _error = 'فشل في تحميل الطلاب';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Add new student
  /// Returns false and sets error if halqa is at max capacity
  Future<bool> addStudent({
    required String fullName,
    required String halqaId,
    required String parentName,
    required String parentPhone,
    String? parentJob,
    String? currentResidence,
    String? previousResidence,
    String? governorate,
    int? age,
    DateTime? birthDate,
    String? phone,
    String? previousMemorization,
    String? notes,
    String? profileImage,
    int? maxStudentsInHalqa, // Pass halqa's max limit for validation
  }) async {
    if (_database == null) {
      _error = 'قاعدة البيانات غير متاحة';
      return false;
    }
    
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      // Check halqa capacity if maxStudentsInHalqa is provided
      if (maxStudentsInHalqa != null) {
        final currentCount = getStudentsCountByHalqa(halqaId);
        if (currentCount >= maxStudentsInHalqa) {
          _error = 'الحلقة ممتلئة (${currentCount}/${maxStudentsInHalqa} طالب)';
          _isLoading = false;
          notifyListeners();
          return false;
        }
      }
      
      const uuid = Uuid();
      final now = DateTime.now();
      final centerId = _authProvider?.currentUser?.centerId ?? 'center1';
      
      final student = Student(
        id: uuid.v4(),
        fullName: fullName,
        halqaId: halqaId,
        centerId: centerId,
        parentName: parentName,
        parentPhone: parentPhone,
        parentJob: parentJob,
        currentResidence: currentResidence,
        previousResidence: previousResidence,
        governorate: governorate,
        age: age,
        birthDate: birthDate,
        enrollmentDate: now,
        phone: phone,
        profileImage: profileImage,
        previousMemorization: previousMemorization,
        notes: notes,
        createdAt: now,
        updatedAt: now,
        syncStatus: SyncStatus.pending,
      );
      
      await _database!.insertStudent(student);
      await loadStudents();
      return true;
    } catch (e) {
      _error = 'فشل في إضافة الطالب: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Delete student
  Future<bool> deleteStudent(String id) async {
    if (_database == null) return false;
    
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      await _database!.deleteStudent(id);
      await loadStudents();
      return true;
    } catch (e) {
      _error = 'فشل في حذف الطالب';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Get student by ID
  Student? getStudentById(String id) {
    try {
      return _students.firstWhere((s) => s.id == id);
    } catch (_) {
      return null;
    }
  }
  
  /// Get students by halqa
  List<Student> getStudentsByHalqa(String halqaId) {
    return _students.where((s) => s.halqaId == halqaId).toList();
  }
  
  /// Get students count by halqa
  int getStudentsCountByHalqa(String halqaId) {
    return _students.where((s) => s.halqaId == halqaId).length;
  }
  
  /// Search students by query
  List<Student> searchStudents(String query) {
    if (query.isEmpty) return students;
    
    final lowerQuery = query.toLowerCase();
    return _students.where((s) =>
      s.fullName.toLowerCase().contains(lowerQuery) ||
      s.parentName.toLowerCase().contains(lowerQuery) ||
      (s.phone?.contains(lowerQuery) ?? false) ||
      (s.parentPhone.contains(lowerQuery))
    ).toList();
  }
}
