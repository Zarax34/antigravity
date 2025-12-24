import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Holiday Model - represents a holiday/vacation
class Holiday extends Equatable {
  final String id;
  final String name;
  final String centerId;
  final DateTime startDate;
  final DateTime? endDate;
  final List<String> targetHalqaIds;
  final bool isRecurring; // عطلة دورية سنوية
  final String? notes;
  final HolidayStatus status;
  final String? requestedBy;
  final String? approvedBy;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const Holiday({
    required this.id,
    required this.name,
    required this.centerId,
    required this.startDate,
    this.endDate,
    this.targetHalqaIds = const [],
    this.isRecurring = false,
    this.notes,
    this.status = HolidayStatus.approved,
    this.requestedBy,
    this.approvedBy,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory Holiday.fromJson(Map<String, dynamic> json) {
    return Holiday(
      id: json['id'] as String,
      name: json['name'] as String,
      centerId: json['center_id'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'] as String)
          : null,
      targetHalqaIds: (json['target_halqa_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ?? [],
      isRecurring: json['is_recurring'] as bool? ?? false,
      notes: json['notes'] as String?,
      status: HolidayStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => HolidayStatus.approved,
      ),
      requestedBy: json['requested_by'] as String?,
      approvedBy: json['approved_by'] as String?,
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
      'start_date': startDate.toIso8601String(),
      'end_date': endDate?.toIso8601String(),
      'target_halqa_ids': targetHalqaIds,
      'is_recurring': isRecurring,
      'notes': notes,
      'status': status.name,
      'requested_by': requestedBy,
      'approved_by': approvedBy,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Holiday copyWith({
    String? id,
    String? name,
    String? centerId,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? targetHalqaIds,
    bool? isRecurring,
    String? notes,
    HolidayStatus? status,
    String? requestedBy,
    String? approvedBy,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return Holiday(
      id: id ?? this.id,
      name: name ?? this.name,
      centerId: centerId ?? this.centerId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
      isRecurring: isRecurring ?? this.isRecurring,
      notes: notes ?? this.notes,
      status: status ?? this.status,
      requestedBy: requestedBy ?? this.requestedBy,
      approvedBy: approvedBy ?? this.approvedBy,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  /// Check if holiday is currently active
  bool get isCurrent {
    final now = DateTime.now();
    if (endDate != null) {
      return now.isAfter(startDate) && now.isBefore(endDate!);
    }
    return now.year == startDate.year &&
           now.month == startDate.month &&
           now.day == startDate.day;
  }

  /// Get date range display string
  String get dateRangeDisplay {
    if (endDate != null) {
      return 'من ${_formatDate(startDate)} إلى ${_formatDate(endDate!)}';
    }
    return _formatDate(startDate);
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        centerId,
        startDate,
        endDate,
        targetHalqaIds,
        isRecurring,
        notes,
        status,
        requestedBy,
        approvedBy,
        isActive,
        createdAt,
        updatedAt,
      ];
}

/// Holiday Status
enum HolidayStatus {
  pending,   // قيد الانتظار (طلب من معلم)
  approved,  // معتمد
  rejected,  // مرفوض
}

extension HolidayStatusExtension on HolidayStatus {
  String get arabicName {
    switch (this) {
      case HolidayStatus.pending:
        return 'قيد الانتظار';
      case HolidayStatus.approved:
        return 'معتمد';
      case HolidayStatus.rejected:
        return 'مرفوض';
    }
  }
}
