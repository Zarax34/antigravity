import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Halqa (Circle) Model - represents a Quran memorization circle
class Halqa extends Equatable {
  final String id;
  final String name;
  final String centerId;
  final String? teacherId;
  final String? teacherName; // For cases where teacher has no account
  final HalqaCategory category;
  final int studentCount;
  final int maxStudents;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const Halqa({
    required this.id,
    required this.name,
    required this.centerId,
    this.teacherId,
    this.teacherName,
    required this.category,
    this.studentCount = 0,
    this.maxStudents = 30,
    this.description,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  /// Get display name for teacher
  String get displayTeacherName => teacherName ?? 'غير محدد';

  factory Halqa.fromJson(Map<String, dynamic> json) {
    return Halqa(
      id: json['id'] as String,
      name: json['name'] as String,
      centerId: json['center_id'] as String,
      teacherId: json['teacher_id'] as String?,
      teacherName: json['teacher_name'] as String?,
      category: HalqaCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => HalqaCategory.youth,
      ),
      studentCount: json['student_count'] as int? ?? 0,
      maxStudents: json['max_students'] as int? ?? 30,
      description: json['description'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'center_id': centerId,
      'teacher_id': teacherId,
      'teacher_name': teacherName,
      'category': category.name,
      'student_count': studentCount,
      'max_students': maxStudents,
      'description': description,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Halqa copyWith({
    String? id,
    String? name,
    String? centerId,
    String? teacherId,
    String? teacherName,
    HalqaCategory? category,
    int? studentCount,
    int? maxStudents,
    String? description,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return Halqa(
      id: id ?? this.id,
      name: name ?? this.name,
      centerId: centerId ?? this.centerId,
      teacherId: teacherId ?? this.teacherId,
      teacherName: teacherName ?? this.teacherName,
      category: category ?? this.category,
      studentCount: studentCount ?? this.studentCount,
      maxStudents: maxStudents ?? this.maxStudents,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        centerId,
        teacherId,
        teacherName,
        category,
        studentCount,
        maxStudents,
        description,
        isActive,
        createdAt,
        updatedAt,
      ];
}
