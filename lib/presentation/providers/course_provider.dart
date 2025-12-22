import 'package:flutter/material.dart';
import '../../data/models/course.dart';
import '../../data/datasources/local/database.dart';
import '../../core/constants/app_constants.dart';

class CourseProvider extends ChangeNotifier {
  final AppDatabase _database;
  
  List<Course> _courses = [];
  bool _isLoading = false;
  String? _error;
  String? _statusFilter;

  CourseProvider({required AppDatabase database}) : _database = database {
    loadCourses();
  }

  List<Course> get courses {
    if (_statusFilter == null || _statusFilter == 'all') {
      return _courses;
    }
    
    final now = DateTime.now();
    switch (_statusFilter) {
      case 'نشطة':
        return _courses.where((c) => c.isActive && now.isBefore(c.endDate) && now.isAfter(c.startDate)).toList();
      case 'منتهية':
        return _courses.where((c) => c.hasEnded).toList();
      case 'مجدولة':
        return _courses.where((c) => now.isBefore(c.startDate)).toList();
      default:
        return _courses;
    }
  }
  
  List<Course> get allCourses => _courses;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  int get activeCourses => _courses.where((c) => c.isOngoing).length;
  int get totalStudents => _courses.fold(0, (sum, c) => sum + c.targetStudentIds.length);
  
  void setStatusFilter(String? status) {
    _statusFilter = status;
    notifyListeners();
  }
  
  Future<void> loadCourses() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      _courses = await _database.getAllCourses();
      notifyListeners();
    } catch (e) {
      _error = 'فشل في تحميل الدورات';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addCourse({
    required String name,
    String? description,
    String? centerId,
    String? teacherId,
    required DateTime startDate,
    required DateTime endDate,
    String? location,
    String? targetAudience,
    double? fees,
    String? notes,
    String? imageUrl,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final course = Course(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        description: description ?? '',
        centerId: centerId ?? '',
        responsibleTeacherId: teacherId,
        startDate: startDate,
        endDate: endDate,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        syncStatus: SyncStatus.pending,
      );
      
      await _database.insertCourse(course);
      await loadCourses();
      return true;
    } catch (e) {
      _error = 'فشل في إضافة الدورة';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> deleteCourse(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      await _database.deleteCourse(id);
      await loadCourses();
      return true;
    } catch (e) {
      _error = 'فشل في حذف الدورة';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Helper to get teacher name - in real app would fetch from UserProvider
  String getTeacherName(String? teacherId) {
    return teacherId ?? 'غير محدد';
  }
}
