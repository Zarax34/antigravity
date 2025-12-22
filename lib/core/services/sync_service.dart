import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import 'connectivity_service.dart';
import '../../data/datasources/local/database.dart';

/// Service for syncing local data with remote server
class SyncService {
  final AppDatabase database;
  final ConnectivityService connectivity;
  
  Timer? _syncTimer;
  bool _isSyncing = false;
  
  final _syncStatusController = StreamController<SyncStatus>.broadcast();
  Stream<SyncStatus> get onSyncStatusChanged => _syncStatusController.stream;
  
  SyncService({
    required this.database,
    required this.connectivity,
  }) {
    _init();
  }
  
  void _init() {
    // Listen to connectivity changes
    connectivity.onConnectivityChanged.listen((isConnected) {
      if (isConnected) {
        syncAll();
      }
    });
    
    // Periodic sync every 5 minutes when connected
    _syncTimer = Timer.periodic(
      const Duration(minutes: 5),
      (_) {
        if (connectivity.isConnected) {
          syncAll();
        }
      },
    );
  }
  
  /// Sync all pending data
  Future<void> syncAll() async {
    if (_isSyncing || !connectivity.isConnected) return;
    
    _isSyncing = true;
    _syncStatusController.add(SyncStatus.pending);
    
    try {
      debugPrint('Starting sync...');
      
      // Sync in order: users, centers, halqat, students, reports, etc.
      await _syncUsers();
      await _syncCenters();
      await _syncHalqat();
      await _syncStudents();
      await _syncReports();
      await _syncCourses();
      await _syncActivities();
      await _syncFees();
      await _syncHolidays();
      await _syncAnnouncements();
      
      // Update last sync time
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        AppConstants.lastSyncKey,
        DateTime.now().toIso8601String(),
      );
      
      _syncStatusController.add(SyncStatus.synced);
      debugPrint('Sync completed successfully');
    } catch (e) {
      debugPrint('Sync failed: $e');
      _syncStatusController.add(SyncStatus.failed);
    } finally {
      _isSyncing = false;
    }
  }
  
  Future<void> _syncUsers() async {
    // Sync pending users to server
    // Download updated users from server
    debugPrint('Syncing users...');
  }
  
  Future<void> _syncCenters() async {
    debugPrint('Syncing centers...');
  }
  
  Future<void> _syncHalqat() async {
    debugPrint('Syncing halqat...');
  }
  
  Future<void> _syncStudents() async {
    debugPrint('Syncing students...');
  }
  
  Future<void> _syncReports() async {
    debugPrint('Syncing reports...');
  }
  
  Future<void> _syncCourses() async {
    debugPrint('Syncing courses...');
  }
  
  Future<void> _syncActivities() async {
    debugPrint('Syncing activities...');
  }
  
  Future<void> _syncFees() async {
    debugPrint('Syncing fees...');
  }
  
  Future<void> _syncHolidays() async {
    debugPrint('Syncing holidays...');
  }
  
  Future<void> _syncAnnouncements() async {
    debugPrint('Syncing announcements...');
  }
  
  /// Get last sync time
  Future<DateTime?> getLastSyncTime() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSync = prefs.getString(AppConstants.lastSyncKey);
    return lastSync != null ? DateTime.parse(lastSync) : null;
  }
  
  void dispose() {
    _syncTimer?.cancel();
    _syncStatusController.close();
  }
}
