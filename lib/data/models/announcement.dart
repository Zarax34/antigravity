import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Announcement Model - represents a system announcement
class Announcement extends Equatable {
  final String id;
  final String title;
  final String content;
  final String? image;
  final String centerId;
  final String createdBy;
  final AnnouncementScope scope;
  final List<String>? targetHalqaIds;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const Announcement({
    required this.id,
    required this.title,
    required this.content,
    this.image,
    required this.centerId,
    required this.createdBy,
    this.scope = AnnouncementScope.all,
    this.targetHalqaIds,
    this.isActive = true,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      image: json['image'] as String?,
      centerId: json['center_id'] as String,
      createdBy: json['created_by'] as String,
      scope: AnnouncementScope.values.firstWhere(
        (e) => e.name == json['scope'],
        orElse: () => AnnouncementScope.all,
      ),
      targetHalqaIds: (json['target_halqa_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isActive: json['is_active'] as bool? ?? true,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'image': image,
      'center_id': centerId,
      'created_by': createdBy,
      'scope': scope.name,
      'target_halqa_ids': targetHalqaIds,
      'is_active': isActive,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  Announcement copyWith({
    String? id,
    String? title,
    String? content,
    String? image,
    String? centerId,
    String? createdBy,
    AnnouncementScope? scope,
    List<String>? targetHalqaIds,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return Announcement(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
      centerId: centerId ?? this.centerId,
      createdBy: createdBy ?? this.createdBy,
      scope: scope ?? this.scope,
      targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        image,
        centerId,
        createdBy,
        scope,
        targetHalqaIds,
        isActive,
        createdAt,
        updatedAt,
      ];
}

/// Announcement Scope
enum AnnouncementScope {
  all,        // جميع المستخدمين
  center,     // مركز معين
  halqat,     // حلقات معينة
}

extension AnnouncementScopeExtension on AnnouncementScope {
  String get arabicName {
    switch (this) {
      case AnnouncementScope.all:
        return 'الجميع';
      case AnnouncementScope.center:
        return 'المركز';
      case AnnouncementScope.halqat:
        return 'حلقات محددة';
    }
  }
}

/// Notification Model - for push notifications and in-app notifications
class AppNotification extends Equatable {
  final String id;
  final String userId;
  final String title;
  final String body;
  final NotificationType type;
  final String? targetId; // ID of related entity (report, activity, etc.)
  final bool isRead;
  final DateTime createdAt;
  final SyncStatus syncStatus;

  const AppNotification({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
    required this.type,
    this.targetId,
    this.isRead = false,
    required this.createdAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      type: NotificationType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => NotificationType.general,
      ),
      targetId: json['target_id'] as String?,
      isRead: json['is_read'] as bool? ?? false,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'title': title,
      'body': body,
      'type': type.name,
      'target_id': targetId,
      'is_read': isRead,
      'created_at': createdAt.toIso8601String(),
    };
  }

  AppNotification copyWith({
    String? id,
    String? userId,
    String? title,
    String? body,
    NotificationType? type,
    String? targetId,
    bool? isRead,
    DateTime? createdAt,
    SyncStatus? syncStatus,
  }) {
    return AppNotification(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
      type: type ?? this.type,
      targetId: targetId ?? this.targetId,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        title,
        body,
        type,
        targetId,
        isRead,
        createdAt,
      ];
}

/// Notification Types
enum NotificationType {
  general,
  report,
  course,
  activity,
  fee,
  holiday,
  announcement,
  certificate,
}

extension NotificationTypeExtension on NotificationType {
  String get arabicName {
    switch (this) {
      case NotificationType.general:
        return 'عام';
      case NotificationType.report:
        return 'تقرير';
      case NotificationType.course:
        return 'دورة';
      case NotificationType.activity:
        return 'نشاط';
      case NotificationType.fee:
        return 'رسوم';
      case NotificationType.holiday:
        return 'عطلة';
      case NotificationType.announcement:
        return 'إعلان';
      case NotificationType.certificate:
        return 'شهادة';
    }
  }
}
