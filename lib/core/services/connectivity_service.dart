import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

/// Service to monitor network connectivity
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();
  
  StreamSubscription<ConnectivityResult>? _subscription;
  final _connectivityController = StreamController<bool>.broadcast();
  
  bool _isConnected = false;
  bool get isConnected => _isConnected;
  
  Stream<bool> get onConnectivityChanged => _connectivityController.stream;
  
  ConnectivityService() {
    _init();
  }
  
  Future<void> _init() async {
    // Check initial connectivity
    final result = await _connectivity.checkConnectivity();
    _updateConnectivity(result);
    
    // Listen for changes
    _subscription = _connectivity.onConnectivityChanged.listen(_updateConnectivity);
  }
  
  void _updateConnectivity(ConnectivityResult result) {
    final wasConnected = _isConnected;
    
    _isConnected = result == ConnectivityResult.wifi ||
        result == ConnectivityResult.mobile ||
        result == ConnectivityResult.ethernet;
    
    if (wasConnected != _isConnected) {
      _connectivityController.add(_isConnected);
      debugPrint('Connectivity changed: $_isConnected');
    }
  }
  
  Future<bool> checkConnectivity() async {
    final result = await _connectivity.checkConnectivity();
    _updateConnectivity(result);
    return _isConnected;
  }
  
  void dispose() {
    _subscription?.cancel();
    _connectivityController.close();
  }
}
