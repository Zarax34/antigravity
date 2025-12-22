import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/report.dart';
import '../../data/datasources/local/database.dart';
import '../../core/constants/app_constants.dart';
import 'auth_provider.dart';

class ReportProvider extends ChangeNotifier {
  final AppDatabase _database;
  AuthProvider? _authProvider;
  
  List<DailyReport> _reports = [];
  bool _isLoading = false;
  String? _error;
  
  ReportProvider({required AppDatabase database}) : _database = database;
  
  List<DailyReport> get reports => _reports;
  bool get isLoading => _isLoading;
  String? get error => _error;
  
  void updateAuth(AuthProvider auth) {
    _authProvider = auth;
    loadReports();
  }
  
  /// Load reports
  Future<void> loadReports() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      // Load reports logic here (placeholder as we focused on create logic for deactivation)
      // For now we keep it empty or load usage if available
      _reports = []; // TODO: implement full load logic
    } catch (e) {
      _error = 'فشل في تحميل التقارير';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Create a new daily report
  Future<bool> createReport({
    required String halqaId,
    required DateTime date,
    required List<StudentReport> studentReports,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final centerId = _authProvider?.currentUser?.centerId;
      if (centerId == null) {
        _error = 'خطأ: المركز غير محدد';
        return false;
      }

      // Check center activation
      final center = await _database.getCenterById(centerId);
      if (center != null && !center.isActive) {
        _error = 'عذراً، المركز غير نشط ولا يمكن إرسال تقارير';
        return false;
      }

      const uuid = Uuid();
      final now = DateTime.now();
      final teacherId = _authProvider?.currentUser?.id ?? '';
      
      final report = DailyReport(
        id: uuid.v4(),
        halqaId: halqaId,
        teacherId: teacherId,
        date: date,
        studentReports: studentReports,
        status: ReportStatus.pending,
        createdAt: now,
        updatedAt: now,
        syncStatus: SyncStatus.pending,
      );
      
      // TODO: Save to database proper
      // await _database.insertReport(report); 
      // For now we simulate success but validation is the key request
      
      _reports.insert(0, report);
      notifyListeners();
      return true;
    } catch (e) {
      _error = 'فشل في إنشاء التقرير';
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  /// Get recent reports
  List<DailyReport> getRecentReports({int limit = 10}) {
    return _reports.take(limit).toList();
  }
}

