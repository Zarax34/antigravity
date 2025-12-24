import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Activity Model - represents an activity/event
class Activity extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? image;
  final String centerId;
  final String? location;
  final DateTime startDate;
  final DateTime startTime;
  final DateTime endTime;
  final List<String> targetHalqaIds;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const Activity({
    required this.id,
    required this.name,
    this.description,
    this.image,
    required this.centerId,
    this.location,
    required this.startDate,
    required this.startTime,
    required this.endTime,
    this.targetHalqaIds = const [],
    this.notes,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory Activity.fromJson(Map<String, dynamic> json) {
    return Activity(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      centerId: json['center_id'] as String,
      location: json['location'] as String?,
      startDate: DateTime.parse(json['start_date'] as String),
      startTime: DateTime.parse(json['start_time'] as String),
      endTime: DateTime.parse(json['end_time'] as String),
      targetHalqaIds: (json['target_halqa_ids'] as List<dynamic>?)
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
      'location': location,
      'start_date': startDate.toIso8601String(),
      'start_time': startTime.toIso8601String(),
      'end_time': endTime.toIso8601String(),
      'target_halqa_ids': targetHalqaIds,
      'notes': notes,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Activity copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    String? centerId,
    String? location,
    DateTime? startDate,
    DateTime? startTime,
    DateTime? endTime,
    List<String>? targetHalqaIds,
    String? notes,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return Activity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      centerId: centerId ?? this.centerId,
      location: location ?? this.location,
      startDate: startDate ?? this.startDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  /// Check if activity has ended
  bool get hasEnded => DateTime.now().isAfter(startDate);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        centerId,
        location,
        startDate,
        startTime,
        endTime,
        targetHalqaIds,
        notes,
        isActive,
        createdAt,
        updatedAt,
      ];
}

/// Activity Consent - parent consent for an activity
class ActivityConsent extends Equatable {
  final String id;
  final String activityId;
  final String studentId;
  final String parentId;
  final ConsentStatus status;
  final String? notes;
  final DateTime? respondedAt;
  final SyncStatus syncStatus;

  const ActivityConsent({
    required this.id,
    required this.activityId,
    required this.studentId,
    required this.parentId,
    this.status = ConsentStatus.pending,
    this.notes,
    this.respondedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory ActivityConsent.fromJson(Map<String, dynamic> json) {
    return ActivityConsent(
      id: json['id'] as String,
      activityId: json['activity_id'] as String,
      studentId: json['student_id'] as String,
      parentId: json['parent_id'] as String,
      status: ConsentStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ConsentStatus.pending,
      ),
      notes: json['notes'] as String?,
      respondedAt: json['responded_at'] != null
          ? DateTime.parse(json['responded_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'activity_id': activityId,
      'student_id': studentId,
      'parent_id': parentId,
      'status': status.name,
      'notes': notes,
      'responded_at': respondedAt?.toIso8601String(),
    };
  }

  ActivityConsent copyWith({
    String? id,
    String? activityId,
    String? studentId,
    String? parentId,
    ConsentStatus? status,
    String? notes,
    DateTime? respondedAt,
    SyncStatus? syncStatus,
  }) {
    return ActivityConsent(
      id: id ?? this.id,
      activityId: activityId ?? this.activityId,
      studentId: studentId ?? this.studentId,
      parentId: parentId ?? this.parentId,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      respondedAt: respondedAt ?? this.respondedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        activityId,
        studentId,
        parentId,
        status,
        notes,
        respondedAt,
      ];
}

/// Activity Attendance - actual attendance after activity
class ActivityAttendance extends Equatable {
  final String id;
  final String activityId;
  final String studentId;
  final bool attended;
  final String? notes;
  final String? recordedBy;
  final DateTime recordedAt;
  final SyncStatus syncStatus;

  const ActivityAttendance({
    required this.id,
    required this.activityId,
    required this.studentId,
    required this.attended,
    this.notes,
    this.recordedBy,
    required this.recordedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory ActivityAttendance.fromJson(Map<String, dynamic> json) {
    return ActivityAttendance(
      id: json['id'] as String,
      activityId: json['activity_id'] as String,
      studentId: json['student_id'] as String,
      attended: json['attended'] as bool,
      notes: json['notes'] as String?,
      recordedBy: json['recorded_by'] as String?,
      recordedAt: DateTime.parse(json['recorded_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'activity_id': activityId,
      'student_id': studentId,
      'attended': attended,
      'notes': notes,
      'recorded_by': recordedBy,
      'recorded_at': recordedAt.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        activityId,
        studentId,
        attended,
        notes,
        recordedBy,
        recordedAt,
      ];
}
