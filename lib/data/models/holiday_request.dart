import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';
import 'activity_request.dart';

/// نموذج طلب إجازة/عطلة - يستخدم عندما يطلب المعلم إجازة ويحتاج موافقة مسؤول المركز
class HolidayRequest extends Equatable {
  final String id;
  final String requesterId; // المعلم الذي طلب الإجازة
  final String centerId;
  final DateTime startDate;
  final DateTime endDate;
  final String reason;
  final HolidayType type;
  final RequestStatus status;
  final String? reviewerId;
  final String? rejectionNote;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const HolidayRequest({
    required this.id,
    required this.requesterId,
    required this.centerId,
    required this.startDate,
    required this.endDate,
    required this.reason,
    this.type = HolidayType.personal,
    this.status = RequestStatus.pending,
    this.reviewerId,
    this.rejectionNote,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory HolidayRequest.fromJson(Map<String, dynamic> json) {
    return HolidayRequest(
      id: json['id'] as String,
      requesterId: json['requester_id'] as String,
      centerId: json['center_id'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: DateTime.parse(json['end_date'] as String),
      reason: json['reason'] as String,
      type: HolidayType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => HolidayType.personal,
      ),
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
      'requester_id': requesterId,
      'center_id': centerId,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'reason': reason,
      'type': type.name,
      'status': status.name,
      'reviewer_id': reviewerId,
      'rejection_note': rejectionNote,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  HolidayRequest copyWith({
    String? id,
    String? requesterId,
    String? centerId,
    DateTime? startDate,
    DateTime? endDate,
    String? reason,
    HolidayType? type,
    RequestStatus? status,
    String? reviewerId,
    String? rejectionNote,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return HolidayRequest(
      id: id ?? this.id,
      requesterId: requesterId ?? this.requesterId,
      centerId: centerId ?? this.centerId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      reason: reason ?? this.reason,
      type: type ?? this.type,
      status: status ?? this.status,
      reviewerId: reviewerId ?? this.reviewerId,
      rejectionNote: rejectionNote ?? this.rejectionNote,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  /// عدد أيام الإجازة
  int get durationDays => endDate.difference(startDate).inDays + 1;

  @override
  List<Object?> get props => [
        id,
        requesterId,
        centerId,
        startDate,
        endDate,
        reason,
        type,
        status,
        reviewerId,
        rejectionNote,
        createdAt,
        updatedAt,
      ];
}

/// نوع الإجازة
enum HolidayType {
  personal,  // إجازة شخصية
  sick,      // إجازة مرضية
  emergency, // طارئ
  other,     // أخرى
}
