import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Center Model - represents a Quran memorization center
class Center extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String? logo;
  final String? address;
  final String? phone;
  final String? email;
  final String? managerId;
  final bool isActive;
  final int maxHalqat; // الحد الأقصى لعدد الحلقات
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const Center({
    required this.id,
    required this.name,
    this.description,
    this.logo,
    this.address,
    this.phone,
    this.email,
    this.managerId,
    this.isActive = true,
    this.maxHalqat = 10,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory Center.fromJson(Map<String, dynamic> json) {
    return Center(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      managerId: json['manager_id'] as String?,
      isActive: json['is_active'] as bool? ?? true,
      maxHalqat: json['max_halqat'] as int? ?? 10,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logo': logo,
      'address': address,
      'phone': phone,
      'email': email,
      'manager_id': managerId,
      'is_active': isActive,
      'max_halqat': maxHalqat,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Center copyWith({
    String? id,
    String? name,
    String? description,
    String? logo,
    String? address,
    String? phone,
    String? email,
    String? managerId,
    bool? isActive,
    int? maxHalqat,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return Center(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logo: logo ?? this.logo,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      managerId: managerId ?? this.managerId,
      isActive: isActive ?? this.isActive,
      maxHalqat: maxHalqat ?? this.maxHalqat,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        logo,
        address,
        phone,
        email,
        managerId,
        isActive,
        maxHalqat,
        createdAt,
        updatedAt,
      ];
}
