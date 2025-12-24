import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Fee Model - represents a subscription/fee
class Fee extends Equatable {
  final String id;
  final String name;
  final String centerId;
  final int month;
  final int day;
  final double amount;
  final List<String> targetHalqaIds;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const Fee({
    required this.id,
    required this.name,
    required this.centerId,
    required this.month,
    required this.day,
    required this.amount,
    this.targetHalqaIds = const [],
    this.notes,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory Fee.fromJson(Map<String, dynamic> json) {
    return Fee(
      id: json['id'] as String,
      name: json['name'] as String,
      centerId: json['center_id'] as String,
      month: json['month'] as int,
      day: json['day'] as int,
      amount: (json['amount'] as num).toDouble(),
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
      'center_id': centerId,
      'month': month,
      'day': day,
      'amount': amount,
      'target_halqa_ids': targetHalqaIds,
      'notes': notes,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Fee copyWith({
    String? id,
    String? name,
    String? centerId,
    int? month,
    int? day,
    double? amount,
    List<String>? targetHalqaIds,
    String? notes,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return Fee(
      id: id ?? this.id,
      name: name ?? this.name,
      centerId: centerId ?? this.centerId,
      month: month ?? this.month,
      day: day ?? this.day,
      amount: amount ?? this.amount,
      targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  /// Get month name in Arabic
  String get monthName {
    const months = [
      'يناير', 'فبراير', 'مارس', 'أبريل', 'مايو', 'يونيو',
      'يوليو', 'أغسطس', 'سبتمبر', 'أكتوبر', 'نوفمبر', 'ديسمبر'
    ];
    return months[month - 1];
  }

  @override
  List<Object?> get props => [
        id,
        name,
        centerId,
        month,
        day,
        amount,
        targetHalqaIds,
        notes,
        isActive,
        createdAt,
        updatedAt,
      ];
}

/// Fee Payment - student's payment record
class FeePayment extends Equatable {
  final String id;
  final String feeId;
  final String studentId;
  final String halqaId;
  final PaymentStatus status;
  final double? paidAmount;
  final DateTime? paidAt;
  final String? confirmedBy;
  final String? notes;
  final SyncStatus syncStatus;

  const FeePayment({
    required this.id,
    required this.feeId,
    required this.studentId,
    required this.halqaId,
    this.status = PaymentStatus.unpaid,
    this.paidAmount,
    this.paidAt,
    this.confirmedBy,
    this.notes,
    this.syncStatus = SyncStatus.synced,
  });

  factory FeePayment.fromJson(Map<String, dynamic> json) {
    return FeePayment(
      id: json['id'] as String,
      feeId: json['fee_id'] as String,
      studentId: json['student_id'] as String,
      halqaId: json['halqa_id'] as String,
      status: PaymentStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => PaymentStatus.unpaid,
      ),
      paidAmount: (json['paid_amount'] as num?)?.toDouble(),
      paidAt: json['paid_at'] != null
          ? DateTime.parse(json['paid_at'] as String)
          : null,
      confirmedBy: json['confirmed_by'] as String?,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fee_id': feeId,
      'student_id': studentId,
      'halqa_id': halqaId,
      'status': status.name,
      'paid_amount': paidAmount,
      'paid_at': paidAt?.toIso8601String(),
      'confirmed_by': confirmedBy,
      'notes': notes,
    };
  }

  FeePayment copyWith({
    String? id,
    String? feeId,
    String? studentId,
    String? halqaId,
    PaymentStatus? status,
    double? paidAmount,
    DateTime? paidAt,
    String? confirmedBy,
    String? notes,
    SyncStatus? syncStatus,
  }) {
    return FeePayment(
      id: id ?? this.id,
      feeId: feeId ?? this.feeId,
      studentId: studentId ?? this.studentId,
      halqaId: halqaId ?? this.halqaId,
      status: status ?? this.status,
      paidAmount: paidAmount ?? this.paidAmount,
      paidAt: paidAt ?? this.paidAt,
      confirmedBy: confirmedBy ?? this.confirmedBy,
      notes: notes ?? this.notes,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        feeId,
        studentId,
        halqaId,
        status,
        paidAmount,
        paidAt,
        confirmedBy,
        notes,
      ];
}
