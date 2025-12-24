import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Daily Report Model - represents a daily attendance and recitation report
class DailyReport extends Equatable {
  final String id;
  final String halqaId;
  final String teacherId;
  final DateTime date;
  final List<StudentReport> studentReports;
  final ReportStatus status;
  final String? reviewedBy;
  final String? reviewNotes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final SyncStatus syncStatus;

  const DailyReport({
    required this.id,
    required this.halqaId,
    required this.teacherId,
    required this.date,
    required this.studentReports,
    this.status = ReportStatus.pending,
    this.reviewedBy,
    this.reviewNotes,
    required this.createdAt,
    required this.updatedAt,
    this.syncStatus = SyncStatus.synced,
  });

  factory DailyReport.fromJson(Map<String, dynamic> json) {
    return DailyReport(
      id: json['id'] as String,
      halqaId: json['halqa_id'] as String,
      teacherId: json['teacher_id'] as String,
      date: DateTime.parse(json['date'] as String),
      studentReports: (json['student_reports'] as List<dynamic>?)
          ?.map((e) => StudentReport.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      status: ReportStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ReportStatus.pending,
      ),
      reviewedBy: json['reviewed_by'] as String?,
      reviewNotes: json['review_notes'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'halqa_id': halqaId,
      'teacher_id': teacherId,
      'date': date.toIso8601String(),
      'student_reports': studentReports.map((e) => e.toJson()).toList(),
      'status': status.name,
      'reviewed_by': reviewedBy,
      'review_notes': reviewNotes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  DailyReport copyWith({
    String? id,
    String? halqaId,
    String? teacherId,
    DateTime? date,
    List<StudentReport>? studentReports,
    ReportStatus? status,
    String? reviewedBy,
    String? reviewNotes,
    DateTime? createdAt,
    DateTime? updatedAt,
    SyncStatus? syncStatus,
  }) {
    return DailyReport(
      id: id ?? this.id,
      halqaId: halqaId ?? this.halqaId,
      teacherId: teacherId ?? this.teacherId,
      date: date ?? this.date,
      studentReports: studentReports ?? this.studentReports,
      status: status ?? this.status,
      reviewedBy: reviewedBy ?? this.reviewedBy,
      reviewNotes: reviewNotes ?? this.reviewNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  /// Get attendance summary
  Map<AttendanceStatus, int> get attendanceSummary {
    final summary = <AttendanceStatus, int>{};
    for (final status in AttendanceStatus.values) {
      summary[status] = studentReports.where((r) => r.attendanceStatus == status).length;
    }
    return summary;
  }

  int get presentCount => studentReports.where((r) => r.attendanceStatus == AttendanceStatus.present).length;
  int get absentCount => studentReports.where((r) => r.attendanceStatus != AttendanceStatus.present).length;

  @override
  List<Object?> get props => [
        id,
        halqaId,
        teacherId,
        date,
        studentReports,
        status,
        reviewedBy,
        reviewNotes,
        createdAt,
        updatedAt,
      ];
}

/// Student Report - individual student's attendance and recitations
class StudentReport extends Equatable {
  final String id;
  final String reportId;
  final String studentId;
  final String studentName;
  final AttendanceStatus attendanceStatus;
  final List<Recitation> recitations;
  final String? notes;
  final SyncStatus syncStatus;

  const StudentReport({
    required this.id,
    required this.reportId,
    required this.studentId,
    required this.studentName,
    required this.attendanceStatus,
    this.recitations = const [],
    this.notes,
    this.syncStatus = SyncStatus.synced,
  });

  factory StudentReport.fromJson(Map<String, dynamic> json) {
    return StudentReport(
      id: json['id'] as String,
      reportId: json['report_id'] as String,
      studentId: json['student_id'] as String,
      studentName: json['student_name'] as String,
      attendanceStatus: AttendanceStatus.values.firstWhere(
        (e) => e.name == json['attendance_status'],
        orElse: () => AttendanceStatus.absent,
      ),
      recitations: (json['recitations'] as List<dynamic>?)
          ?.map((e) => Recitation.fromJson(e as Map<String, dynamic>))
          .toList() ?? [],
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'report_id': reportId,
      'student_id': studentId,
      'student_name': studentName,
      'attendance_status': attendanceStatus.name,
      'recitations': recitations.map((e) => e.toJson()).toList(),
      'notes': notes,
    };
  }

  StudentReport copyWith({
    String? id,
    String? reportId,
    String? studentId,
    String? studentName,
    AttendanceStatus? attendanceStatus,
    List<Recitation>? recitations,
    String? notes,
    SyncStatus? syncStatus,
  }) {
    return StudentReport(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      studentId: studentId ?? this.studentId,
      studentName: studentName ?? this.studentName,
      attendanceStatus: attendanceStatus ?? this.attendanceStatus,
      recitations: recitations ?? this.recitations,
      notes: notes ?? this.notes,
      syncStatus: syncStatus ?? this.syncStatus,
    );
  }

  @override
  List<Object?> get props => [
        id,
        reportId,
        studentId,
        studentName,
        attendanceStatus,
        recitations,
        notes,
      ];
}

/// Recitation - individual recitation record
class Recitation extends Equatable {
  final String id;
  final String studentReportId;
  final RecitationType type;
  final int surahNumber;
  final String surahName;
  final int fromVerse;
  final int toVerse;
  final int? rating; // Optional rating 1-10
  final String? notes;

  const Recitation({
    required this.id,
    required this.studentReportId,
    required this.type,
    required this.surahNumber,
    required this.surahName,
    required this.fromVerse,
    required this.toVerse,
    this.rating,
    this.notes,
  });

  factory Recitation.fromJson(Map<String, dynamic> json) {
    return Recitation(
      id: json['id'] as String,
      studentReportId: json['student_report_id'] as String,
      type: RecitationType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => RecitationType.memorization,
      ),
      surahNumber: json['surah_number'] as int,
      surahName: json['surah_name'] as String,
      fromVerse: json['from_verse'] as int,
      toVerse: json['to_verse'] as int,
      rating: json['rating'] as int?,
      notes: json['notes'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student_report_id': studentReportId,
      'type': type.name,
      'surah_number': surahNumber,
      'surah_name': surahName,
      'from_verse': fromVerse,
      'to_verse': toVerse,
      'rating': rating,
      'notes': notes,
    };
  }

  Recitation copyWith({
    String? id,
    String? studentReportId,
    RecitationType? type,
    int? surahNumber,
    String? surahName,
    int? fromVerse,
    int? toVerse,
    int? rating,
    String? notes,
  }) {
    return Recitation(
      id: id ?? this.id,
      studentReportId: studentReportId ?? this.studentReportId,
      type: type ?? this.type,
      surahNumber: surahNumber ?? this.surahNumber,
      surahName: surahName ?? this.surahName,
      fromVerse: fromVerse ?? this.fromVerse,
      toVerse: toVerse ?? this.toVerse,
      rating: rating ?? this.rating,
      notes: notes ?? this.notes,
    );
  }

  /// Get display string for verses
  String get versesDisplay => 'من الآية $fromVerse إلى الآية $toVerse';

  /// Get full display string
  String get fullDisplay => '${type.arabicName}: $surahName ($versesDisplay)';

  @override
  List<Object?> get props => [
        id,
        studentReportId,
        type,
        surahNumber,
        surahName,
        fromVerse,
        toVerse,
        rating,
        notes,
      ];
}
