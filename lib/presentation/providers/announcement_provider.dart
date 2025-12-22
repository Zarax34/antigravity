import 'package:flutter/material.dart';
import '../../data/models/announcement.dart';
import '../../data/datasources/local/database.dart';
import '../../core/constants/app_constants.dart';

class AnnouncementProvider extends ChangeNotifier {
  final AppDatabase _database;
  
  List<Announcement> _announcements = [];
  bool _isLoading = false;
  String? _error;
  String? _statusFilter;

  AnnouncementProvider({required AppDatabase database}) : _database = database {
    loadAnnouncements();
  }

  List<Announcement> get announcements {
    if (_statusFilter == null || _statusFilter == 'all') {
      return _announcements;
    }
    
    if (_statusFilter == 'منشورة') {
      return _announcements.where((a) => a.isActive).toList();
    } else {
      return _announcements.where((a) => !a.isActive).toList();
    }
  }
  
  List<Announcement> get allAnnouncements => _announcements;
  List<Announcement> get publishedAnnouncements => _announcements.where((a) => a.isActive).toList();
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  int get publishedCount => _announcements.where((a) => a.isActive).length;
  int get draftsCount => _announcements.where((a) => !a.isActive).length;
  
  void setStatusFilter(String? status) {
    _statusFilter = status;
    notifyListeners();
  }
  
  Future<void> loadAnnouncements() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      _announcements = await _database.getAllAnnouncements();
      notifyListeners();
    } catch (e) {
      _error = 'فشل في تحميل الإعلانات';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> addAnnouncement({
    required String title,
    required String content,
    required String centerId,
    required String createdBy,
    bool publish = false,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      // Validate center status
      final center = await _database.getCenterById(centerId);
      if (center != null && !center.isActive) {
        _error = 'عذراً، المركز غير نشط ولا يمكن نشر تحديثات جديدة';
        return false;
      }

      final announcement = Announcement(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        content: content,
        centerId: centerId,
        createdBy: createdBy,
        scope: AnnouncementScope.all,
        isActive: publish,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        syncStatus: SyncStatus.pending,
      );
      
      await _database.insertAnnouncement(announcement);
      await loadAnnouncements();
      return true;
    } catch (e) {
      _error = 'فشل في إضافة الإعلان';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> togglePublish(String id) async {
    final index = _announcements.indexWhere((a) => a.id == id);
    if (index == -1) return false;
    
    final old = _announcements[index];
    final updated = old.copyWith(
      isActive: !old.isActive,
      updatedAt: DateTime.now(),
      syncStatus: SyncStatus.pending,
    );
    
    try {
      await _database.updateAnnouncement(updated);
      await loadAnnouncements();
      return true;
    } catch (e) {
      _error = 'فشل في تحديث الإعلان';
      return false;
    }
  }

  Future<bool> deleteAnnouncement(String id) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      await _database.deleteAnnouncement(id);
      await loadAnnouncements();
      return true;
    } catch (e) {
      _error = 'فشل في حذف الإعلان';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Helper to get scope name
  String getScopeName(AnnouncementScope scope) {
    return scope.arabicName;
  }
}
