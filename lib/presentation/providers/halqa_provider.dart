import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/halqa.dart';
import '../../data/datasources/local/database.dart';
import '../../core/constants/app_constants.dart';
import 'auth_provider.dart';

class HalqaProvider extends ChangeNotifier {
  final AppDatabase _database;
  AuthProvider? _authProvider;
  
  List<Halqa> _halqat = [];
  bool _isLoading = false;
  String? _error;
  
  HalqaProvider({required AppDatabase database}) : _database = database;
  
  List<Halqa> get halqat => _halqat;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  void updateAuth(AuthProvider auth) {
    _authProvider = auth;
    loadHalqat();
  }
  
  /// Load all halqat
  Future<void> loadHalqat() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final centerId = _authProvider?.currentUser?.centerId;
      _halqat = await _database.getHalqat(centerId: centerId);
    } catch (e) {
      _error = 'فشل في تحميل الحلقات';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Add new halqa
  Future<bool> addHalqa({
    required String name,
    required HalqaCategory category,
    String? teacherId,
    String? teacherName,
    String? description,
    int maxStudents = 30,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      const uuid = Uuid();
      final now = DateTime.now();
      final centerId = _authProvider?.currentUser?.centerId ?? '';
      
      final halqa = Halqa(
        id: uuid.v4(),
        name: name,
        centerId: centerId,
        teacherId: teacherId,
        teacherName: teacherName,
        category: category,
        maxStudents: maxStudents,
        description: description,
        createdAt: now,
        updatedAt: now,
        syncStatus: SyncStatus.pending,
      );
      
      await _database.insertHalqa(halqa);
      _halqat.add(halqa);
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'فشل في إضافة الحلقة';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Get halqa by ID
  Halqa? getHalqaById(String id) {
    try {
      return _halqat.firstWhere((h) => h.id == id);
    } catch (_) {
      return null;
    }
  }
  
  /// Update halqa
  Future<bool> updateHalqa({
    required String id,
    required String name,
    required HalqaCategory category,
    String? teacherId,
    String? teacherName,
    String? description,
    int? maxStudents,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final index = _halqat.indexWhere((h) => h.id == id);
      if (index == -1) {
        _error = 'الحلقة غير موجودة';
        return false;
      }
      
      final oldHalqa = _halqat[index];
      final updatedHalqa = Halqa(
        id: id,
        name: name,
        centerId: oldHalqa.centerId,
        teacherId: teacherId ?? oldHalqa.teacherId,
        teacherName: teacherName ?? oldHalqa.teacherName,
        category: category,
        maxStudents: maxStudents ?? oldHalqa.maxStudents,
        description: description,
        createdAt: oldHalqa.createdAt,
        updatedAt: DateTime.now(),
        syncStatus: SyncStatus.pending,
      );
      
      await _database.updateHalqa(updatedHalqa);
      _halqat[index] = updatedHalqa;
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'فشل في تعديل الحلقة: $e';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Delete halqa  
  Future<bool> deleteHalqa(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      await _database.deleteHalqa(id);
      _halqat.removeWhere((h) => h.id == id);
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'فشل في حذف الحلقة';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
