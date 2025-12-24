import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Course Model - represents a training course/program
class Course extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? image;
  final String centerId;
  final String? responsibleTeacherId;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> targetHalqaIds;
  final List<String> targetStudentIds;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const Course({
    required this.id,
    required this.name,
    this.description,
    this.image,
    required this.centerId,
    this.responsibleTeacherId,
    required this.startDate,
    required this.endDate,
    this.targetHalqaIds = const [],
    this.targetStudentIds = const [],
    this.notes,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      centerId: json['center_id'] as String,
      responsibleTeacherId: json['responsible_teacher_id'] as String?,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      targetHalqaIds: (json['target_halqa_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ?? [],
      targetStudentIds: (json['target_student_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ?? [],
      notes: json['notes'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'center_id': centerId,
      'responsible_teacher_id': responsibleTeacherId,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'target_halqa_ids': targetHalqaIds,
      'target_student_ids': targetStudentIds,
      'notes': notes,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Course copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    String? centerId,
    String? responsibleTeacherId,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? targetHalqaIds,
    List<String>? targetStudentIds,
    String? notes,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return Course(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      centerId: centerId ?? this.centerId,
      responsibleTeacherId: responsibleTeacherId ?? this.responsibleTeacherId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
      targetStudentIds: targetStudentIds ?? this.targetStudentIds,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  /// Check if course is ongoing
  bool get isOngoing {
    final now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate);
  }

  /// Check if course has ended
  bool get hasEnded => DateTime.now().isAfter(endDate);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        centerId,
        responsibleTeacherId,
        startDate,
        endDate,
        targetHalqaIds,
        targetStudentIds,
        notes,
        isActive,
        createdAt,
        updatedAt,
      ];
}

/// Course Attendance - daily attendance for a course
class CourseAttendance extends Equatable {
  final String id;
  final String courseId;
  final String studentId;
  final DateTime date;
  final bool isPresent;
  final String? notes;
  final SyncStatus syncStatus;

  const CourseAttendance({
    required this.id,
    required this.courseId,
    required this.studentId,
    required this.date,
    required this.isPresent,
    this.notes,
    this.syncStatus = SyncStatus.synced,
  });

  factory CourseAttendance.fromJson(Map<String, dynamic> json) {
    return CourseAttendance(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      studentId: json['student_id'] as String,
      date: DateTime.parse(json['date'] as String),
      isPresent: json['is_present'] as bool,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'student_id': studentId,
      'date': date.toIso8601String(),
      'is_present': isPresent,
      'notes': notes,
    };
  }

  @override
  List<Object?> get props => [id, courseId, studentId, date, isPresent, notes];
}

/// Course Certificate - certificate for completing a course
class CourseCertificate extends Equatable {
  final String id;
  final String courseId;
  final String studentId;
  final String? certificateUrl;
  final DateTime? issuedAt;
  final SyncStatus syncStatus;

  const CourseCertificate({
    required this.id,
    required this.courseId,
    required this.studentId,
    this.certificateUrl,
    this.issuedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory CourseCertificate.fromJson(Map<String, dynamic> json) {
    return CourseCertificate(
      id: json['id'] as String,
      courseId: json['course_id'] as String,
      studentId: json['student_id'] as String,
      certificateUrl: json['certificate_url'] as String?,
      issuedAt: json['issued_at'] != null
          ? DateTime.parse(json['issued_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'student_id': studentId,
      'certificate_url': certificateUrl,
      'issued_at': issuedAt?.toIso8601String(),
    };
  }

  /// Create certificate from Excel row (for bulk upload)
  factory CourseCertificate.fromExcelRow({
    required Map<String, dynamic> row,
    required String courseId,
    required String studentId,
  }) {
    return CourseCertificate(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      courseId: courseId,
      studentId: studentId,
      certificateUrl: row['رابط الشهادة'] ?? row['certificate_url'],
      issuedAt: DateTime.now(),
      syncStatus: SyncStatus.pending,
    );
  }

  @override
  List<Object?> get props => [id, courseId, studentId, certificateUrl, issuedAt];
}
