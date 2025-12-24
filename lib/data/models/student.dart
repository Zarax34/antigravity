import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Student Model - represents a student in the Quran center
class Student extends Equatable {
  final String id;
  final String fullName; // الاسم الرباعي
  final String halqaId;
  final String centerId;
  
  // Parent Information
  final String parentName; // اسم ولي الأمر
  final String parentPhone; // رقم ولي الأمر
  final String? parentId; // رابط حساب ولي الأمر
  final String? parentJob; // مهنة ولي الأمر
  
  // Location Information
  final String? currentResidence; // السكن الحالي
  final String? previousResidence; // السكن السابق
  final String? governorate; // المحافظة
  
  // Personal Information
  final int? age;
  final DateTime? birthDate;
  final DateTime enrollmentDate; // تاريخ الالتحاق
  final String? phone; // رقم هاتف الطالب
  final String? profileImage;
  
  // Academic Information
  final String? previousMemorization; // مقدار الحفظ السابق
  final String? notes;
  
  // Account Information
  final String? studentUserId;
  final bool isActive;
  final bool isBlocked;
  
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const Student({
    required this.id,
    required this.fullName,
    required this.halqaId,
    required this.centerId,
    required this.parentName,
    required this.parentPhone,
    this.parentId,
    this.parentJob,
    this.currentResidence,
    this.previousResidence,
    this.governorate,
    this.age,
    this.birthDate,
    required this.enrollmentDate,
    this.phone,
    this.profileImage,
    this.previousMemorization,
    this.notes,
    this.studentUserId,
    this.isActive = true,
    this.isBlocked = false,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] as String,
      fullName: json['full_name'] as String,
      halqaId: json['halqa_id'] as String,
      centerId: json['center_id'] as String,
      parentName: json['parent_name'] as String,
      parentPhone: json['parent_phone'] as String,
      parentId: json['parent_id'] as String?,
      parentJob: json['parent_job'] as String?,
      currentResidence: json['current_residence'] as String?,
      previousResidence: json['previous_residence'] as String?,
      governorate: json['governorate'] as String?,
      age: json['age'] as int?,
      birthDate: json['birth_date'] != null 
          ? DateTime.parse(json['birth_date'] as String)
          : null,
      enrollmentDate: DateTime.parse(json['enrollment_date'] as String),
      phone: json['phone'] as String?,
      profileImage: json['profile_image'] as String?,
      previousMemorization: json['previous_memorization'] as String?,
      notes: json['notes'] as String?,
      studentUserId: json['student_user_id'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      isBlocked: json['is_blocked'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'halqa_id': halqaId,
      'center_id': centerId,
      'parent_name': parentName,
      'parent_phone': parentPhone,
      'parent_id': parentId,
      'parent_job': parentJob,
      'current_residence': currentResidence,
      'previous_residence': previousResidence,
      'governorate': governorate,
      'age': age,
      'birth_date': birthDate?.toIso8601String(),
      'enrollment_date': enrollmentDate.toIso8601String(),
      'phone': phone,
      'profile_image': profileImage,
      'previous_memorization': previousMemorization,
      'notes': notes,
      'student_user_id': studentUserId,
      'is_active': isActive,
      'is_blocked': isBlocked,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  /// Create student from Excel row
  factory Student.fromExcelRow({
    required Map<String, dynamic> row,
    required String halqaId,
    required String centerId,
  }) {
    return Student(
      id: row['id'] ?? DateTime.now().millisecondsSinceEpoch.toString(),
      fullName: row['الاسم الرباعي'] ?? row['full_name'] ?? '',
      halqaId: halqaId,
      centerId: centerId,
      parentName: row['اسم ولي الأمر'] ?? row['parent_name'] ?? '',
      parentPhone: row['رقم ولي الأمر'] ?? row['parent_phone'] ?? '',
      parentJob: row['مهنة ولي الأمر'] ?? row['parent_job'],
      currentResidence: row['السكن الحالي'] ?? row['current_residence'],
      previousResidence: row['السكن السابق'] ?? row['previous_residence'],
      governorate: row['المحافظة'] ?? row['governorate'],
      age: int.tryParse(row['العمر']?.toString() ?? row['age']?.toString() ?? ''),
      birthDate: _parseDate(row['تاريخ الميلاد'] ?? row['birth_date']),
      enrollmentDate: _parseDate(row['تاريخ الالتحاق'] ?? row['enrollment_date']) ?? DateTime.now(),
      phone: row['رقم هاتف الطالب'] ?? row['phone'],
      previousMemorization: row['مقدار الحفظ السابق'] ?? row['previous_memorization'],
      notes: row['ملاحظات'] ?? row['notes'],
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      syncStatus: SyncStatus.pending,
    );
  }

  static DateTime? _parseDate(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String) {
      try {
        return DateTime.parse(value);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  Student copyWith({
    String? id,
    String? fullName,
    String? halqaId,
    String? centerId,
    String? parentName,
    String? parentPhone,
    String? parentId,
    String? parentJob,
    String? currentResidence,
    String? previousResidence,
    String? governorate,
    int? age,
    DateTime? birthDate,
    DateTime? enrollmentDate,
    String? phone,
    String? profileImage,
    String? previousMemorization,
    String? notes,
    String? studentUserId,
    bool? isActive,
    bool? isBlocked,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return Student(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      halqaId: halqaId ?? this.halqaId,
      centerId: centerId ?? this.centerId,
      parentName: parentName ?? this.parentName,
      parentPhone: parentPhone ?? this.parentPhone,
      parentId: parentId ?? this.parentId,
      parentJob: parentJob ?? this.parentJob,
      currentResidence: currentResidence ?? this.currentResidence,
      previousResidence: previousResidence ?? this.previousResidence,
      governorate: governorate ?? this.governorate,
      age: age ?? this.age,
      birthDate: birthDate ?? this.birthDate,
      enrollmentDate: enrollmentDate ?? this.enrollmentDate,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      previousMemorization: previousMemorization ?? this.previousMemorization,
      notes: notes ?? this.notes,
      studentUserId: studentUserId ?? this.studentUserId,
      isActive: isActive ?? this.isActive,
      isBlocked: isBlocked ?? this.isBlocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        halqaId,
        centerId,
        parentName,
        parentPhone,
        parentId,
        parentJob,
        currentResidence,
        previousResidence,
        governorate,
        age,
        birthDate,
        enrollmentDate,
        phone,
        profileImage,
        previousMemorization,
        notes,
        studentUserId,
        isActive,
        isBlocked,
        createdAt,
        updatedAt,
      ];
}
