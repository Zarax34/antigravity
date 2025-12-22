import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Service for handling push notifications
class NotificationService {
  final FlutterLocalNotificationsPlugin _localNotifications = 
      FlutterLocalNotificationsPlugin();
  FirebaseMessaging? _firebaseMessaging;
  bool _isFirebaseAvailable = false;
  
  String? _fcmToken;
  String? get fcmToken => _fcmToken;
  bool get isFirebaseAvailable => _isFirebaseAvailable;
  
  Future<void> initialize() async {
    // Skip local notifications on web - not supported
    if (kIsWeb) {
      debugPrint('Local notifications not supported on web');
      return;
    }
    
    // Initialize local notifications
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    
    // Linux settings for desktop
    const linuxSettings = LinuxInitializationSettings(
      defaultActionName: 'Open notification',
    );
    
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
      linux: linuxSettings,
    );
    
    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );
    
    // Request local notification permissions on Android 13+
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    
    // Try to initialize Firebase Messaging (optional)
    await _initializeFirebaseMessaging();
  }
  
  Future<void> _initializeFirebaseMessaging() async {
    try {
      _firebaseMessaging = FirebaseMessaging.instance;
      
      // Request FCM permissions
      await _firebaseMessaging!.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );
      
      // Get FCM token
      _fcmToken = await _firebaseMessaging!.getToken();
      debugPrint('FCM Token: $_fcmToken');
      
      // Handle FCM token refresh
      _firebaseMessaging!.onTokenRefresh.listen((token) {
        _fcmToken = token;
        debugPrint('FCM Token refreshed: $token');
        // TODO: Update token on server
      });
      
      // Handle foreground messages
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      
      // Handle background messages
      FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
      
      // Handle notification tap when app was terminated
      final initialMessage = await _firebaseMessaging!.getInitialMessage();
      if (initialMessage != null) {
        _handleNotificationNavigation(initialMessage.data);
      }
      
      // Handle notification tap when app was in background
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        _handleNotificationNavigation(message.data);
      });
      
      _isFirebaseAvailable = true;
      debugPrint('Firebase Messaging initialized successfully');
    } catch (e) {
      _isFirebaseAvailable = false;
      debugPrint('Firebase Messaging not available: $e');
      debugPrint('App will continue with local notifications only');
    }
  }
  

  
  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('Received foreground message: ${message.notification?.title}');
    
    // Show local notification
    showNotification(
      title: message.notification?.title ?? 'إشعار جديد',
      body: message.notification?.body ?? '',
      payload: message.data.toString(),
    );
  }
  
  static Future<void> _handleBackgroundMessage(RemoteMessage message) async {
    debugPrint('Received background message: ${message.notification?.title}');
  }
  
  void _handleNotificationNavigation(Map<String, dynamic> data) {
    // Navigate based on notification type
    final type = data['type'];
    final targetId = data['target_id'];
    
    debugPrint('Notification tapped: type=$type, targetId=$targetId');
    // TODO: Implement navigation
  }
  
  void _onNotificationTapped(NotificationResponse response) {
    debugPrint('Local notification tapped: ${response.payload}');
    // TODO: Implement navigation
  }
  
  /// Show a local notification
  Future<void> showNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'quran_center_channel',
      'مركز تحفيظ القرآن',
      channelDescription: 'إشعارات مركز تحفيظ القرآن الكريم',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );
    
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    
    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );
    
    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch.remainder(100000),
      title,
      body,
      details,
      payload: payload,
    );
  }
  
  /// Show a report notification to parent
  Future<void> showReportNotification({
    required String studentName,
    required String status,
  }) async {
    await showNotification(
      title: 'تقرير يومي - $studentName',
      body: 'حالة الحضور: $status',
    );
  }
  
  /// Show activity notification
  Future<void> showActivityNotification({
    required String activityName,
    required String date,
  }) async {
    await showNotification(
      title: 'نشاط جديد: $activityName',
      body: 'بتاريخ: $date\nيرجى الموافقة أو الرفض',
    );
  }
  
  /// Show fee notification
  Future<void> showFeeNotification({
    required String feeName,
    required String amount,
  }) async {
    await showNotification(
      title: 'رسوم جديدة: $feeName',
      body: 'المبلغ: $amount',
    );
  }
  
  /// Show holiday notification
  Future<void> showHolidayNotification({
    required String holidayName,
    required String dateRange,
  }) async {
    await showNotification(
      title: 'عطلة: $holidayName',
      body: dateRange,
    );
  }
  
  /// Subscribe to topic for targeted notifications
  Future<void> subscribeToTopic(String topic) async {
    if (!_isFirebaseAvailable || _firebaseMessaging == null) {
      debugPrint('Cannot subscribe to topic - Firebase not available');
      return;
    }
    await _firebaseMessaging!.subscribeToTopic(topic);
    debugPrint('Subscribed to topic: $topic');
  }
  
  /// Unsubscribe from topic
  Future<void> unsubscribeFromTopic(String topic) async {
    if (!_isFirebaseAvailable || _firebaseMessaging == null) {
      debugPrint('Cannot unsubscribe from topic - Firebase not available');
      return;
    }
    await _firebaseMessaging!.unsubscribeFromTopic(topic);
    debugPrint('Unsubscribed from topic: $topic');
  }
}
