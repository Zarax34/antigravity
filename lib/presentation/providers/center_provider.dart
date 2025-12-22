import 'package:flutter/material.dart';
import '../../data/models/center.dart' as models;
import '../../data/datasources/local/database.dart';
import '../../core/constants/app_constants.dart';

class CenterProvider extends ChangeNotifier {
  final AppDatabase _database;
  
  List<models.Center> _centers = [];
  models.Center? _selectedCenter;
  bool _isLoading = false;
  String? _error;
  String _searchQuery = '';

  CenterProvider({required AppDatabase database}) : _database = database {
    loadCenters();
  }

  models.Center? get selectedCenter => _selectedCenter;
  
  void setSelectedCenter(models.Center center) {
    _selectedCenter = center;
    notifyListeners();
  }
  
  void clearSelectedCenter() {
    _selectedCenter = null;
    notifyListeners();
  }

  List<models.Center> get centers {
    var filtered = _centers;
    
    // Apply search
    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      filtered = filtered.where((c) =>
        c.name.toLowerCase().contains(query) ||
        (c.address?.toLowerCase().contains(query) ?? false)
      ).toList();
    }
    
    return filtered;
  }
  
  List<models.Center> get allCenters => _centers;
  List<models.Center> get activeCenters => _centers.where((c) => c.isActive).toList();
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  int get activeCentersCount => _centers.where((c) => c.isActive).length;
  
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
  
  Future<void> loadCenters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      _centers = await _database.getAllCenters();
      notifyListeners();
    } catch (e) {
      _error = 'فشل في تحميل المراكز';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addCenter({
    required String name,
    required String address,
    required String city,
    String? phone,
    String? email,
    String? managerId,
    String? logoUrl,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final center = models.Center(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        description: 'مركز في $city',
        address: address,
        phone: phone,
        email: email,
        managerId: managerId,
        logo: logoUrl,
        isActive: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        syncStatus: SyncStatus.pending,
      );
      
      await _database.insertCenter(center);
      await loadCenters();
      return true;
    } catch (e) {
      _error = 'فشل في إضافة المركز';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> toggleCenterStatus(String id) async {
    final index = _centers.indexWhere((c) => c.id == id);
    if (index == -1) return false;
    
    final old = _centers[index];
    final updated = old.copyWith(
      isActive: !old.isActive,
      updatedAt: DateTime.now(),
      syncStatus: SyncStatus.pending,
    );
    
    try {
      await _database.updateCenter(updated);
      await loadCenters();
      return true;
    } catch (e) {
      _error = 'فشل في تحديث حالة المركز';
      return false;
    }
  }

  Future<bool> deleteCenter(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      await _database.deleteCenter(id);
      await loadCenters();
      return true;
    } catch (e) {
      _error = 'فشل في حذف المركز';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  models.Center? getCenterById(String id) {
    try {
      return _centers.firstWhere((c) => c.id == id);
    } catch (_) {
      return null;
    }
  }
}
