import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import '../../models/user.dart' as models;
import '../../models/halqa.dart' as models;
import '../../models/student.dart' as models;
import '../../models/report.dart' as models;
import '../../models/center.dart' as models;
import '../../models/course.dart' as models;
import '../../models/announcement.dart' as models;
import '../../../core/constants/app_constants.dart';


part 'database.g.dart';

// ==================== TABLE DEFINITIONS ====================

/// Users table
class UsersTable extends Table {
  @override
  String get tableName => 'users';
  
  TextColumn get id => text()();
  TextColumn get username => text().unique()();
  TextColumn get passwordHash => text()();
  TextColumn get fullName => text()();
  TextColumn get email => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get role => text()();
  TextColumn get centerId => text().nullable()();
  TextColumn get halqaId => text().nullable()();
  TextColumn get profileImage => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isBlocked => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Centers table
class CentersTable extends Table {
  @override
  String get tableName => 'centers';
  
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get logo => text().nullable()();
  TextColumn get address => text().nullable()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get managerId => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Halqat (Circles) table
class HalqatTable extends Table {
  @override
  String get tableName => 'halqat';
  
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get centerId => text()();
  TextColumn get teacherId => text().nullable()();
  TextColumn get teacherName => text().nullable()();
  TextColumn get category => text()();
  IntColumn get studentCount => integer().withDefault(const Constant(0))();
  IntColumn get maxStudents => integer().withDefault(const Constant(30))();
  TextColumn get description => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Students table
class StudentsTable extends Table {
  @override
  String get tableName => 'students';
  
  TextColumn get id => text()();
  TextColumn get fullName => text()();
  TextColumn get halqaId => text()();
  TextColumn get centerId => text()();
  TextColumn get parentName => text()();
  TextColumn get parentPhone => text()();
  TextColumn get parentId => text().nullable()();
  TextColumn get parentJob => text().nullable()();
  TextColumn get currentResidence => text().nullable()();
  TextColumn get previousResidence => text().nullable()();
  TextColumn get governorate => text().nullable()();
  IntColumn get age => integer().nullable()();
  DateTimeColumn get birthDate => dateTime().nullable()();
  DateTimeColumn get enrollmentDate => dateTime()();
  TextColumn get phone => text().nullable()();
  TextColumn get profileImage => text().nullable()();
  TextColumn get previousMemorization => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get studentUserId => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  BoolColumn get isBlocked => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Daily Reports table
class DailyReportsTable extends Table {
  @override
  String get tableName => 'daily_reports';
  
  TextColumn get id => text()();
  TextColumn get halqaId => text()();
  TextColumn get teacherId => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  TextColumn get reviewedBy => text().nullable()();
  TextColumn get reviewNotes => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Student Reports table
class StudentReportsTable extends Table {
  @override
  String get tableName => 'student_reports';
  
  TextColumn get id => text()();
  TextColumn get reportId => text()();
  TextColumn get studentId => text()();
  TextColumn get studentName => text()();
  TextColumn get attendanceStatus => text()();
  TextColumn get notes => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Recitations table
class RecitationsTable extends Table {
  @override
  String get tableName => 'recitations';
  
  TextColumn get id => text()();
  TextColumn get studentReportId => text()();
  TextColumn get type => text()();
  IntColumn get surahNumber => integer()();
  TextColumn get surahName => text()();
  IntColumn get fromVerse => integer()();
  IntColumn get toVerse => integer()();
  IntColumn get rating => integer().nullable()();
  TextColumn get notes => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Courses table
class CoursesTable extends Table {
  @override
  String get tableName => 'courses';
  
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get centerId => text()();
  TextColumn get responsibleTeacherId => text().nullable()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime()();
  TextColumn get targetHalqaIds => text().withDefault(const Constant('[]'))();
  TextColumn get targetStudentIds => text().withDefault(const Constant('[]'))();
  TextColumn get notes => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Activities table
class ActivitiesTable extends Table {
  @override
  String get tableName => 'activities';
  
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get image => text().nullable()();
  TextColumn get centerId => text()();
  TextColumn get location => text().nullable()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  TextColumn get targetHalqaIds => text().withDefault(const Constant('[]'))();
  TextColumn get notes => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Fees table
class FeesTable extends Table {
  @override
  String get tableName => 'fees';
  
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get centerId => text()();
  IntColumn get month => integer()();
  IntColumn get day => integer()();
  RealColumn get amount => real()();
  TextColumn get targetHalqaIds => text().withDefault(const Constant('[]'))();
  TextColumn get notes => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Fee Payments table
class FeePaymentsTable extends Table {
  @override
  String get tableName => 'fee_payments';
  
  TextColumn get id => text()();
  TextColumn get feeId => text()();
  TextColumn get studentId => text()();
  TextColumn get halqaId => text()();
  TextColumn get status => text().withDefault(const Constant('unpaid'))();
  RealColumn get paidAmount => real().nullable()();
  DateTimeColumn get paidAt => dateTime().nullable()();
  TextColumn get confirmedBy => text().nullable()();
  TextColumn get notes => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Holidays table
class HolidaysTable extends Table {
  @override
  String get tableName => 'holidays';
  
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get centerId => text()();
  DateTimeColumn get startDate => dateTime()();
  DateTimeColumn get endDate => dateTime().nullable()();
  TextColumn get targetHalqaIds => text().withDefault(const Constant('[]'))();
  BoolColumn get isRecurring => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('approved'))();
  TextColumn get requestedBy => text().nullable()();
  TextColumn get approvedBy => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// Announcements table
class AnnouncementsTable extends Table {
  @override
  String get tableName => 'announcements';
  
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  TextColumn get image => text().nullable()();
  TextColumn get centerId => text()();
  TextColumn get createdBy => text()();
  TextColumn get scope => text().withDefault(const Constant('all'))();
  TextColumn get targetHalqaIds => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
  TextColumn get syncStatus => text().withDefault(const Constant('synced'))();
  
  @override
  Set<Column> get primaryKey => {id};
}

/// App Settings table
class AppSettingsTable extends Table {
  @override
  String get tableName => 'app_settings';
  
  TextColumn get key => text()();
  TextColumn get value => text()();
  TextColumn get centerId => text().nullable()();
  
  @override
  Set<Column> get primaryKey => {key, centerId};
}

// ==================== DATABASE CLASS ====================

@DriftDatabase(tables: [
  UsersTable,
  CentersTable,
  HalqatTable,
  StudentsTable,
  DailyReportsTable,
  StudentReportsTable,
  RecitationsTable,
  CoursesTable,
  ActivitiesTable,
  FeesTable,
  FeePaymentsTable,
  HolidaysTable,
  AnnouncementsTable,
  AppSettingsTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  
  @override
  int get schemaVersion => 1;
  
  /// Create default admin user if none exists
  Future<void> createDefaultAdminIfNeeded() async {
    // Check if admin user already exists
    final existingAdmin = await (select(usersTable)
      ..where((u) => u.username.equals('admin')))
      .getSingleOrNull();
    
    if (existingAdmin != null) {
      debugPrint('Admin user already exists');
      return;
    }
    
    // Create default admin user
    final now = DateTime.now();
    await into(usersTable).insert(UsersTableCompanion.insert(
      id: 'admin-default-001',
      username: 'admin',
      passwordHash: _hashPassword('admin123'),
      fullName: 'مسؤول النظام',
      email: const Value('admin@quran-center.com'),
      phone: const Value(null),
      role: 'systemAdmin',
      centerId: const Value(null),
      halqaId: const Value(null),
      profileImage: const Value(null),
      isActive: const Value(true),
      isBlocked: const Value(false),
      createdAt: now,
      updatedAt: now,
      syncStatus: const Value('synced'),
    ));
    
    debugPrint('Default admin user created: username=admin, password=admin123');
  }
  
  /// Create default center "الإمام حفص" if no centers exist
  Future<void> createDefaultCenterIfNeeded() async {
    // Check if any centers exist
    final existingCenters = await select(centersTable).get();
    
    if (existingCenters.isNotEmpty) {
      debugPrint('Centers already exist: ${existingCenters.length}');
      return;
    }
    
    // Create default center
    final now = DateTime.now();
    await into(centersTable).insert(CentersTableCompanion.insert(
      id: 'center-imam-hafs-001',
      name: 'مركز الإمام حفص',
      description: const Value('مركز تحفيظ القرآن الكريم'),
      logo: const Value(null),
      address: const Value(null),
      phone: const Value(null),
      email: const Value(null),
      managerId: const Value(null),
      isActive: const Value(true),
      createdAt: now,
      updatedAt: now,
    ));
    
    debugPrint('Default center created: مركز الإمام حفص');
  }
  
  // ==================== USER OPERATIONS ====================
  
  /// Hash password
  String _hashPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
  
  /// Authenticate user
  Future<models.User?> authenticateUser(String username, String password) async {
    final passwordHash = _hashPassword(password);
    final result = await (select(usersTable)
      ..where((u) => u.username.equals(username) & u.passwordHash.equals(passwordHash)))
      .getSingleOrNull();
    
    if (result == null) return null;
    
    return _userFromRow(result);
  }
  
  /// Get user by ID
  Future<models.User?> getUserById(String id) async {
    final result = await (select(usersTable)..where((u) => u.id.equals(id)))
        .getSingleOrNull();
    return result != null ? _userFromRow(result) : null;
  }
  
  /// Get user by username
  Future<models.User?> getUserByUsername(String username) async {
    final result = await (select(usersTable)..where((u) => u.username.equals(username)))
        .getSingleOrNull();
    return result != null ? _userFromRow(result) : null;
  }
  
  /// Insert user
  Future<void> insertUser(models.User user, String password) async {
    await into(usersTable).insert(UsersTableCompanion.insert(
      id: user.id,
      username: user.username,
      passwordHash: _hashPassword(password),
      fullName: user.fullName,
      email: Value(user.email),
      phone: Value(user.phone),
      role: user.role.name,
      centerId: Value(user.centerId),
      halqaId: Value(user.halqaId),
      profileImage: Value(user.profileImage),
      isActive: Value(user.isActive),
      isBlocked: Value(user.isBlocked),
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
      syncStatus: Value(user.syncStatus.name),
    ));
  }
  
  /// Update user password
  Future<void> updateUserPassword(String userId, String newPassword) async {
    await (update(usersTable)..where((u) => u.id.equals(userId)))
        .write(UsersTableCompanion(
          passwordHash: Value(_hashPassword(newPassword)),
          updatedAt: Value(DateTime.now()),
        ));
  }
  
  /// Set user blocked status
  Future<void> setUserBlocked(String userId, bool blocked) async {
    await (update(usersTable)..where((u) => u.id.equals(userId)))
        .write(UsersTableCompanion(
          isBlocked: Value(blocked),
          updatedAt: Value(DateTime.now()),
        ));
  }
  
  /// Delete user
  Future<void> deleteUser(String userId) async {
    await (delete(usersTable)..where((u) => u.id.equals(userId))).go();
  }
  
  /// Get all users by role
  Future<List<models.User>> getUsersByRole(UserRole role, {String? centerId}) async {
    var query = select(usersTable)..where((u) => u.role.equals(role.name));
    if (centerId != null) {
      query = query..where((u) => u.centerId.equals(centerId));
    }
    final results = await query.get();
    return results.map(_userFromRow).toList();
  }
  
  models.User _userFromRow(UsersTableData row) {
    return models.User(
      id: row.id,
      username: row.username,
      fullName: row.fullName,
      email: row.email,
      phone: row.phone,
      role: UserRole.values.firstWhere((e) => e.name == row.role),
      centerId: row.centerId,
      halqaId: row.halqaId,
      profileImage: row.profileImage,
      isActive: row.isActive,
      isBlocked: row.isBlocked,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      syncStatus: SyncStatus.values.firstWhere((e) => e.name == row.syncStatus),
    );
  }
  
  // ==================== HALQA OPERATIONS ====================
  
  /// Get all halqat for a center
  Future<List<models.Halqa>> getHalqat({String? centerId}) async {
    var query = select(halqatTable);
    if (centerId != null) {
      query = query..where((h) => h.centerId.equals(centerId));
    }
    final results = await query.get();
    return results.map(_halqaFromRow).toList();
  }
  
  /// Insert halqa
  Future<void> insertHalqa(models.Halqa halqa) async {
    await into(halqatTable).insert(HalqatTableCompanion.insert(
      id: halqa.id,
      name: halqa.name,
      centerId: halqa.centerId,
      teacherId: Value(halqa.teacherId),
      teacherName: Value(halqa.teacherName),
      category: halqa.category.name,
      studentCount: Value(halqa.studentCount),
      maxStudents: Value(halqa.maxStudents),
      description: Value(halqa.description),
      isActive: Value(halqa.isActive),
      createdAt: halqa.createdAt,
      updatedAt: halqa.updatedAt,
    ));
  }
  
  models.Halqa _halqaFromRow(HalqatTableData row) {
    return models.Halqa(
      id: row.id,
      name: row.name,
      centerId: row.centerId,
      teacherId: row.teacherId,
      teacherName: row.teacherName,
      category: HalqaCategory.values.firstWhere((e) => e.name == row.category),
      studentCount: row.studentCount,
      maxStudents: row.maxStudents,
      description: row.description,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }
  
  // ==================== HALQA UPDATE/DELETE ====================
  
  /// Update a halqa
  Future<void> updateHalqa(models.Halqa halqa) async {
    await (update(halqatTable)..where((h) => h.id.equals(halqa.id)))
        .write(HalqatTableCompanion(
          name: Value(halqa.name),
          category: Value(halqa.category.name),
          teacherId: Value(halqa.teacherId),
          teacherName: Value(halqa.teacherName),
          description: Value(halqa.description),
          maxStudents: Value(halqa.maxStudents),
          isActive: Value(halqa.isActive),
          updatedAt: Value(DateTime.now()),
        ));
  }
  
  /// Delete a halqa
  Future<void> deleteHalqa(String halqaId) async {
    await (delete(halqatTable)..where((h) => h.id.equals(halqaId))).go();
  }
  
  // ==================== STUDENT OPERATIONS ====================
  
  /// Get students by halqa
  Future<List<models.Student>> getStudentsByHalqa(String halqaId) async {
    final results = await (select(studentsTable)
      ..where((s) => s.halqaId.equals(halqaId)))
      .get();
    return results.map(_studentFromRow).toList();
  }
  
  /// Get all students for a center
  Future<List<models.Student>> getStudents({String? centerId, String? halqaId}) async {
    var query = select(studentsTable);
    if (centerId != null) {
      query = query..where((s) => s.centerId.equals(centerId));
    }
    if (halqaId != null) {
      query = query..where((s) => s.halqaId.equals(halqaId));
    }
    final results = await query.get();
    return results.map(_studentFromRow).toList();
  }
  
  /// Insert student
  Future<void> insertStudent(models.Student student) async {
    await into(studentsTable).insert(StudentsTableCompanion.insert(
      id: student.id,
      fullName: student.fullName,
      halqaId: student.halqaId,
      centerId: student.centerId,
      parentName: student.parentName,
      parentPhone: student.parentPhone,
      parentId: Value(student.parentId),
      parentJob: Value(student.parentJob),
      currentResidence: Value(student.currentResidence),
      previousResidence: Value(student.previousResidence),
      governorate: Value(student.governorate),
      age: Value(student.age),
      birthDate: Value(student.birthDate),
      enrollmentDate: student.enrollmentDate,
      phone: Value(student.phone),
      profileImage: Value(student.profileImage),
      previousMemorization: Value(student.previousMemorization),
      notes: Value(student.notes),
      studentUserId: Value(student.studentUserId),
      isActive: Value(student.isActive),
      isBlocked: Value(student.isBlocked),
      createdAt: student.createdAt,
      updatedAt: student.updatedAt,
    ));
  }
  
  models.Student _studentFromRow(StudentsTableData row) {
    return models.Student(
      id: row.id,
      fullName: row.fullName,
      halqaId: row.halqaId,
      centerId: row.centerId,
      parentName: row.parentName,
      parentPhone: row.parentPhone,
      parentId: row.parentId,
      parentJob: row.parentJob,
      currentResidence: row.currentResidence,
      previousResidence: row.previousResidence,
      governorate: row.governorate,
      age: row.age,
      birthDate: row.birthDate,
      enrollmentDate: row.enrollmentDate,
      phone: row.phone,
      profileImage: row.profileImage,
      previousMemorization: row.previousMemorization,
      notes: row.notes,
      studentUserId: row.studentUserId,
      isActive: row.isActive,
      isBlocked: row.isBlocked,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      syncStatus: SyncStatus.synced,
    );
  }
  
  /// Delete student
  Future<void> deleteStudent(String studentId) async {
    await (delete(studentsTable)..where((s) => s.id.equals(studentId))).go();
  }
  
  // ==================== STATISTICS ====================
  
  /// Get total students count
  Future<int> getTotalStudentsCount({String? centerId}) async {
    if (centerId != null) {
      final result = await customSelect(
        'SELECT COUNT(*) as count FROM students WHERE center_id = ?',
        variables: [Variable.withString(centerId)],
      ).getSingle();
      return result.read<int>('count');
    }
    final result = await customSelect(
      'SELECT COUNT(*) as count FROM students',
    ).getSingle();
    return result.read<int>('count');
  }
  
  /// Get total halqat count
  Future<int> getTotalHalqatCount({String? centerId}) async {
    if (centerId != null) {
      final result = await customSelect(
        'SELECT COUNT(*) as count FROM halqat WHERE center_id = ?',
        variables: [Variable.withString(centerId)],
      ).getSingle();
      return result.read<int>('count');
    }
    final result = await customSelect(
      'SELECT COUNT(*) as count FROM halqat',
    ).getSingle();
    return result.read<int>('count');
  }
  
  // ==================== CENTER OPERATIONS ====================
  
  /// Get center by ID
  Future<models.Center?> getCenterById(String id) async {
    final row = await (select(centersTable)..where((c) => c.id.equals(id))).getSingleOrNull();
    if (row == null) return null;
    
    return models.Center(
      id: row.id,
      name: row.name,
      description: row.description,
      logo: row.logo,
      address: row.address,
      phone: row.phone,
      email: row.email,
      managerId: row.managerId,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      syncStatus: SyncStatus.values.firstWhere((e) => e.name == row.syncStatus, orElse: () => SyncStatus.synced),
    );
  }

  /// Get all centers
  Future<List<models.Center>> getAllCenters() async {
    final results = await select(centersTable).get();
    return results.map((row) => models.Center(
      id: row.id,
      name: row.name,
      description: row.description,
      logo: row.logo,
      address: row.address,
      phone: row.phone,
      email: row.email,
      managerId: row.managerId,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      syncStatus: SyncStatus.values.firstWhere((e) => e.name == row.syncStatus, orElse: () => SyncStatus.synced),
    )).toList();
  }
  
  /// Insert center
  Future<void> insertCenter(models.Center center) async {
    await into(centersTable).insert(CentersTableCompanion.insert(
      id: center.id,
      name: center.name,
      description: Value(center.description),
      logo: Value(center.logo),
      address: Value(center.address),
      phone: Value(center.phone),
      email: Value(center.email),
      managerId: Value(center.managerId),
      isActive: Value(center.isActive),
      createdAt: center.createdAt,
      updatedAt: center.updatedAt,
    ));
  }
  
  /// Update center
  Future<void> updateCenter(models.Center center) async {
    await (update(centersTable)..where((c) => c.id.equals(center.id)))
        .write(CentersTableCompanion(
          name: Value(center.name),
          description: Value(center.description),
          logo: Value(center.logo),
          address: Value(center.address),
          phone: Value(center.phone),
          email: Value(center.email),
          managerId: Value(center.managerId),
          isActive: Value(center.isActive),
          updatedAt: Value(DateTime.now()),
        ));
  }
  
  /// Delete center
  Future<void> deleteCenter(String centerId) async {
    await (delete(centersTable)..where((c) => c.id.equals(centerId))).go();
  }
  
  // ==================== ALL USERS OPERATIONS ====================
  
  /// Get all users
  Future<List<models.User>> getAllUsers() async {
    final results = await select(usersTable).get();
    return results.map(_userFromRow).toList();
  }
  
  // ==================== COURSE OPERATIONS ====================
  
  /// Get all courses
  Future<List<models.Course>> getAllCourses({String? centerId}) async {
    var query = select(coursesTable);
    if (centerId != null) {
      query = query..where((c) => c.centerId.equals(centerId));
    }
    final results = await query.get();
    return results.map((row) => models.Course(
      id: row.id,
      name: row.name,
      description: row.description,
      image: row.image,
      centerId: row.centerId,
      responsibleTeacherId: row.responsibleTeacherId,
      startDate: row.startDate,
      endDate: row.endDate,
      targetHalqaIds: (row.targetHalqaIds.isNotEmpty) ? List<String>.from(json.decode(row.targetHalqaIds)) : [],
      targetStudentIds: (row.targetStudentIds.isNotEmpty) ? List<String>.from(json.decode(row.targetStudentIds)) : [],
      notes: row.notes,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      syncStatus: SyncStatus.values.firstWhere((e) => e.name == row.syncStatus, orElse: () => SyncStatus.synced),
    )).toList();
  }
  
  /// Insert course
  Future<void> insertCourse(models.Course course) async {
    await into(coursesTable).insert(CoursesTableCompanion.insert(
      id: course.id,
      name: course.name,
      description: Value(course.description),
      image: Value(course.image),
      centerId: course.centerId,
      responsibleTeacherId: Value(course.responsibleTeacherId),
      startDate: course.startDate,
      endDate: course.endDate,
      targetHalqaIds: Value(json.encode(course.targetHalqaIds)),
      targetStudentIds: Value(json.encode(course.targetStudentIds)),
      notes: Value(course.notes),
      isActive: Value(course.isActive),
      createdAt: course.createdAt,
      updatedAt: course.updatedAt,
    ));
  }
  
  /// Delete course
  Future<void> deleteCourse(String courseId) async {
    await (delete(coursesTable)..where((c) => c.id.equals(courseId))).go();
  }
  
  // ==================== ANNOUNCEMENT OPERATIONS ====================
  
  /// Get all announcements
  Future<List<models.Announcement>> getAllAnnouncements({String? centerId}) async {
    var query = select(announcementsTable);
    if (centerId != null) {
      query = query..where((a) => a.centerId.equals(centerId));
    }
    final results = await query.get();
    return results.map((row) => models.Announcement(
      id: row.id,
      title: row.title,
      content: row.content,
      image: row.image,
      centerId: row.centerId,
      createdBy: row.createdBy,
      scope: models.AnnouncementScope.values.firstWhere((e) => e.name == row.scope, orElse: () => models.AnnouncementScope.all),
      targetHalqaIds: row.targetHalqaIds != null ? List<String>.from(json.decode(row.targetHalqaIds!)) : null,
      isActive: row.isActive,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      syncStatus: SyncStatus.values.firstWhere((e) => e.name == row.syncStatus, orElse: () => SyncStatus.synced),
    )).toList();
  }
  
  /// Insert announcement
  Future<void> insertAnnouncement(models.Announcement announcement) async {
    await into(announcementsTable).insert(AnnouncementsTableCompanion.insert(
      id: announcement.id,
      title: announcement.title,
      content: announcement.content,
      image: Value(announcement.image),
      centerId: announcement.centerId,
      createdBy: announcement.createdBy,
      scope: Value(announcement.scope.name),
      targetHalqaIds: Value(announcement.targetHalqaIds != null ? json.encode(announcement.targetHalqaIds) : null),
      isActive: Value(announcement.isActive),
      createdAt: announcement.createdAt,
      updatedAt: announcement.updatedAt,
    ));
  }
  
  /// Update announcement
  Future<void> updateAnnouncement(models.Announcement announcement) async {
    await (update(announcementsTable)..where((a) => a.id.equals(announcement.id)))
        .write(AnnouncementsTableCompanion(
          title: Value(announcement.title),
          content: Value(announcement.content),
          image: Value(announcement.image),
          scope: Value(announcement.scope.name),
          targetHalqaIds: Value(announcement.targetHalqaIds != null ? json.encode(announcement.targetHalqaIds) : null),
          isActive: Value(announcement.isActive),
          updatedAt: Value(DateTime.now()),
        ));
  }
  
  /// Delete announcement
  Future<void> deleteAnnouncement(String announcementId) async {
    await (delete(announcementsTable)..where((a) => a.id.equals(announcementId))).go();
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'quran_center_db');
}

