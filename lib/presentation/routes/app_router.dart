import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../screens/auth/splash_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/welcome_screen.dart';
import '../screens/admin/admin_main_screen.dart';
import '../screens/teacher/teacher_main_screen.dart';
import '../screens/parent/parent_main_screen.dart';
import '../screens/admin/halqat_screen.dart';
import '../screens/admin/students_screen.dart';
import '../screens/admin/reports_screen.dart';
import '../screens/admin/add_report_screen.dart';
import '../screens/admin/courses_screen.dart';
import '../screens/admin/activities_screen.dart';
import '../screens/admin/fees_screen.dart';
import '../screens/admin/holidays_screen.dart';
import '../screens/admin/users_screen.dart';
import '../screens/admin/announcements_screen.dart';
import '../screens/admin/settings_screen.dart';
import '../screens/admin/centers_screen.dart';
import '../screens/admin/add_center_screen.dart';
import '../screens/admin/add_user_screen.dart';
import '../screens/admin/add_student_screen.dart';
import '../screens/shared/announcements_list_screen.dart';
import '../screens/shared/activities_list_screen.dart';
import '../screens/center_manager/courses_management_screen.dart';
import '../../core/constants/app_constants.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      // Splash Screen
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      
      // Welcome Screen
      GoRoute(
        path: '/welcome',
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      
      // Login
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      
      // Admin Routes
      GoRoute(
        path: '/admin',
        name: 'admin',
        builder: (context, state) => const AdminMainScreen(),
        routes: [
          GoRoute(
            path: 'halqat',
            name: 'halqat',
            builder: (context, state) => const HalqatScreen(),
          ),
          GoRoute(
            path: 'students',
            name: 'students',
            builder: (context, state) => const StudentsScreen(),
          ),
          GoRoute(
            path: 'add-student',
            name: 'add-student',
            builder: (context, state) => const AddStudentScreen(),
          ),
          GoRoute(
            path: 'reports',
            name: 'reports',
            builder: (context, state) => const ReportsScreen(),
          ),
          GoRoute(
            path: 'add-report',
            name: 'add-report',
            builder: (context, state) => const AddReportScreen(),
          ),
          GoRoute(
            path: 'courses',
            name: 'courses',
            builder: (context, state) => const CoursesScreen(),
          ),
          GoRoute(
            path: 'courses-management',
            name: 'courses-management',
            builder: (context, state) => const CoursesManagementScreen(),
          ),
          GoRoute(
            path: 'activities',
            name: 'activities',
            builder: (context, state) => const ActivitiesScreen(),
          ),
          GoRoute(
            path: 'activities-list',
            name: 'activities-list',
            builder: (context, state) => const ActivitiesListScreen(),
          ),
          GoRoute(
            path: 'fees',
            name: 'fees',
            builder: (context, state) => const FeesScreen(),
          ),
          GoRoute(
            path: 'holidays',
            name: 'holidays',
            builder: (context, state) => const HolidaysScreen(),
          ),
          GoRoute(
            path: 'users',
            name: 'users',
            builder: (context, state) => const UsersScreen(),
          ),
          GoRoute(
            path: 'add-user',
            name: 'add-user',
            builder: (context, state) => const AddUserScreen(),
          ),
          GoRoute(
            path: 'centers',
            name: 'centers',
            builder: (context, state) => const CentersScreen(),
          ),
          GoRoute(
            path: 'add-center',
            name: 'add-center',
            builder: (context, state) => const AddCenterScreen(),
          ),
          GoRoute(
            path: 'announcements',
            name: 'announcements',
            builder: (context, state) => const AnnouncementsScreen(),
          ),
          GoRoute(
            path: 'announcements-list',
            name: 'announcements-list',
            builder: (context, state) => const AnnouncementsListScreen(),
          ),
          GoRoute(
            path: 'settings',
            name: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
      
      // Teacher Routes
      GoRoute(
        path: '/teacher',
        name: 'teacher',
        builder: (context, state) => const TeacherMainScreen(),
      ),
      
      // Parent Routes
      GoRoute(
        path: '/parent',
        name: 'parent',
        builder: (context, state) => const ParentMainScreen(),
      ),
    ],
    
    redirect: (context, state) {
      final authProvider = context.read<AuthProvider>();
      final isLoggedIn = authProvider.isAuthenticated;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/';
      
      // Allow splash screen to show
      if (isSplash) return null;
      
      // Redirect to login if not authenticated
      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }
      
      // Redirect based on user role after login
      if (isLoggedIn && isLoggingIn) {
        final role = authProvider.currentUser?.role;
        switch (role) {
          case UserRole.systemAdmin:
          case UserRole.centerManager:
          case UserRole.communicationManager:
            return '/admin';
          case UserRole.teacher:
            return '/teacher';
          case UserRole.parent:
          case UserRole.student:
            return '/parent';
          default:
            return '/login';
        }
      }
      
      return null;
    },
    
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'الصفحة غير موجودة',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(state.error?.message ?? 'حدث خطأ غير متوقع'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('العودة للرئيسية'),
            ),
          ],
        ),
      ),
    ),
  );
}
