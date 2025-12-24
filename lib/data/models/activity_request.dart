import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// نموذج طلب نشاط - يستخدم عندما يطلب المعلم إضافة نشاط ويحتاج موافقة مسؤول المركز
class ActivityRequest extends Equatable {
  final String id;
  final String title;
  final String description;
  final String requesterId; // المعلم الذي طلب النشاط
  final String centerId;
  final DateTime activityDate;
  final String? location;
  final RequestStatus status;
  final String? reviewerId; // مسؤول المركز الذي راجع الطلب
  final String? rejectionNote;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const ActivityRequest({
    required this.id,
    required this.title,
    required this.description,
    required this.requesterId,
    required this.centerId,
    required this.activityDate,
    this.location,
    this.status = RequestStatus.pending,
    this.reviewerId,
    this.rejectionNote,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory ActivityRequest.fromJson(Map<String, dynamic> json) {
    return ActivityRequest(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      requesterId: json['requester_id'] as String,
      centerId: json['center_id'] as String,
      activityDate: DateTime.parse(json['activity_date'] as String),
      location: json['location'] as String?,
      status: RequestStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => RequestStatus.pending,
      ),
      reviewerId: json['reviewer_id'] as String?,
      rejectionNote: json['rejection_note'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'requester_id': requesterId,
      'center_id': centerId,
      'activity_date': activityDate.toIso8601String(),
      'location': location,
      'status': status.name,
      'reviewer_id': reviewerId,
      'rejection_note': rejectionNote,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  ActivityRequest copyWith({
    String? id,
    String? title,
    String? description,
    String? requesterId,
    String? centerId,
    DateTime? activityDate,
    String? location,
    RequestStatus? status,
    String? reviewerId,
    String? rejectionNote,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return ActivityRequest(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      requesterId: requesterId ?? this.requesterId,
      centerId: centerId ?? this.centerId,
      activityDate: activityDate ?? this.activityDate,
      location: location ?? this.location,
      status: status ?? this.status,
      reviewerId: reviewerId ?? this.reviewerId,
      rejectionNote: rejectionNote ?? this.rejectionNote,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        requesterId,
        centerId,
        activityDate,
        location,
        status,
        reviewerId,
        rejectionNote,
        createdAt,
        updatedAt,
      ];
}

/// حالة الطلب
enum RequestStatus {
  pending,   // معلق - في انتظار الموافقة
  approved,  // موافق عليه
  rejected,  // مرفوض
}
