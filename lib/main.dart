import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/theme/app_theme.dart';
import 'core/services/connectivity_service.dart';
import 'core/services/sync_service.dart';
import 'core/services/notification_service.dart';
import 'core/services/auth_service.dart';
import 'data/datasources/local/database.dart';
import 'presentation/providers/auth_provider.dart';
import 'presentation/providers/halqa_provider.dart';
import 'presentation/providers/student_provider.dart';
import 'presentation/providers/report_provider.dart';
import 'presentation/providers/settings_provider.dart';
import 'presentation/providers/center_provider.dart';
import 'presentation/providers/user_provider.dart';
import 'presentation/providers/announcement_provider.dart';
import 'presentation/providers/course_provider.dart';
import 'presentation/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive for local storage
  await Hive.initFlutter();
  
  // Initialize Firebase (skip on web for now as it needs configuration)
  if (!kIsWeb) {
    try {
      await Firebase.initializeApp();
    } catch (e) {
      debugPrint('Firebase initialization failed: $e');
    }
  } else {
    debugPrint('Firebase disabled on web platform');
  }
  
  // Initialize local database
  final database = AppDatabase();
  
  // Create default admin user if needed
  await database.createDefaultAdminIfNeeded();
  
  // Create default center if needed
  await database.createDefaultCenterIfNeeded();
  
  // Initialize services
  final connectivityService = ConnectivityService();
  final syncService = SyncService(database: database, connectivity: connectivityService);
  final notificationService = NotificationService();
  final authService = AuthService(database: database);
  
  // Initialize notifications
  await notificationService.initialize();
  
  // Set preferred orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  runApp(
    MultiProvider(
      providers: [
        Provider<AppDatabase>.value(value: database),
        Provider<ConnectivityService>.value(value: connectivityService),
        Provider<SyncService>.value(value: syncService),
        Provider<NotificationService>.value(value: notificationService),
        ChangeNotifierProvider(create: (_) => AuthProvider(authService: authService)),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => CenterProvider(database: database)),
        ChangeNotifierProvider(create: (_) => UserProvider(database: database)),
        ChangeNotifierProvider(create: (_) => AnnouncementProvider(database: database)),
        ChangeNotifierProvider(create: (_) => CourseProvider(database: database)),
        ChangeNotifierProxyProvider<AuthProvider, HalqaProvider>(
          create: (_) => HalqaProvider(database: database),
          update: (_, auth, halqa) => halqa!..updateAuth(auth),
        ),
        ChangeNotifierProxyProvider<AuthProvider, StudentProvider>(
          create: (_) => StudentProvider()..setDatabase(database),
          update: (_, auth, student) => student!..updateAuth(auth),
        ),
        ChangeNotifierProxyProvider<AuthProvider, ReportProvider>(
          create: (_) => ReportProvider(database: database),
          update: (_, auth, report) => report!..updateAuth(auth),
        ),
      ],
      child: const QuranCenterApp(),
    ),
  );
}

class QuranCenterApp extends StatelessWidget {
  const QuranCenterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = context.watch<SettingsProvider>();
    
    return MaterialApp.router(
      title: 'مركز تحفيظ القرآن الكريم',
      debugShowCheckedModeBanner: false,
      
      // Theming
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      
      // Localization
      locale: const Locale('ar', 'SA'),
      supportedLocales: const [
        Locale('ar', 'SA'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      
      // Routing
      routerConfig: AppRouter.router,
      
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
    );
  }
}
