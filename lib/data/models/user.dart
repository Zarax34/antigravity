import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// User Model - represents all user types in the system
class User extends Equatable {
  final String id;
  final String username;
  final String fullName;
  final String? email;
  final String? phone;
  final UserRole role;
  final String? centerId;
  final String? halqaId;
  final String? profileImage;
  final bool isActive;
  final bool isBlocked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const User({
    required this.id,
    required this.username,
    required this.fullName,
    this.email,
    this.phone,
    required this.role,
    this.centerId,
    this.halqaId,
    this.profileImage,
    this.isActive = true,
    this.isBlocked = false,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      username: json['username'] as String,
      fullName: json['full_name'] as String,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: UserRole.values.firstWhere(
        (e) => e.name == json['role'],
        orElse: () => UserRole.student,
      ),
      centerId: json['center_id'] as String?,
      halqaId: json['halqa_id'] as String?,
      profileImage: json['profile_image'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      isBlocked: json['is_blocked'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      syncStatus: SyncStatus.synced,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'role': role.name,
      'center_id': centerId,
      'halqa_id': halqaId,
      'profile_image': profileImage,
      'is_active': isActive,
      'is_blocked': isBlocked,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  User copyWith({
    String? id,
    String? username,
    String? fullName,
    String? email,
    String? phone,
    UserRole? role,
    String? centerId,
    String? halqaId,
    String? profileImage,
    bool? isActive,
    bool? isBlocked,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      centerId: centerId ?? this.centerId,
      halqaId: halqaId ?? this.halqaId,
      profileImage: profileImage ?? this.profileImage,
      isActive: isActive ?? this.isActive,
      isBlocked: isBlocked ?? this.isBlocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  /// Check if user has permission for a specific action
  bool hasPermission(Permission permission) {
    return _rolePermissions[role]?.contains(permission) ?? false;
  }

  /// Check if user can access certain data
  bool canAccessCenter(String checkCenterId) {
    if (role == UserRole.systemAdmin) return true;
    return centerId == checkCenterId;
  }

  bool canAccessHalqa(String checkHalqaId) {
    if (role == UserRole.systemAdmin || role == UserRole.centerManager) return true;
    return halqaId == checkHalqaId;
  }

  @override
  List<Object?> get props => [
        id,
        username,
        fullName,
        email,
        phone,
        role,
        centerId,
        halqaId,
        profileImage,
        isActive,
        isBlocked,
        createdAt,
        updatedAt,
      ];
}

/// Permission types
enum Permission {
  // Halqa Management
  createHalqa,
  editHalqa,
  deleteHalqa,
  viewAllHalqat,
  
  // Student Management
  createStudent,
  editStudent,
  deleteStudent,
  importStudents,
  viewAllStudents,
  
  // Report Management
  createReport,
  editReport,
  deleteReport,
  approveReport,
  viewAllReports,
  
  // Course Management
  createCourse,
  editCourse,
  deleteCourse,
  manageCourseAttendance,
  uploadCertificates,
  
  // Activity Management
  createActivity,
  editActivity,
  deleteActivity,
  recordActivityAttendance,
  
  // Fee Management
  createFee,
  editFee,
  deleteFee,
  recordPayment,
  viewAllPayments,
  
  // Holiday Management
  createHoliday,
  editHoliday,
  deleteHoliday,
  requestHoliday,
  
  // User Management
  createUser,
  editUser,
  deleteUser,
  blockUser,
  resetPassword,
  viewAllUsers,
  
  // Announcement
  createAnnouncement,
  editAnnouncement,
  deleteAnnouncement,
  
  // Settings
  editSystemSettings,
  editCenterSettings,
  editCopyright,
  editDeveloperLink,
  editPermissions,
}

/// Role-based permissions mapping
const Map<UserRole, Set<Permission>> _rolePermissions = {
  UserRole.systemAdmin: {
    // All permissions
    ...Permission.values,
  },
  UserRole.centerManager: {
    // All except system-level settings
    Permission.createHalqa,
    Permission.editHalqa,
    Permission.deleteHalqa,
    Permission.viewAllHalqat,
    Permission.createStudent,
    Permission.editStudent,
    Permission.deleteStudent,
    Permission.importStudents,
    Permission.viewAllStudents,
    Permission.createReport,
    Permission.editReport,
    Permission.deleteReport,
    Permission.approveReport,
    Permission.viewAllReports,
    Permission.createCourse,
    Permission.editCourse,
    Permission.deleteCourse,
    Permission.manageCourseAttendance,
    Permission.uploadCertificates,
    Permission.createActivity,
    Permission.editActivity,
    Permission.deleteActivity,
    Permission.recordActivityAttendance,
    Permission.createFee,
    Permission.editFee,
    Permission.deleteFee,
    Permission.recordPayment,
    Permission.viewAllPayments,
    Permission.createHoliday,
    Permission.editHoliday,
    Permission.deleteHoliday,
    Permission.createUser,
    Permission.editUser,
    Permission.deleteUser,
    Permission.blockUser,
    Permission.resetPassword,
    Permission.viewAllUsers,
    Permission.createAnnouncement,
    Permission.editAnnouncement,
    Permission.deleteAnnouncement,
    Permission.editCenterSettings,
  },
  UserRole.teacher: {
    Permission.createReport,
    Permission.editReport,
    Permission.recordPayment,
    Permission.manageCourseAttendance,
    Permission.recordActivityAttendance,
    Permission.requestHoliday,
  },
  UserRole.communicationManager: {
    Permission.createReport,
    Permission.editReport,
    Permission.approveReport,
    Permission.viewAllReports,
    Permission.createAnnouncement,
  },
  UserRole.parent: {},
  UserRole.student: {},
};
