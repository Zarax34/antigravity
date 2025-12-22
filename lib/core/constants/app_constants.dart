// Application Constants

class AppConstants {
  // App Info
  static const String appName = 'مركز تحفيظ القرآن الكريم';
  static const String appVersion = '1.0.0';
  
  // API
  static const String baseUrl = 'https://api.quran-center.com/api/v1';
  static const int connectionTimeout = 30000;
  static const int receiveTimeout = 30000;
  
  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'current_user';
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'language';
  static const String lastSyncKey = 'last_sync';
  
  // Database
  static const String dbName = 'quran_center.db';
  static const int dbVersion = 1;
  
  // Pagination
  static const int defaultPageSize = 20;
  
  // File Upload
  static const int maxImageSize = 5 * 1024 * 1024; // 5MB
  static const List<String> allowedImageTypes = ['jpg', 'jpeg', 'png', 'gif'];
  static const List<String> allowedExcelTypes = ['xlsx', 'xls'];
}

// User Role Types
enum UserRole {
  systemAdmin,      // مسؤول النظام
  centerManager,    // مسؤول المركز
  teacher,          // المعلم
  communicationManager, // مسؤول التواصل
  parent,           // ولي الأمر
  student,          // الطالب
}

extension UserRoleExtension on UserRole {
  String get arabicName {
    switch (this) {
      case UserRole.systemAdmin:
        return 'مسؤول النظام';
      case UserRole.centerManager:
        return 'مسؤول المركز';
      case UserRole.teacher:
        return 'معلم';
      case UserRole.communicationManager:
        return 'مسؤول التواصل';
      case UserRole.parent:
        return 'ولي أمر';
      case UserRole.student:
        return 'طالب';
    }
  }
  
  int get priority {
    switch (this) {
      case UserRole.systemAdmin:
        return 1;
      case UserRole.centerManager:
        return 2;
      case UserRole.teacher:
        return 3;
      case UserRole.communicationManager:
        return 4;
      case UserRole.parent:
        return 5;
      case UserRole.student:
        return 6;
    }
  }
}

// Halqa Category Types
enum HalqaCategory {
  youth,   // شباب
  cubs,    // أشبال
}

extension HalqaCategoryExtension on HalqaCategory {
  String get arabicName {
    switch (this) {
      case HalqaCategory.youth:
        return 'شباب';
      case HalqaCategory.cubs:
        return 'أشبال';
    }
  }
}

// Attendance Status
enum AttendanceStatus {
  present,      // حضر
  absent,       // غاب
  escaped,      // هرب
  didNotRecite, // لم يسمع
  excusedAbsence, // غياب بإذن
}

extension AttendanceStatusExtension on AttendanceStatus {
  String get arabicName {
    switch (this) {
      case AttendanceStatus.present:
        return 'حضر';
      case AttendanceStatus.absent:
        return 'غاب';
      case AttendanceStatus.escaped:
        return 'هرب';
      case AttendanceStatus.didNotRecite:
        return 'لم يسمع';
      case AttendanceStatus.excusedAbsence:
        return 'غياب بإذن';
    }
  }
  
  bool get requiresRecitation => this == AttendanceStatus.present;
}

// Recitation Types
enum RecitationType {
  memorization, // حفظ
  review,       // مراجعة
  recitation,   // تلاوة
  teaching,     // تلقين
}

extension RecitationTypeExtension on RecitationType {
  String get arabicName {
    switch (this) {
      case RecitationType.memorization:
        return 'حفظ';
      case RecitationType.review:
        return 'مراجعة';
      case RecitationType.recitation:
        return 'تلاوة';
      case RecitationType.teaching:
        return 'تلقين';
    }
  }
}

// Payment Status
enum PaymentStatus {
  paid,
  unpaid,
  partial,
}

extension PaymentStatusExtension on PaymentStatus {
  String get arabicName {
    switch (this) {
      case PaymentStatus.paid:
        return 'مدفوع';
      case PaymentStatus.unpaid:
        return 'غير مدفوع';
      case PaymentStatus.partial:
        return 'مدفوع جزئياً';
    }
  }
}

// Activity Consent Status
enum ConsentStatus {
  pending,
  approved,
  rejected,
}

extension ConsentStatusExtension on ConsentStatus {
  String get arabicName {
    switch (this) {
      case ConsentStatus.pending:
        return 'قيد الانتظار';
      case ConsentStatus.approved:
        return 'موافق';
      case ConsentStatus.rejected:
        return 'مرفوض';
    }
  }
}

// Report Approval Status
enum ReportStatus {
  pending,
  approved,
  rejected,
}

// Sync Status
enum SyncStatus {
  synced,
  pending,
  failed,
}
