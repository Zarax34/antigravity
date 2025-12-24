// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTableTable extends UsersTable
    with TableInfo<$UsersTableTable, UsersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _passwordHashMeta =
      const VerificationMeta('passwordHash');
  @override
  late final GeneratedColumn<String> passwordHash = GeneratedColumn<String>(
      'password_hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
      'role', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _centerIdMeta =
      const VerificationMeta('centerId');
  @override
  late final GeneratedColumn<String> centerId = GeneratedColumn<String>(
      'center_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _halqaIdMeta =
      const VerificationMeta('halqaId');
  @override
  late final GeneratedColumn<String> halqaId = GeneratedColumn<String>(
      'halqa_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<String> profileImage = GeneratedColumn<String>(
      'profile_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _isBlockedMeta =
      const VerificationMeta('isBlocked');
  @override
  late final GeneratedColumn<bool> isBlocked = GeneratedColumn<bool>(
      'is_blocked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_blocked" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        username,
        passwordHash,
        fullName,
        email,
        phone,
        role,
        centerId,
        halqaId,
        profileImage,
        isActive,
        isBlocked,
        createdAt,
        updatedAt,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UsersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password_hash')) {
      context.handle(
          _passwordHashMeta,
          passwordHash.isAcceptableOrUnknown(
              data['password_hash']!, _passwordHashMeta));
    } else if (isInserting) {
      context.missing(_passwordHashMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('center_id')) {
      context.handle(_centerIdMeta,
          centerId.isAcceptableOrUnknown(data['center_id']!, _centerIdMeta));
    }
    if (data.containsKey('halqa_id')) {
      context.handle(_halqaIdMeta,
          halqaId.isAcceptableOrUnknown(data['halqa_id']!, _halqaIdMeta));
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('is_blocked')) {
      context.handle(_isBlockedMeta,
          isBlocked.isAcceptableOrUnknown(data['is_blocked']!, _isBlockedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UsersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UsersTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      passwordHash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password_hash'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      role: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}role'])!,
      centerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_id']),
      halqaId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}halqa_id']),
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_image']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      isBlocked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_blocked'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $UsersTableTable createAlias(String alias) {
    return $UsersTableTable(attachedDatabase, alias);
  }
}

class UsersTableData extends DataClass implements Insertable<UsersTableData> {
  final String id;
  final String username;
  final String passwordHash;
  final String fullName;
  final String? email;
  final String? phone;
  final String role;
  final String? centerId;
  final String? halqaId;
  final String? profileImage;
  final bool isActive;
  final bool isBlocked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const UsersTableData(
      {required this.id,
      required this.username,
      required this.passwordHash,
      required this.fullName,
      this.email,
      this.phone,
      required this.role,
      this.centerId,
      this.halqaId,
      this.profileImage,
      required this.isActive,
      required this.isBlocked,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['username'] = Variable<String>(username);
    map['password_hash'] = Variable<String>(passwordHash);
    map['full_name'] = Variable<String>(fullName);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    map['role'] = Variable<String>(role);
    if (!nullToAbsent || centerId != null) {
      map['center_id'] = Variable<String>(centerId);
    }
    if (!nullToAbsent || halqaId != null) {
      map['halqa_id'] = Variable<String>(halqaId);
    }
    if (!nullToAbsent || profileImage != null) {
      map['profile_image'] = Variable<String>(profileImage);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['is_blocked'] = Variable<bool>(isBlocked);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  UsersTableCompanion toCompanion(bool nullToAbsent) {
    return UsersTableCompanion(
      id: Value(id),
      username: Value(username),
      passwordHash: Value(passwordHash),
      fullName: Value(fullName),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      role: Value(role),
      centerId: centerId == null && nullToAbsent
          ? const Value.absent()
          : Value(centerId),
      halqaId: halqaId == null && nullToAbsent
          ? const Value.absent()
          : Value(halqaId),
      profileImage: profileImage == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImage),
      isActive: Value(isActive),
      isBlocked: Value(isBlocked),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory UsersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UsersTableData(
      id: serializer.fromJson<String>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      passwordHash: serializer.fromJson<String>(json['passwordHash']),
      fullName: serializer.fromJson<String>(json['fullName']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      role: serializer.fromJson<String>(json['role']),
      centerId: serializer.fromJson<String?>(json['centerId']),
      halqaId: serializer.fromJson<String?>(json['halqaId']),
      profileImage: serializer.fromJson<String?>(json['profileImage']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isBlocked: serializer.fromJson<bool>(json['isBlocked']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'username': serializer.toJson<String>(username),
      'passwordHash': serializer.toJson<String>(passwordHash),
      'fullName': serializer.toJson<String>(fullName),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'role': serializer.toJson<String>(role),
      'centerId': serializer.toJson<String?>(centerId),
      'halqaId': serializer.toJson<String?>(halqaId),
      'profileImage': serializer.toJson<String?>(profileImage),
      'isActive': serializer.toJson<bool>(isActive),
      'isBlocked': serializer.toJson<bool>(isBlocked),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  UsersTableData copyWith(
          {String? id,
          String? username,
          String? passwordHash,
          String? fullName,
          Value<String?> email = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          String? role,
          Value<String?> centerId = const Value.absent(),
          Value<String?> halqaId = const Value.absent(),
          Value<String?> profileImage = const Value.absent(),
          bool? isActive,
          bool? isBlocked,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      UsersTableData(
        id: id ?? this.id,
        username: username ?? this.username,
        passwordHash: passwordHash ?? this.passwordHash,
        fullName: fullName ?? this.fullName,
        email: email.present ? email.value : this.email,
        phone: phone.present ? phone.value : this.phone,
        role: role ?? this.role,
        centerId: centerId.present ? centerId.value : this.centerId,
        halqaId: halqaId.present ? halqaId.value : this.halqaId,
        profileImage:
            profileImage.present ? profileImage.value : this.profileImage,
        isActive: isActive ?? this.isActive,
        isBlocked: isBlocked ?? this.isBlocked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  UsersTableData copyWithCompanion(UsersTableCompanion data) {
    return UsersTableData(
      id: data.id.present ? data.id.value : this.id,
      username: data.username.present ? data.username.value : this.username,
      passwordHash: data.passwordHash.present
          ? data.passwordHash.value
          : this.passwordHash,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      role: data.role.present ? data.role.value : this.role,
      centerId: data.centerId.present ? data.centerId.value : this.centerId,
      halqaId: data.halqaId.present ? data.halqaId.value : this.halqaId,
      profileImage: data.profileImage.present
          ? data.profileImage.value
          : this.profileImage,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isBlocked: data.isBlocked.present ? data.isBlocked.value : this.isBlocked,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableData(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('role: $role, ')
          ..write('centerId: $centerId, ')
          ..write('halqaId: $halqaId, ')
          ..write('profileImage: $profileImage, ')
          ..write('isActive: $isActive, ')
          ..write('isBlocked: $isBlocked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      username,
      passwordHash,
      fullName,
      email,
      phone,
      role,
      centerId,
      halqaId,
      profileImage,
      isActive,
      isBlocked,
      createdAt,
      updatedAt,
      syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UsersTableData &&
          other.id == this.id &&
          other.username == this.username &&
          other.passwordHash == this.passwordHash &&
          other.fullName == this.fullName &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.role == this.role &&
          other.centerId == this.centerId &&
          other.halqaId == this.halqaId &&
          other.profileImage == this.profileImage &&
          other.isActive == this.isActive &&
          other.isBlocked == this.isBlocked &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class UsersTableCompanion extends UpdateCompanion<UsersTableData> {
  final Value<String> id;
  final Value<String> username;
  final Value<String> passwordHash;
  final Value<String> fullName;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String> role;
  final Value<String?> centerId;
  final Value<String?> halqaId;
  final Value<String?> profileImage;
  final Value<bool> isActive;
  final Value<bool> isBlocked;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const UsersTableCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.passwordHash = const Value.absent(),
    this.fullName = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.role = const Value.absent(),
    this.centerId = const Value.absent(),
    this.halqaId = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isBlocked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UsersTableCompanion.insert({
    required String id,
    required String username,
    required String passwordHash,
    required String fullName,
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    required String role,
    this.centerId = const Value.absent(),
    this.halqaId = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isBlocked = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        username = Value(username),
        passwordHash = Value(passwordHash),
        fullName = Value(fullName),
        role = Value(role),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<UsersTableData> custom({
    Expression<String>? id,
    Expression<String>? username,
    Expression<String>? passwordHash,
    Expression<String>? fullName,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? role,
    Expression<String>? centerId,
    Expression<String>? halqaId,
    Expression<String>? profileImage,
    Expression<bool>? isActive,
    Expression<bool>? isBlocked,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (passwordHash != null) 'password_hash': passwordHash,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (role != null) 'role': role,
      if (centerId != null) 'center_id': centerId,
      if (halqaId != null) 'halqa_id': halqaId,
      if (profileImage != null) 'profile_image': profileImage,
      if (isActive != null) 'is_active': isActive,
      if (isBlocked != null) 'is_blocked': isBlocked,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UsersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? username,
      Value<String>? passwordHash,
      Value<String>? fullName,
      Value<String?>? email,
      Value<String?>? phone,
      Value<String>? role,
      Value<String?>? centerId,
      Value<String?>? halqaId,
      Value<String?>? profileImage,
      Value<bool>? isActive,
      Value<bool>? isBlocked,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return UsersTableCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      passwordHash: passwordHash ?? this.passwordHash,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
      centerId: centerId ?? this.centerId,
      halqaId: halqaId ?? this.halqaId,
      profileImage: profileImage ?? this.profileImage,
      isActive: isActive ?? this.isActive,
      isBlocked: isBlocked ?? this.isBlocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (passwordHash.present) {
      map['password_hash'] = Variable<String>(passwordHash.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (centerId.present) {
      map['center_id'] = Variable<String>(centerId.value);
    }
    if (halqaId.present) {
      map['halqa_id'] = Variable<String>(halqaId.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isBlocked.present) {
      map['is_blocked'] = Variable<bool>(isBlocked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersTableCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('passwordHash: $passwordHash, ')
          ..write('fullName: $fullName, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('role: $role, ')
          ..write('centerId: $centerId, ')
          ..write('halqaId: $halqaId, ')
          ..write('profileImage: $profileImage, ')
          ..write('isActive: $isActive, ')
          ..write('isBlocked: $isBlocked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CentersTableTable extends CentersTable
    with TableInfo<$CentersTableTable, CentersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CentersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _logoMeta = const VerificationMeta('logo');
  @override
  late final GeneratedColumn<String> logo = GeneratedColumn<String>(
      'logo', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _managerIdMeta =
      const VerificationMeta('managerId');
  @override
  late final GeneratedColumn<String> managerId = GeneratedColumn<String>(
      'manager_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        logo,
        address,
        phone,
        email,
        managerId,
        isActive,
        createdAt,
        updatedAt,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'centers';
  @override
  VerificationContext validateIntegrity(Insertable<CentersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('logo')) {
      context.handle(
          _logoMeta, logo.isAcceptableOrUnknown(data['logo']!, _logoMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('manager_id')) {
      context.handle(_managerIdMeta,
          managerId.isAcceptableOrUnknown(data['manager_id']!, _managerIdMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CentersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CentersTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      logo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      managerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}manager_id']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $CentersTableTable createAlias(String alias) {
    return $CentersTableTable(attachedDatabase, alias);
  }
}

class CentersTableData extends DataClass
    implements Insertable<CentersTableData> {
  final String id;
  final String name;
  final String? description;
  final String? logo;
  final String? address;
  final String? phone;
  final String? email;
  final String? managerId;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const CentersTableData(
      {required this.id,
      required this.name,
      this.description,
      this.logo,
      this.address,
      this.phone,
      this.email,
      this.managerId,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || logo != null) {
      map['logo'] = Variable<String>(logo);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || managerId != null) {
      map['manager_id'] = Variable<String>(managerId);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  CentersTableCompanion toCompanion(bool nullToAbsent) {
    return CentersTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      logo: logo == null && nullToAbsent ? const Value.absent() : Value(logo),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      managerId: managerId == null && nullToAbsent
          ? const Value.absent()
          : Value(managerId),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory CentersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CentersTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      logo: serializer.fromJson<String?>(json['logo']),
      address: serializer.fromJson<String?>(json['address']),
      phone: serializer.fromJson<String?>(json['phone']),
      email: serializer.fromJson<String?>(json['email']),
      managerId: serializer.fromJson<String?>(json['managerId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'logo': serializer.toJson<String?>(logo),
      'address': serializer.toJson<String?>(address),
      'phone': serializer.toJson<String?>(phone),
      'email': serializer.toJson<String?>(email),
      'managerId': serializer.toJson<String?>(managerId),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  CentersTableData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> logo = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> managerId = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      CentersTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        logo: logo.present ? logo.value : this.logo,
        address: address.present ? address.value : this.address,
        phone: phone.present ? phone.value : this.phone,
        email: email.present ? email.value : this.email,
        managerId: managerId.present ? managerId.value : this.managerId,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  CentersTableData copyWithCompanion(CentersTableCompanion data) {
    return CentersTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      logo: data.logo.present ? data.logo.value : this.logo,
      address: data.address.present ? data.address.value : this.address,
      phone: data.phone.present ? data.phone.value : this.phone,
      email: data.email.present ? data.email.value : this.email,
      managerId: data.managerId.present ? data.managerId.value : this.managerId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CentersTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('logo: $logo, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('managerId: $managerId, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description, logo, address, phone,
      email, managerId, isActive, createdAt, updatedAt, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CentersTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.logo == this.logo &&
          other.address == this.address &&
          other.phone == this.phone &&
          other.email == this.email &&
          other.managerId == this.managerId &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class CentersTableCompanion extends UpdateCompanion<CentersTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> logo;
  final Value<String?> address;
  final Value<String?> phone;
  final Value<String?> email;
  final Value<String?> managerId;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const CentersTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.logo = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.managerId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CentersTableCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.logo = const Value.absent(),
    this.address = const Value.absent(),
    this.phone = const Value.absent(),
    this.email = const Value.absent(),
    this.managerId = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<CentersTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? logo,
    Expression<String>? address,
    Expression<String>? phone,
    Expression<String>? email,
    Expression<String>? managerId,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (logo != null) 'logo': logo,
      if (address != null) 'address': address,
      if (phone != null) 'phone': phone,
      if (email != null) 'email': email,
      if (managerId != null) 'manager_id': managerId,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CentersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? logo,
      Value<String?>? address,
      Value<String?>? phone,
      Value<String?>? email,
      Value<String?>? managerId,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return CentersTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      logo: logo ?? this.logo,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      managerId: managerId ?? this.managerId,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (logo.present) {
      map['logo'] = Variable<String>(logo.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (managerId.present) {
      map['manager_id'] = Variable<String>(managerId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CentersTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('logo: $logo, ')
          ..write('address: $address, ')
          ..write('phone: $phone, ')
          ..write('email: $email, ')
          ..write('managerId: $managerId, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HalqatTableTable extends HalqatTable
    with TableInfo<$HalqatTableTable, HalqatTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HalqatTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _centerIdMeta =
      const VerificationMeta('centerId');
  @override
  late final GeneratedColumn<String> centerId = GeneratedColumn<String>(
      'center_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _teacherIdMeta =
      const VerificationMeta('teacherId');
  @override
  late final GeneratedColumn<String> teacherId = GeneratedColumn<String>(
      'teacher_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _teacherNameMeta =
      const VerificationMeta('teacherName');
  @override
  late final GeneratedColumn<String> teacherName = GeneratedColumn<String>(
      'teacher_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _studentCountMeta =
      const VerificationMeta('studentCount');
  @override
  late final GeneratedColumn<int> studentCount = GeneratedColumn<int>(
      'student_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _maxStudentsMeta =
      const VerificationMeta('maxStudents');
  @override
  late final GeneratedColumn<int> maxStudents = GeneratedColumn<int>(
      'max_students', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(30));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
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
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'halqat';
  @override
  VerificationContext validateIntegrity(Insertable<HalqatTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('center_id')) {
      context.handle(_centerIdMeta,
          centerId.isAcceptableOrUnknown(data['center_id']!, _centerIdMeta));
    } else if (isInserting) {
      context.missing(_centerIdMeta);
    }
    if (data.containsKey('teacher_id')) {
      context.handle(_teacherIdMeta,
          teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta));
    }
    if (data.containsKey('teacher_name')) {
      context.handle(
          _teacherNameMeta,
          teacherName.isAcceptableOrUnknown(
              data['teacher_name']!, _teacherNameMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('student_count')) {
      context.handle(
          _studentCountMeta,
          studentCount.isAcceptableOrUnknown(
              data['student_count']!, _studentCountMeta));
    }
    if (data.containsKey('max_students')) {
      context.handle(
          _maxStudentsMeta,
          maxStudents.isAcceptableOrUnknown(
              data['max_students']!, _maxStudentsMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HalqatTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HalqatTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      centerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_id'])!,
      teacherId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}teacher_id']),
      teacherName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}teacher_name']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      studentCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}student_count'])!,
      maxStudents: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_students'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $HalqatTableTable createAlias(String alias) {
    return $HalqatTableTable(attachedDatabase, alias);
  }
}

class HalqatTableData extends DataClass implements Insertable<HalqatTableData> {
  final String id;
  final String name;
  final String centerId;
  final String? teacherId;
  final String? teacherName;
  final String category;
  final int studentCount;
  final int maxStudents;
  final String? description;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const HalqatTableData(
      {required this.id,
      required this.name,
      required this.centerId,
      this.teacherId,
      this.teacherName,
      required this.category,
      required this.studentCount,
      required this.maxStudents,
      this.description,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['center_id'] = Variable<String>(centerId);
    if (!nullToAbsent || teacherId != null) {
      map['teacher_id'] = Variable<String>(teacherId);
    }
    if (!nullToAbsent || teacherName != null) {
      map['teacher_name'] = Variable<String>(teacherName);
    }
    map['category'] = Variable<String>(category);
    map['student_count'] = Variable<int>(studentCount);
    map['max_students'] = Variable<int>(maxStudents);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  HalqatTableCompanion toCompanion(bool nullToAbsent) {
    return HalqatTableCompanion(
      id: Value(id),
      name: Value(name),
      centerId: Value(centerId),
      teacherId: teacherId == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherId),
      teacherName: teacherName == null && nullToAbsent
          ? const Value.absent()
          : Value(teacherName),
      category: Value(category),
      studentCount: Value(studentCount),
      maxStudents: Value(maxStudents),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory HalqatTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HalqatTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      centerId: serializer.fromJson<String>(json['centerId']),
      teacherId: serializer.fromJson<String?>(json['teacherId']),
      teacherName: serializer.fromJson<String?>(json['teacherName']),
      category: serializer.fromJson<String>(json['category']),
      studentCount: serializer.fromJson<int>(json['studentCount']),
      maxStudents: serializer.fromJson<int>(json['maxStudents']),
      description: serializer.fromJson<String?>(json['description']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'centerId': serializer.toJson<String>(centerId),
      'teacherId': serializer.toJson<String?>(teacherId),
      'teacherName': serializer.toJson<String?>(teacherName),
      'category': serializer.toJson<String>(category),
      'studentCount': serializer.toJson<int>(studentCount),
      'maxStudents': serializer.toJson<int>(maxStudents),
      'description': serializer.toJson<String?>(description),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  HalqatTableData copyWith(
          {String? id,
          String? name,
          String? centerId,
          Value<String?> teacherId = const Value.absent(),
          Value<String?> teacherName = const Value.absent(),
          String? category,
          int? studentCount,
          int? maxStudents,
          Value<String?> description = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      HalqatTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        centerId: centerId ?? this.centerId,
        teacherId: teacherId.present ? teacherId.value : this.teacherId,
        teacherName: teacherName.present ? teacherName.value : this.teacherName,
        category: category ?? this.category,
        studentCount: studentCount ?? this.studentCount,
        maxStudents: maxStudents ?? this.maxStudents,
        description: description.present ? description.value : this.description,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  HalqatTableData copyWithCompanion(HalqatTableCompanion data) {
    return HalqatTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      centerId: data.centerId.present ? data.centerId.value : this.centerId,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      teacherName:
          data.teacherName.present ? data.teacherName.value : this.teacherName,
      category: data.category.present ? data.category.value : this.category,
      studentCount: data.studentCount.present
          ? data.studentCount.value
          : this.studentCount,
      maxStudents:
          data.maxStudents.present ? data.maxStudents.value : this.maxStudents,
      description:
          data.description.present ? data.description.value : this.description,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HalqatTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('centerId: $centerId, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('category: $category, ')
          ..write('studentCount: $studentCount, ')
          ..write('maxStudents: $maxStudents, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HalqatTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.centerId == this.centerId &&
          other.teacherId == this.teacherId &&
          other.teacherName == this.teacherName &&
          other.category == this.category &&
          other.studentCount == this.studentCount &&
          other.maxStudents == this.maxStudents &&
          other.description == this.description &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class HalqatTableCompanion extends UpdateCompanion<HalqatTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> centerId;
  final Value<String?> teacherId;
  final Value<String?> teacherName;
  final Value<String> category;
  final Value<int> studentCount;
  final Value<int> maxStudents;
  final Value<String?> description;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const HalqatTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.centerId = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.teacherName = const Value.absent(),
    this.category = const Value.absent(),
    this.studentCount = const Value.absent(),
    this.maxStudents = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HalqatTableCompanion.insert({
    required String id,
    required String name,
    required String centerId,
    this.teacherId = const Value.absent(),
    this.teacherName = const Value.absent(),
    required String category,
    this.studentCount = const Value.absent(),
    this.maxStudents = const Value.absent(),
    this.description = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        centerId = Value(centerId),
        category = Value(category),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<HalqatTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? centerId,
    Expression<String>? teacherId,
    Expression<String>? teacherName,
    Expression<String>? category,
    Expression<int>? studentCount,
    Expression<int>? maxStudents,
    Expression<String>? description,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (centerId != null) 'center_id': centerId,
      if (teacherId != null) 'teacher_id': teacherId,
      if (teacherName != null) 'teacher_name': teacherName,
      if (category != null) 'category': category,
      if (studentCount != null) 'student_count': studentCount,
      if (maxStudents != null) 'max_students': maxStudents,
      if (description != null) 'description': description,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HalqatTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? centerId,
      Value<String?>? teacherId,
      Value<String?>? teacherName,
      Value<String>? category,
      Value<int>? studentCount,
      Value<int>? maxStudents,
      Value<String?>? description,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return HalqatTableCompanion(
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (centerId.present) {
      map['center_id'] = Variable<String>(centerId.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<String>(teacherId.value);
    }
    if (teacherName.present) {
      map['teacher_name'] = Variable<String>(teacherName.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (studentCount.present) {
      map['student_count'] = Variable<int>(studentCount.value);
    }
    if (maxStudents.present) {
      map['max_students'] = Variable<int>(maxStudents.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HalqatTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('centerId: $centerId, ')
          ..write('teacherId: $teacherId, ')
          ..write('teacherName: $teacherName, ')
          ..write('category: $category, ')
          ..write('studentCount: $studentCount, ')
          ..write('maxStudents: $maxStudents, ')
          ..write('description: $description, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudentsTableTable extends StudentsTable
    with TableInfo<$StudentsTableTable, StudentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fullNameMeta =
      const VerificationMeta('fullName');
  @override
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'full_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _halqaIdMeta =
      const VerificationMeta('halqaId');
  @override
  late final GeneratedColumn<String> halqaId = GeneratedColumn<String>(
      'halqa_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _centerIdMeta =
      const VerificationMeta('centerId');
  @override
  late final GeneratedColumn<String> centerId = GeneratedColumn<String>(
      'center_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentNameMeta =
      const VerificationMeta('parentName');
  @override
  late final GeneratedColumn<String> parentName = GeneratedColumn<String>(
      'parent_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentPhoneMeta =
      const VerificationMeta('parentPhone');
  @override
  late final GeneratedColumn<String> parentPhone = GeneratedColumn<String>(
      'parent_phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _parentJobMeta =
      const VerificationMeta('parentJob');
  @override
  late final GeneratedColumn<String> parentJob = GeneratedColumn<String>(
      'parent_job', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _currentResidenceMeta =
      const VerificationMeta('currentResidence');
  @override
  late final GeneratedColumn<String> currentResidence = GeneratedColumn<String>(
      'current_residence', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _previousResidenceMeta =
      const VerificationMeta('previousResidence');
  @override
  late final GeneratedColumn<String> previousResidence =
      GeneratedColumn<String>('previous_residence', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _governorateMeta =
      const VerificationMeta('governorate');
  @override
  late final GeneratedColumn<String> governorate = GeneratedColumn<String>(
      'governorate', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _ageMeta = const VerificationMeta('age');
  @override
  late final GeneratedColumn<int> age = GeneratedColumn<int>(
      'age', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _birthDateMeta =
      const VerificationMeta('birthDate');
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
      'birth_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _enrollmentDateMeta =
      const VerificationMeta('enrollmentDate');
  @override
  late final GeneratedColumn<DateTime> enrollmentDate =
      GeneratedColumn<DateTime>('enrollment_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _profileImageMeta =
      const VerificationMeta('profileImage');
  @override
  late final GeneratedColumn<String> profileImage = GeneratedColumn<String>(
      'profile_image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _previousMemorizationMeta =
      const VerificationMeta('previousMemorization');
  @override
  late final GeneratedColumn<String> previousMemorization =
      GeneratedColumn<String>('previous_memorization', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _studentUserIdMeta =
      const VerificationMeta('studentUserId');
  @override
  late final GeneratedColumn<String> studentUserId = GeneratedColumn<String>(
      'student_user_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _isBlockedMeta =
      const VerificationMeta('isBlocked');
  @override
  late final GeneratedColumn<bool> isBlocked = GeneratedColumn<bool>(
      'is_blocked', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_blocked" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        fullName,
        halqaId,
        centerId,
        parentName,
        parentPhone,
        parentId,
        parentJob,
        currentResidence,
        previousResidence,
        governorate,
        age,
        birthDate,
        enrollmentDate,
        phone,
        profileImage,
        previousMemorization,
        notes,
        studentUserId,
        isActive,
        isBlocked,
        createdAt,
        updatedAt,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(Insertable<StudentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('full_name')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['full_name']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('halqa_id')) {
      context.handle(_halqaIdMeta,
          halqaId.isAcceptableOrUnknown(data['halqa_id']!, _halqaIdMeta));
    } else if (isInserting) {
      context.missing(_halqaIdMeta);
    }
    if (data.containsKey('center_id')) {
      context.handle(_centerIdMeta,
          centerId.isAcceptableOrUnknown(data['center_id']!, _centerIdMeta));
    } else if (isInserting) {
      context.missing(_centerIdMeta);
    }
    if (data.containsKey('parent_name')) {
      context.handle(
          _parentNameMeta,
          parentName.isAcceptableOrUnknown(
              data['parent_name']!, _parentNameMeta));
    } else if (isInserting) {
      context.missing(_parentNameMeta);
    }
    if (data.containsKey('parent_phone')) {
      context.handle(
          _parentPhoneMeta,
          parentPhone.isAcceptableOrUnknown(
              data['parent_phone']!, _parentPhoneMeta));
    } else if (isInserting) {
      context.missing(_parentPhoneMeta);
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('parent_job')) {
      context.handle(_parentJobMeta,
          parentJob.isAcceptableOrUnknown(data['parent_job']!, _parentJobMeta));
    }
    if (data.containsKey('current_residence')) {
      context.handle(
          _currentResidenceMeta,
          currentResidence.isAcceptableOrUnknown(
              data['current_residence']!, _currentResidenceMeta));
    }
    if (data.containsKey('previous_residence')) {
      context.handle(
          _previousResidenceMeta,
          previousResidence.isAcceptableOrUnknown(
              data['previous_residence']!, _previousResidenceMeta));
    }
    if (data.containsKey('governorate')) {
      context.handle(
          _governorateMeta,
          governorate.isAcceptableOrUnknown(
              data['governorate']!, _governorateMeta));
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    }
    if (data.containsKey('enrollment_date')) {
      context.handle(
          _enrollmentDateMeta,
          enrollmentDate.isAcceptableOrUnknown(
              data['enrollment_date']!, _enrollmentDateMeta));
    } else if (isInserting) {
      context.missing(_enrollmentDateMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('profile_image')) {
      context.handle(
          _profileImageMeta,
          profileImage.isAcceptableOrUnknown(
              data['profile_image']!, _profileImageMeta));
    }
    if (data.containsKey('previous_memorization')) {
      context.handle(
          _previousMemorizationMeta,
          previousMemorization.isAcceptableOrUnknown(
              data['previous_memorization']!, _previousMemorizationMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('student_user_id')) {
      context.handle(
          _studentUserIdMeta,
          studentUserId.isAcceptableOrUnknown(
              data['student_user_id']!, _studentUserIdMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('is_blocked')) {
      context.handle(_isBlockedMeta,
          isBlocked.isAcceptableOrUnknown(data['is_blocked']!, _isBlockedMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      fullName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}full_name'])!,
      halqaId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}halqa_id'])!,
      centerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_id'])!,
      parentName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_name'])!,
      parentPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_phone'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_id']),
      parentJob: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_job']),
      currentResidence: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}current_residence']),
      previousResidence: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}previous_residence']),
      governorate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}governorate']),
      age: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}age']),
      birthDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}birth_date']),
      enrollmentDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}enrollment_date'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      profileImage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}profile_image']),
      previousMemorization: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}previous_memorization']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      studentUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}student_user_id']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      isBlocked: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_blocked'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $StudentsTableTable createAlias(String alias) {
    return $StudentsTableTable(attachedDatabase, alias);
  }
}

class StudentsTableData extends DataClass
    implements Insertable<StudentsTableData> {
  final String id;
  final String fullName;
  final String halqaId;
  final String centerId;
  final String parentName;
  final String parentPhone;
  final String? parentId;
  final String? parentJob;
  final String? currentResidence;
  final String? previousResidence;
  final String? governorate;
  final int? age;
  final DateTime? birthDate;
  final DateTime enrollmentDate;
  final String? phone;
  final String? profileImage;
  final String? previousMemorization;
  final String? notes;
  final String? studentUserId;
  final bool isActive;
  final bool isBlocked;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const StudentsTableData(
      {required this.id,
      required this.fullName,
      required this.halqaId,
      required this.centerId,
      required this.parentName,
      required this.parentPhone,
      this.parentId,
      this.parentJob,
      this.currentResidence,
      this.previousResidence,
      this.governorate,
      this.age,
      this.birthDate,
      required this.enrollmentDate,
      this.phone,
      this.profileImage,
      this.previousMemorization,
      this.notes,
      this.studentUserId,
      required this.isActive,
      required this.isBlocked,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['full_name'] = Variable<String>(fullName);
    map['halqa_id'] = Variable<String>(halqaId);
    map['center_id'] = Variable<String>(centerId);
    map['parent_name'] = Variable<String>(parentName);
    map['parent_phone'] = Variable<String>(parentPhone);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    if (!nullToAbsent || parentJob != null) {
      map['parent_job'] = Variable<String>(parentJob);
    }
    if (!nullToAbsent || currentResidence != null) {
      map['current_residence'] = Variable<String>(currentResidence);
    }
    if (!nullToAbsent || previousResidence != null) {
      map['previous_residence'] = Variable<String>(previousResidence);
    }
    if (!nullToAbsent || governorate != null) {
      map['governorate'] = Variable<String>(governorate);
    }
    if (!nullToAbsent || age != null) {
      map['age'] = Variable<int>(age);
    }
    if (!nullToAbsent || birthDate != null) {
      map['birth_date'] = Variable<DateTime>(birthDate);
    }
    map['enrollment_date'] = Variable<DateTime>(enrollmentDate);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || profileImage != null) {
      map['profile_image'] = Variable<String>(profileImage);
    }
    if (!nullToAbsent || previousMemorization != null) {
      map['previous_memorization'] = Variable<String>(previousMemorization);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    if (!nullToAbsent || studentUserId != null) {
      map['student_user_id'] = Variable<String>(studentUserId);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['is_blocked'] = Variable<bool>(isBlocked);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  StudentsTableCompanion toCompanion(bool nullToAbsent) {
    return StudentsTableCompanion(
      id: Value(id),
      fullName: Value(fullName),
      halqaId: Value(halqaId),
      centerId: Value(centerId),
      parentName: Value(parentName),
      parentPhone: Value(parentPhone),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      parentJob: parentJob == null && nullToAbsent
          ? const Value.absent()
          : Value(parentJob),
      currentResidence: currentResidence == null && nullToAbsent
          ? const Value.absent()
          : Value(currentResidence),
      previousResidence: previousResidence == null && nullToAbsent
          ? const Value.absent()
          : Value(previousResidence),
      governorate: governorate == null && nullToAbsent
          ? const Value.absent()
          : Value(governorate),
      age: age == null && nullToAbsent ? const Value.absent() : Value(age),
      birthDate: birthDate == null && nullToAbsent
          ? const Value.absent()
          : Value(birthDate),
      enrollmentDate: Value(enrollmentDate),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      profileImage: profileImage == null && nullToAbsent
          ? const Value.absent()
          : Value(profileImage),
      previousMemorization: previousMemorization == null && nullToAbsent
          ? const Value.absent()
          : Value(previousMemorization),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      studentUserId: studentUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(studentUserId),
      isActive: Value(isActive),
      isBlocked: Value(isBlocked),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory StudentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentsTableData(
      id: serializer.fromJson<String>(json['id']),
      fullName: serializer.fromJson<String>(json['fullName']),
      halqaId: serializer.fromJson<String>(json['halqaId']),
      centerId: serializer.fromJson<String>(json['centerId']),
      parentName: serializer.fromJson<String>(json['parentName']),
      parentPhone: serializer.fromJson<String>(json['parentPhone']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      parentJob: serializer.fromJson<String?>(json['parentJob']),
      currentResidence: serializer.fromJson<String?>(json['currentResidence']),
      previousResidence:
          serializer.fromJson<String?>(json['previousResidence']),
      governorate: serializer.fromJson<String?>(json['governorate']),
      age: serializer.fromJson<int?>(json['age']),
      birthDate: serializer.fromJson<DateTime?>(json['birthDate']),
      enrollmentDate: serializer.fromJson<DateTime>(json['enrollmentDate']),
      phone: serializer.fromJson<String?>(json['phone']),
      profileImage: serializer.fromJson<String?>(json['profileImage']),
      previousMemorization:
          serializer.fromJson<String?>(json['previousMemorization']),
      notes: serializer.fromJson<String?>(json['notes']),
      studentUserId: serializer.fromJson<String?>(json['studentUserId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      isBlocked: serializer.fromJson<bool>(json['isBlocked']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'fullName': serializer.toJson<String>(fullName),
      'halqaId': serializer.toJson<String>(halqaId),
      'centerId': serializer.toJson<String>(centerId),
      'parentName': serializer.toJson<String>(parentName),
      'parentPhone': serializer.toJson<String>(parentPhone),
      'parentId': serializer.toJson<String?>(parentId),
      'parentJob': serializer.toJson<String?>(parentJob),
      'currentResidence': serializer.toJson<String?>(currentResidence),
      'previousResidence': serializer.toJson<String?>(previousResidence),
      'governorate': serializer.toJson<String?>(governorate),
      'age': serializer.toJson<int?>(age),
      'birthDate': serializer.toJson<DateTime?>(birthDate),
      'enrollmentDate': serializer.toJson<DateTime>(enrollmentDate),
      'phone': serializer.toJson<String?>(phone),
      'profileImage': serializer.toJson<String?>(profileImage),
      'previousMemorization': serializer.toJson<String?>(previousMemorization),
      'notes': serializer.toJson<String?>(notes),
      'studentUserId': serializer.toJson<String?>(studentUserId),
      'isActive': serializer.toJson<bool>(isActive),
      'isBlocked': serializer.toJson<bool>(isBlocked),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  StudentsTableData copyWith(
          {String? id,
          String? fullName,
          String? halqaId,
          String? centerId,
          String? parentName,
          String? parentPhone,
          Value<String?> parentId = const Value.absent(),
          Value<String?> parentJob = const Value.absent(),
          Value<String?> currentResidence = const Value.absent(),
          Value<String?> previousResidence = const Value.absent(),
          Value<String?> governorate = const Value.absent(),
          Value<int?> age = const Value.absent(),
          Value<DateTime?> birthDate = const Value.absent(),
          DateTime? enrollmentDate,
          Value<String?> phone = const Value.absent(),
          Value<String?> profileImage = const Value.absent(),
          Value<String?> previousMemorization = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          Value<String?> studentUserId = const Value.absent(),
          bool? isActive,
          bool? isBlocked,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      StudentsTableData(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        halqaId: halqaId ?? this.halqaId,
        centerId: centerId ?? this.centerId,
        parentName: parentName ?? this.parentName,
        parentPhone: parentPhone ?? this.parentPhone,
        parentId: parentId.present ? parentId.value : this.parentId,
        parentJob: parentJob.present ? parentJob.value : this.parentJob,
        currentResidence: currentResidence.present
            ? currentResidence.value
            : this.currentResidence,
        previousResidence: previousResidence.present
            ? previousResidence.value
            : this.previousResidence,
        governorate: governorate.present ? governorate.value : this.governorate,
        age: age.present ? age.value : this.age,
        birthDate: birthDate.present ? birthDate.value : this.birthDate,
        enrollmentDate: enrollmentDate ?? this.enrollmentDate,
        phone: phone.present ? phone.value : this.phone,
        profileImage:
            profileImage.present ? profileImage.value : this.profileImage,
        previousMemorization: previousMemorization.present
            ? previousMemorization.value
            : this.previousMemorization,
        notes: notes.present ? notes.value : this.notes,
        studentUserId:
            studentUserId.present ? studentUserId.value : this.studentUserId,
        isActive: isActive ?? this.isActive,
        isBlocked: isBlocked ?? this.isBlocked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  StudentsTableData copyWithCompanion(StudentsTableCompanion data) {
    return StudentsTableData(
      id: data.id.present ? data.id.value : this.id,
      fullName: data.fullName.present ? data.fullName.value : this.fullName,
      halqaId: data.halqaId.present ? data.halqaId.value : this.halqaId,
      centerId: data.centerId.present ? data.centerId.value : this.centerId,
      parentName:
          data.parentName.present ? data.parentName.value : this.parentName,
      parentPhone:
          data.parentPhone.present ? data.parentPhone.value : this.parentPhone,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      parentJob: data.parentJob.present ? data.parentJob.value : this.parentJob,
      currentResidence: data.currentResidence.present
          ? data.currentResidence.value
          : this.currentResidence,
      previousResidence: data.previousResidence.present
          ? data.previousResidence.value
          : this.previousResidence,
      governorate:
          data.governorate.present ? data.governorate.value : this.governorate,
      age: data.age.present ? data.age.value : this.age,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
      enrollmentDate: data.enrollmentDate.present
          ? data.enrollmentDate.value
          : this.enrollmentDate,
      phone: data.phone.present ? data.phone.value : this.phone,
      profileImage: data.profileImage.present
          ? data.profileImage.value
          : this.profileImage,
      previousMemorization: data.previousMemorization.present
          ? data.previousMemorization.value
          : this.previousMemorization,
      notes: data.notes.present ? data.notes.value : this.notes,
      studentUserId: data.studentUserId.present
          ? data.studentUserId.value
          : this.studentUserId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      isBlocked: data.isBlocked.present ? data.isBlocked.value : this.isBlocked,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentsTableData(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('halqaId: $halqaId, ')
          ..write('centerId: $centerId, ')
          ..write('parentName: $parentName, ')
          ..write('parentPhone: $parentPhone, ')
          ..write('parentId: $parentId, ')
          ..write('parentJob: $parentJob, ')
          ..write('currentResidence: $currentResidence, ')
          ..write('previousResidence: $previousResidence, ')
          ..write('governorate: $governorate, ')
          ..write('age: $age, ')
          ..write('birthDate: $birthDate, ')
          ..write('enrollmentDate: $enrollmentDate, ')
          ..write('phone: $phone, ')
          ..write('profileImage: $profileImage, ')
          ..write('previousMemorization: $previousMemorization, ')
          ..write('notes: $notes, ')
          ..write('studentUserId: $studentUserId, ')
          ..write('isActive: $isActive, ')
          ..write('isBlocked: $isBlocked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        fullName,
        halqaId,
        centerId,
        parentName,
        parentPhone,
        parentId,
        parentJob,
        currentResidence,
        previousResidence,
        governorate,
        age,
        birthDate,
        enrollmentDate,
        phone,
        profileImage,
        previousMemorization,
        notes,
        studentUserId,
        isActive,
        isBlocked,
        createdAt,
        updatedAt,
        syncStatus
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentsTableData &&
          other.id == this.id &&
          other.fullName == this.fullName &&
          other.halqaId == this.halqaId &&
          other.centerId == this.centerId &&
          other.parentName == this.parentName &&
          other.parentPhone == this.parentPhone &&
          other.parentId == this.parentId &&
          other.parentJob == this.parentJob &&
          other.currentResidence == this.currentResidence &&
          other.previousResidence == this.previousResidence &&
          other.governorate == this.governorate &&
          other.age == this.age &&
          other.birthDate == this.birthDate &&
          other.enrollmentDate == this.enrollmentDate &&
          other.phone == this.phone &&
          other.profileImage == this.profileImage &&
          other.previousMemorization == this.previousMemorization &&
          other.notes == this.notes &&
          other.studentUserId == this.studentUserId &&
          other.isActive == this.isActive &&
          other.isBlocked == this.isBlocked &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class StudentsTableCompanion extends UpdateCompanion<StudentsTableData> {
  final Value<String> id;
  final Value<String> fullName;
  final Value<String> halqaId;
  final Value<String> centerId;
  final Value<String> parentName;
  final Value<String> parentPhone;
  final Value<String?> parentId;
  final Value<String?> parentJob;
  final Value<String?> currentResidence;
  final Value<String?> previousResidence;
  final Value<String?> governorate;
  final Value<int?> age;
  final Value<DateTime?> birthDate;
  final Value<DateTime> enrollmentDate;
  final Value<String?> phone;
  final Value<String?> profileImage;
  final Value<String?> previousMemorization;
  final Value<String?> notes;
  final Value<String?> studentUserId;
  final Value<bool> isActive;
  final Value<bool> isBlocked;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const StudentsTableCompanion({
    this.id = const Value.absent(),
    this.fullName = const Value.absent(),
    this.halqaId = const Value.absent(),
    this.centerId = const Value.absent(),
    this.parentName = const Value.absent(),
    this.parentPhone = const Value.absent(),
    this.parentId = const Value.absent(),
    this.parentJob = const Value.absent(),
    this.currentResidence = const Value.absent(),
    this.previousResidence = const Value.absent(),
    this.governorate = const Value.absent(),
    this.age = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.enrollmentDate = const Value.absent(),
    this.phone = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.previousMemorization = const Value.absent(),
    this.notes = const Value.absent(),
    this.studentUserId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isBlocked = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentsTableCompanion.insert({
    required String id,
    required String fullName,
    required String halqaId,
    required String centerId,
    required String parentName,
    required String parentPhone,
    this.parentId = const Value.absent(),
    this.parentJob = const Value.absent(),
    this.currentResidence = const Value.absent(),
    this.previousResidence = const Value.absent(),
    this.governorate = const Value.absent(),
    this.age = const Value.absent(),
    this.birthDate = const Value.absent(),
    required DateTime enrollmentDate,
    this.phone = const Value.absent(),
    this.profileImage = const Value.absent(),
    this.previousMemorization = const Value.absent(),
    this.notes = const Value.absent(),
    this.studentUserId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.isBlocked = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        fullName = Value(fullName),
        halqaId = Value(halqaId),
        centerId = Value(centerId),
        parentName = Value(parentName),
        parentPhone = Value(parentPhone),
        enrollmentDate = Value(enrollmentDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<StudentsTableData> custom({
    Expression<String>? id,
    Expression<String>? fullName,
    Expression<String>? halqaId,
    Expression<String>? centerId,
    Expression<String>? parentName,
    Expression<String>? parentPhone,
    Expression<String>? parentId,
    Expression<String>? parentJob,
    Expression<String>? currentResidence,
    Expression<String>? previousResidence,
    Expression<String>? governorate,
    Expression<int>? age,
    Expression<DateTime>? birthDate,
    Expression<DateTime>? enrollmentDate,
    Expression<String>? phone,
    Expression<String>? profileImage,
    Expression<String>? previousMemorization,
    Expression<String>? notes,
    Expression<String>? studentUserId,
    Expression<bool>? isActive,
    Expression<bool>? isBlocked,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (fullName != null) 'full_name': fullName,
      if (halqaId != null) 'halqa_id': halqaId,
      if (centerId != null) 'center_id': centerId,
      if (parentName != null) 'parent_name': parentName,
      if (parentPhone != null) 'parent_phone': parentPhone,
      if (parentId != null) 'parent_id': parentId,
      if (parentJob != null) 'parent_job': parentJob,
      if (currentResidence != null) 'current_residence': currentResidence,
      if (previousResidence != null) 'previous_residence': previousResidence,
      if (governorate != null) 'governorate': governorate,
      if (age != null) 'age': age,
      if (birthDate != null) 'birth_date': birthDate,
      if (enrollmentDate != null) 'enrollment_date': enrollmentDate,
      if (phone != null) 'phone': phone,
      if (profileImage != null) 'profile_image': profileImage,
      if (previousMemorization != null)
        'previous_memorization': previousMemorization,
      if (notes != null) 'notes': notes,
      if (studentUserId != null) 'student_user_id': studentUserId,
      if (isActive != null) 'is_active': isActive,
      if (isBlocked != null) 'is_blocked': isBlocked,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? fullName,
      Value<String>? halqaId,
      Value<String>? centerId,
      Value<String>? parentName,
      Value<String>? parentPhone,
      Value<String?>? parentId,
      Value<String?>? parentJob,
      Value<String?>? currentResidence,
      Value<String?>? previousResidence,
      Value<String?>? governorate,
      Value<int?>? age,
      Value<DateTime?>? birthDate,
      Value<DateTime>? enrollmentDate,
      Value<String?>? phone,
      Value<String?>? profileImage,
      Value<String?>? previousMemorization,
      Value<String?>? notes,
      Value<String?>? studentUserId,
      Value<bool>? isActive,
      Value<bool>? isBlocked,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return StudentsTableCompanion(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      halqaId: halqaId ?? this.halqaId,
      centerId: centerId ?? this.centerId,
      parentName: parentName ?? this.parentName,
      parentPhone: parentPhone ?? this.parentPhone,
      parentId: parentId ?? this.parentId,
      parentJob: parentJob ?? this.parentJob,
      currentResidence: currentResidence ?? this.currentResidence,
      previousResidence: previousResidence ?? this.previousResidence,
      governorate: governorate ?? this.governorate,
      age: age ?? this.age,
      birthDate: birthDate ?? this.birthDate,
      enrollmentDate: enrollmentDate ?? this.enrollmentDate,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      previousMemorization: previousMemorization ?? this.previousMemorization,
      notes: notes ?? this.notes,
      studentUserId: studentUserId ?? this.studentUserId,
      isActive: isActive ?? this.isActive,
      isBlocked: isBlocked ?? this.isBlocked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (fullName.present) {
      map['full_name'] = Variable<String>(fullName.value);
    }
    if (halqaId.present) {
      map['halqa_id'] = Variable<String>(halqaId.value);
    }
    if (centerId.present) {
      map['center_id'] = Variable<String>(centerId.value);
    }
    if (parentName.present) {
      map['parent_name'] = Variable<String>(parentName.value);
    }
    if (parentPhone.present) {
      map['parent_phone'] = Variable<String>(parentPhone.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (parentJob.present) {
      map['parent_job'] = Variable<String>(parentJob.value);
    }
    if (currentResidence.present) {
      map['current_residence'] = Variable<String>(currentResidence.value);
    }
    if (previousResidence.present) {
      map['previous_residence'] = Variable<String>(previousResidence.value);
    }
    if (governorate.present) {
      map['governorate'] = Variable<String>(governorate.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (enrollmentDate.present) {
      map['enrollment_date'] = Variable<DateTime>(enrollmentDate.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (profileImage.present) {
      map['profile_image'] = Variable<String>(profileImage.value);
    }
    if (previousMemorization.present) {
      map['previous_memorization'] =
          Variable<String>(previousMemorization.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (studentUserId.present) {
      map['student_user_id'] = Variable<String>(studentUserId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (isBlocked.present) {
      map['is_blocked'] = Variable<bool>(isBlocked.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsTableCompanion(')
          ..write('id: $id, ')
          ..write('fullName: $fullName, ')
          ..write('halqaId: $halqaId, ')
          ..write('centerId: $centerId, ')
          ..write('parentName: $parentName, ')
          ..write('parentPhone: $parentPhone, ')
          ..write('parentId: $parentId, ')
          ..write('parentJob: $parentJob, ')
          ..write('currentResidence: $currentResidence, ')
          ..write('previousResidence: $previousResidence, ')
          ..write('governorate: $governorate, ')
          ..write('age: $age, ')
          ..write('birthDate: $birthDate, ')
          ..write('enrollmentDate: $enrollmentDate, ')
          ..write('phone: $phone, ')
          ..write('profileImage: $profileImage, ')
          ..write('previousMemorization: $previousMemorization, ')
          ..write('notes: $notes, ')
          ..write('studentUserId: $studentUserId, ')
          ..write('isActive: $isActive, ')
          ..write('isBlocked: $isBlocked, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DailyReportsTableTable extends DailyReportsTable
    with TableInfo<$DailyReportsTableTable, DailyReportsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DailyReportsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _halqaIdMeta =
      const VerificationMeta('halqaId');
  @override
  late final GeneratedColumn<String> halqaId = GeneratedColumn<String>(
      'halqa_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _teacherIdMeta =
      const VerificationMeta('teacherId');
  @override
  late final GeneratedColumn<String> teacherId = GeneratedColumn<String>(
      'teacher_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _reviewedByMeta =
      const VerificationMeta('reviewedBy');
  @override
  late final GeneratedColumn<String> reviewedBy = GeneratedColumn<String>(
      'reviewed_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _reviewNotesMeta =
      const VerificationMeta('reviewNotes');
  @override
  late final GeneratedColumn<String> reviewNotes = GeneratedColumn<String>(
      'review_notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        halqaId,
        teacherId,
        date,
        status,
        reviewedBy,
        reviewNotes,
        createdAt,
        updatedAt,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'daily_reports';
  @override
  VerificationContext validateIntegrity(
      Insertable<DailyReportsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('halqa_id')) {
      context.handle(_halqaIdMeta,
          halqaId.isAcceptableOrUnknown(data['halqa_id']!, _halqaIdMeta));
    } else if (isInserting) {
      context.missing(_halqaIdMeta);
    }
    if (data.containsKey('teacher_id')) {
      context.handle(_teacherIdMeta,
          teacherId.isAcceptableOrUnknown(data['teacher_id']!, _teacherIdMeta));
    } else if (isInserting) {
      context.missing(_teacherIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('reviewed_by')) {
      context.handle(
          _reviewedByMeta,
          reviewedBy.isAcceptableOrUnknown(
              data['reviewed_by']!, _reviewedByMeta));
    }
    if (data.containsKey('review_notes')) {
      context.handle(
          _reviewNotesMeta,
          reviewNotes.isAcceptableOrUnknown(
              data['review_notes']!, _reviewNotesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DailyReportsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DailyReportsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      halqaId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}halqa_id'])!,
      teacherId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}teacher_id'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      reviewedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reviewed_by']),
      reviewNotes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}review_notes']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $DailyReportsTableTable createAlias(String alias) {
    return $DailyReportsTableTable(attachedDatabase, alias);
  }
}

class DailyReportsTableData extends DataClass
    implements Insertable<DailyReportsTableData> {
  final String id;
  final String halqaId;
  final String teacherId;
  final DateTime date;
  final String status;
  final String? reviewedBy;
  final String? reviewNotes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const DailyReportsTableData(
      {required this.id,
      required this.halqaId,
      required this.teacherId,
      required this.date,
      required this.status,
      this.reviewedBy,
      this.reviewNotes,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['halqa_id'] = Variable<String>(halqaId);
    map['teacher_id'] = Variable<String>(teacherId);
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || reviewedBy != null) {
      map['reviewed_by'] = Variable<String>(reviewedBy);
    }
    if (!nullToAbsent || reviewNotes != null) {
      map['review_notes'] = Variable<String>(reviewNotes);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  DailyReportsTableCompanion toCompanion(bool nullToAbsent) {
    return DailyReportsTableCompanion(
      id: Value(id),
      halqaId: Value(halqaId),
      teacherId: Value(teacherId),
      date: Value(date),
      status: Value(status),
      reviewedBy: reviewedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewedBy),
      reviewNotes: reviewNotes == null && nullToAbsent
          ? const Value.absent()
          : Value(reviewNotes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory DailyReportsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DailyReportsTableData(
      id: serializer.fromJson<String>(json['id']),
      halqaId: serializer.fromJson<String>(json['halqaId']),
      teacherId: serializer.fromJson<String>(json['teacherId']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<String>(json['status']),
      reviewedBy: serializer.fromJson<String?>(json['reviewedBy']),
      reviewNotes: serializer.fromJson<String?>(json['reviewNotes']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'halqaId': serializer.toJson<String>(halqaId),
      'teacherId': serializer.toJson<String>(teacherId),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<String>(status),
      'reviewedBy': serializer.toJson<String?>(reviewedBy),
      'reviewNotes': serializer.toJson<String?>(reviewNotes),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  DailyReportsTableData copyWith(
          {String? id,
          String? halqaId,
          String? teacherId,
          DateTime? date,
          String? status,
          Value<String?> reviewedBy = const Value.absent(),
          Value<String?> reviewNotes = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      DailyReportsTableData(
        id: id ?? this.id,
        halqaId: halqaId ?? this.halqaId,
        teacherId: teacherId ?? this.teacherId,
        date: date ?? this.date,
        status: status ?? this.status,
        reviewedBy: reviewedBy.present ? reviewedBy.value : this.reviewedBy,
        reviewNotes: reviewNotes.present ? reviewNotes.value : this.reviewNotes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  DailyReportsTableData copyWithCompanion(DailyReportsTableCompanion data) {
    return DailyReportsTableData(
      id: data.id.present ? data.id.value : this.id,
      halqaId: data.halqaId.present ? data.halqaId.value : this.halqaId,
      teacherId: data.teacherId.present ? data.teacherId.value : this.teacherId,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
      reviewedBy:
          data.reviewedBy.present ? data.reviewedBy.value : this.reviewedBy,
      reviewNotes:
          data.reviewNotes.present ? data.reviewNotes.value : this.reviewNotes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DailyReportsTableData(')
          ..write('id: $id, ')
          ..write('halqaId: $halqaId, ')
          ..write('teacherId: $teacherId, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('reviewedBy: $reviewedBy, ')
          ..write('reviewNotes: $reviewNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, halqaId, teacherId, date, status,
      reviewedBy, reviewNotes, createdAt, updatedAt, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DailyReportsTableData &&
          other.id == this.id &&
          other.halqaId == this.halqaId &&
          other.teacherId == this.teacherId &&
          other.date == this.date &&
          other.status == this.status &&
          other.reviewedBy == this.reviewedBy &&
          other.reviewNotes == this.reviewNotes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class DailyReportsTableCompanion
    extends UpdateCompanion<DailyReportsTableData> {
  final Value<String> id;
  final Value<String> halqaId;
  final Value<String> teacherId;
  final Value<DateTime> date;
  final Value<String> status;
  final Value<String?> reviewedBy;
  final Value<String?> reviewNotes;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const DailyReportsTableCompanion({
    this.id = const Value.absent(),
    this.halqaId = const Value.absent(),
    this.teacherId = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
    this.reviewedBy = const Value.absent(),
    this.reviewNotes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DailyReportsTableCompanion.insert({
    required String id,
    required String halqaId,
    required String teacherId,
    required DateTime date,
    this.status = const Value.absent(),
    this.reviewedBy = const Value.absent(),
    this.reviewNotes = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        halqaId = Value(halqaId),
        teacherId = Value(teacherId),
        date = Value(date),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DailyReportsTableData> custom({
    Expression<String>? id,
    Expression<String>? halqaId,
    Expression<String>? teacherId,
    Expression<DateTime>? date,
    Expression<String>? status,
    Expression<String>? reviewedBy,
    Expression<String>? reviewNotes,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (halqaId != null) 'halqa_id': halqaId,
      if (teacherId != null) 'teacher_id': teacherId,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
      if (reviewedBy != null) 'reviewed_by': reviewedBy,
      if (reviewNotes != null) 'review_notes': reviewNotes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DailyReportsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? halqaId,
      Value<String>? teacherId,
      Value<DateTime>? date,
      Value<String>? status,
      Value<String?>? reviewedBy,
      Value<String?>? reviewNotes,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return DailyReportsTableCompanion(
      id: id ?? this.id,
      halqaId: halqaId ?? this.halqaId,
      teacherId: teacherId ?? this.teacherId,
      date: date ?? this.date,
      status: status ?? this.status,
      reviewedBy: reviewedBy ?? this.reviewedBy,
      reviewNotes: reviewNotes ?? this.reviewNotes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (halqaId.present) {
      map['halqa_id'] = Variable<String>(halqaId.value);
    }
    if (teacherId.present) {
      map['teacher_id'] = Variable<String>(teacherId.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (reviewedBy.present) {
      map['reviewed_by'] = Variable<String>(reviewedBy.value);
    }
    if (reviewNotes.present) {
      map['review_notes'] = Variable<String>(reviewNotes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DailyReportsTableCompanion(')
          ..write('id: $id, ')
          ..write('halqaId: $halqaId, ')
          ..write('teacherId: $teacherId, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('reviewedBy: $reviewedBy, ')
          ..write('reviewNotes: $reviewNotes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StudentReportsTableTable extends StudentReportsTable
    with TableInfo<$StudentReportsTableTable, StudentReportsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentReportsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _reportIdMeta =
      const VerificationMeta('reportId');
  @override
  late final GeneratedColumn<String> reportId = GeneratedColumn<String>(
      'report_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
      'student_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _studentNameMeta =
      const VerificationMeta('studentName');
  @override
  late final GeneratedColumn<String> studentName = GeneratedColumn<String>(
      'student_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _attendanceStatusMeta =
      const VerificationMeta('attendanceStatus');
  @override
  late final GeneratedColumn<String> attendanceStatus = GeneratedColumn<String>(
      'attendance_status', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        reportId,
        studentId,
        studentName,
        attendanceStatus,
        notes,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student_reports';
  @override
  VerificationContext validateIntegrity(
      Insertable<StudentReportsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('report_id')) {
      context.handle(_reportIdMeta,
          reportId.isAcceptableOrUnknown(data['report_id']!, _reportIdMeta));
    } else if (isInserting) {
      context.missing(_reportIdMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('student_name')) {
      context.handle(
          _studentNameMeta,
          studentName.isAcceptableOrUnknown(
              data['student_name']!, _studentNameMeta));
    } else if (isInserting) {
      context.missing(_studentNameMeta);
    }
    if (data.containsKey('attendance_status')) {
      context.handle(
          _attendanceStatusMeta,
          attendanceStatus.isAcceptableOrUnknown(
              data['attendance_status']!, _attendanceStatusMeta));
    } else if (isInserting) {
      context.missing(_attendanceStatusMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentReportsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentReportsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      reportId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}report_id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}student_id'])!,
      studentName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}student_name'])!,
      attendanceStatus: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}attendance_status'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $StudentReportsTableTable createAlias(String alias) {
    return $StudentReportsTableTable(attachedDatabase, alias);
  }
}

class StudentReportsTableData extends DataClass
    implements Insertable<StudentReportsTableData> {
  final String id;
  final String reportId;
  final String studentId;
  final String studentName;
  final String attendanceStatus;
  final String? notes;
  final String syncStatus;
  const StudentReportsTableData(
      {required this.id,
      required this.reportId,
      required this.studentId,
      required this.studentName,
      required this.attendanceStatus,
      this.notes,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['report_id'] = Variable<String>(reportId);
    map['student_id'] = Variable<String>(studentId);
    map['student_name'] = Variable<String>(studentName);
    map['attendance_status'] = Variable<String>(attendanceStatus);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  StudentReportsTableCompanion toCompanion(bool nullToAbsent) {
    return StudentReportsTableCompanion(
      id: Value(id),
      reportId: Value(reportId),
      studentId: Value(studentId),
      studentName: Value(studentName),
      attendanceStatus: Value(attendanceStatus),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      syncStatus: Value(syncStatus),
    );
  }

  factory StudentReportsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentReportsTableData(
      id: serializer.fromJson<String>(json['id']),
      reportId: serializer.fromJson<String>(json['reportId']),
      studentId: serializer.fromJson<String>(json['studentId']),
      studentName: serializer.fromJson<String>(json['studentName']),
      attendanceStatus: serializer.fromJson<String>(json['attendanceStatus']),
      notes: serializer.fromJson<String?>(json['notes']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'reportId': serializer.toJson<String>(reportId),
      'studentId': serializer.toJson<String>(studentId),
      'studentName': serializer.toJson<String>(studentName),
      'attendanceStatus': serializer.toJson<String>(attendanceStatus),
      'notes': serializer.toJson<String?>(notes),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  StudentReportsTableData copyWith(
          {String? id,
          String? reportId,
          String? studentId,
          String? studentName,
          String? attendanceStatus,
          Value<String?> notes = const Value.absent(),
          String? syncStatus}) =>
      StudentReportsTableData(
        id: id ?? this.id,
        reportId: reportId ?? this.reportId,
        studentId: studentId ?? this.studentId,
        studentName: studentName ?? this.studentName,
        attendanceStatus: attendanceStatus ?? this.attendanceStatus,
        notes: notes.present ? notes.value : this.notes,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  StudentReportsTableData copyWithCompanion(StudentReportsTableCompanion data) {
    return StudentReportsTableData(
      id: data.id.present ? data.id.value : this.id,
      reportId: data.reportId.present ? data.reportId.value : this.reportId,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      studentName:
          data.studentName.present ? data.studentName.value : this.studentName,
      attendanceStatus: data.attendanceStatus.present
          ? data.attendanceStatus.value
          : this.attendanceStatus,
      notes: data.notes.present ? data.notes.value : this.notes,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentReportsTableData(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('studentId: $studentId, ')
          ..write('studentName: $studentName, ')
          ..write('attendanceStatus: $attendanceStatus, ')
          ..write('notes: $notes, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, reportId, studentId, studentName,
      attendanceStatus, notes, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentReportsTableData &&
          other.id == this.id &&
          other.reportId == this.reportId &&
          other.studentId == this.studentId &&
          other.studentName == this.studentName &&
          other.attendanceStatus == this.attendanceStatus &&
          other.notes == this.notes &&
          other.syncStatus == this.syncStatus);
}

class StudentReportsTableCompanion
    extends UpdateCompanion<StudentReportsTableData> {
  final Value<String> id;
  final Value<String> reportId;
  final Value<String> studentId;
  final Value<String> studentName;
  final Value<String> attendanceStatus;
  final Value<String?> notes;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const StudentReportsTableCompanion({
    this.id = const Value.absent(),
    this.reportId = const Value.absent(),
    this.studentId = const Value.absent(),
    this.studentName = const Value.absent(),
    this.attendanceStatus = const Value.absent(),
    this.notes = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StudentReportsTableCompanion.insert({
    required String id,
    required String reportId,
    required String studentId,
    required String studentName,
    required String attendanceStatus,
    this.notes = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        reportId = Value(reportId),
        studentId = Value(studentId),
        studentName = Value(studentName),
        attendanceStatus = Value(attendanceStatus);
  static Insertable<StudentReportsTableData> custom({
    Expression<String>? id,
    Expression<String>? reportId,
    Expression<String>? studentId,
    Expression<String>? studentName,
    Expression<String>? attendanceStatus,
    Expression<String>? notes,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (reportId != null) 'report_id': reportId,
      if (studentId != null) 'student_id': studentId,
      if (studentName != null) 'student_name': studentName,
      if (attendanceStatus != null) 'attendance_status': attendanceStatus,
      if (notes != null) 'notes': notes,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StudentReportsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? reportId,
      Value<String>? studentId,
      Value<String>? studentName,
      Value<String>? attendanceStatus,
      Value<String?>? notes,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return StudentReportsTableCompanion(
      id: id ?? this.id,
      reportId: reportId ?? this.reportId,
      studentId: studentId ?? this.studentId,
      studentName: studentName ?? this.studentName,
      attendanceStatus: attendanceStatus ?? this.attendanceStatus,
      notes: notes ?? this.notes,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (reportId.present) {
      map['report_id'] = Variable<String>(reportId.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (studentName.present) {
      map['student_name'] = Variable<String>(studentName.value);
    }
    if (attendanceStatus.present) {
      map['attendance_status'] = Variable<String>(attendanceStatus.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentReportsTableCompanion(')
          ..write('id: $id, ')
          ..write('reportId: $reportId, ')
          ..write('studentId: $studentId, ')
          ..write('studentName: $studentName, ')
          ..write('attendanceStatus: $attendanceStatus, ')
          ..write('notes: $notes, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecitationsTableTable extends RecitationsTable
    with TableInfo<$RecitationsTableTable, RecitationsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecitationsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _studentReportIdMeta =
      const VerificationMeta('studentReportId');
  @override
  late final GeneratedColumn<String> studentReportId = GeneratedColumn<String>(
      'student_report_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _surahNumberMeta =
      const VerificationMeta('surahNumber');
  @override
  late final GeneratedColumn<int> surahNumber = GeneratedColumn<int>(
      'surah_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _surahNameMeta =
      const VerificationMeta('surahName');
  @override
  late final GeneratedColumn<String> surahName = GeneratedColumn<String>(
      'surah_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fromVerseMeta =
      const VerificationMeta('fromVerse');
  @override
  late final GeneratedColumn<int> fromVerse = GeneratedColumn<int>(
      'from_verse', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _toVerseMeta =
      const VerificationMeta('toVerse');
  @override
  late final GeneratedColumn<int> toVerse = GeneratedColumn<int>(
      'to_verse', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<int> rating = GeneratedColumn<int>(
      'rating', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        studentReportId,
        type,
        surahNumber,
        surahName,
        fromVerse,
        toVerse,
        rating,
        notes
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recitations';
  @override
  VerificationContext validateIntegrity(
      Insertable<RecitationsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('student_report_id')) {
      context.handle(
          _studentReportIdMeta,
          studentReportId.isAcceptableOrUnknown(
              data['student_report_id']!, _studentReportIdMeta));
    } else if (isInserting) {
      context.missing(_studentReportIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('surah_number')) {
      context.handle(
          _surahNumberMeta,
          surahNumber.isAcceptableOrUnknown(
              data['surah_number']!, _surahNumberMeta));
    } else if (isInserting) {
      context.missing(_surahNumberMeta);
    }
    if (data.containsKey('surah_name')) {
      context.handle(_surahNameMeta,
          surahName.isAcceptableOrUnknown(data['surah_name']!, _surahNameMeta));
    } else if (isInserting) {
      context.missing(_surahNameMeta);
    }
    if (data.containsKey('from_verse')) {
      context.handle(_fromVerseMeta,
          fromVerse.isAcceptableOrUnknown(data['from_verse']!, _fromVerseMeta));
    } else if (isInserting) {
      context.missing(_fromVerseMeta);
    }
    if (data.containsKey('to_verse')) {
      context.handle(_toVerseMeta,
          toVerse.isAcceptableOrUnknown(data['to_verse']!, _toVerseMeta));
    } else if (isInserting) {
      context.missing(_toVerseMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecitationsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecitationsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      studentReportId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}student_report_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      surahNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}surah_number'])!,
      surahName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}surah_name'])!,
      fromVerse: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from_verse'])!,
      toVerse: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_verse'])!,
      rating: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}rating']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
    );
  }

  @override
  $RecitationsTableTable createAlias(String alias) {
    return $RecitationsTableTable(attachedDatabase, alias);
  }
}

class RecitationsTableData extends DataClass
    implements Insertable<RecitationsTableData> {
  final String id;
  final String studentReportId;
  final String type;
  final int surahNumber;
  final String surahName;
  final int fromVerse;
  final int toVerse;
  final int? rating;
  final String? notes;
  const RecitationsTableData(
      {required this.id,
      required this.studentReportId,
      required this.type,
      required this.surahNumber,
      required this.surahName,
      required this.fromVerse,
      required this.toVerse,
      this.rating,
      this.notes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['student_report_id'] = Variable<String>(studentReportId);
    map['type'] = Variable<String>(type);
    map['surah_number'] = Variable<int>(surahNumber);
    map['surah_name'] = Variable<String>(surahName);
    map['from_verse'] = Variable<int>(fromVerse);
    map['to_verse'] = Variable<int>(toVerse);
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<int>(rating);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    return map;
  }

  RecitationsTableCompanion toCompanion(bool nullToAbsent) {
    return RecitationsTableCompanion(
      id: Value(id),
      studentReportId: Value(studentReportId),
      type: Value(type),
      surahNumber: Value(surahNumber),
      surahName: Value(surahName),
      fromVerse: Value(fromVerse),
      toVerse: Value(toVerse),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
    );
  }

  factory RecitationsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecitationsTableData(
      id: serializer.fromJson<String>(json['id']),
      studentReportId: serializer.fromJson<String>(json['studentReportId']),
      type: serializer.fromJson<String>(json['type']),
      surahNumber: serializer.fromJson<int>(json['surahNumber']),
      surahName: serializer.fromJson<String>(json['surahName']),
      fromVerse: serializer.fromJson<int>(json['fromVerse']),
      toVerse: serializer.fromJson<int>(json['toVerse']),
      rating: serializer.fromJson<int?>(json['rating']),
      notes: serializer.fromJson<String?>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'studentReportId': serializer.toJson<String>(studentReportId),
      'type': serializer.toJson<String>(type),
      'surahNumber': serializer.toJson<int>(surahNumber),
      'surahName': serializer.toJson<String>(surahName),
      'fromVerse': serializer.toJson<int>(fromVerse),
      'toVerse': serializer.toJson<int>(toVerse),
      'rating': serializer.toJson<int?>(rating),
      'notes': serializer.toJson<String?>(notes),
    };
  }

  RecitationsTableData copyWith(
          {String? id,
          String? studentReportId,
          String? type,
          int? surahNumber,
          String? surahName,
          int? fromVerse,
          int? toVerse,
          Value<int?> rating = const Value.absent(),
          Value<String?> notes = const Value.absent()}) =>
      RecitationsTableData(
        id: id ?? this.id,
        studentReportId: studentReportId ?? this.studentReportId,
        type: type ?? this.type,
        surahNumber: surahNumber ?? this.surahNumber,
        surahName: surahName ?? this.surahName,
        fromVerse: fromVerse ?? this.fromVerse,
        toVerse: toVerse ?? this.toVerse,
        rating: rating.present ? rating.value : this.rating,
        notes: notes.present ? notes.value : this.notes,
      );
  RecitationsTableData copyWithCompanion(RecitationsTableCompanion data) {
    return RecitationsTableData(
      id: data.id.present ? data.id.value : this.id,
      studentReportId: data.studentReportId.present
          ? data.studentReportId.value
          : this.studentReportId,
      type: data.type.present ? data.type.value : this.type,
      surahNumber:
          data.surahNumber.present ? data.surahNumber.value : this.surahNumber,
      surahName: data.surahName.present ? data.surahName.value : this.surahName,
      fromVerse: data.fromVerse.present ? data.fromVerse.value : this.fromVerse,
      toVerse: data.toVerse.present ? data.toVerse.value : this.toVerse,
      rating: data.rating.present ? data.rating.value : this.rating,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecitationsTableData(')
          ..write('id: $id, ')
          ..write('studentReportId: $studentReportId, ')
          ..write('type: $type, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('surahName: $surahName, ')
          ..write('fromVerse: $fromVerse, ')
          ..write('toVerse: $toVerse, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, studentReportId, type, surahNumber,
      surahName, fromVerse, toVerse, rating, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecitationsTableData &&
          other.id == this.id &&
          other.studentReportId == this.studentReportId &&
          other.type == this.type &&
          other.surahNumber == this.surahNumber &&
          other.surahName == this.surahName &&
          other.fromVerse == this.fromVerse &&
          other.toVerse == this.toVerse &&
          other.rating == this.rating &&
          other.notes == this.notes);
}

class RecitationsTableCompanion extends UpdateCompanion<RecitationsTableData> {
  final Value<String> id;
  final Value<String> studentReportId;
  final Value<String> type;
  final Value<int> surahNumber;
  final Value<String> surahName;
  final Value<int> fromVerse;
  final Value<int> toVerse;
  final Value<int?> rating;
  final Value<String?> notes;
  final Value<int> rowid;
  const RecitationsTableCompanion({
    this.id = const Value.absent(),
    this.studentReportId = const Value.absent(),
    this.type = const Value.absent(),
    this.surahNumber = const Value.absent(),
    this.surahName = const Value.absent(),
    this.fromVerse = const Value.absent(),
    this.toVerse = const Value.absent(),
    this.rating = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecitationsTableCompanion.insert({
    required String id,
    required String studentReportId,
    required String type,
    required int surahNumber,
    required String surahName,
    required int fromVerse,
    required int toVerse,
    this.rating = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        studentReportId = Value(studentReportId),
        type = Value(type),
        surahNumber = Value(surahNumber),
        surahName = Value(surahName),
        fromVerse = Value(fromVerse),
        toVerse = Value(toVerse);
  static Insertable<RecitationsTableData> custom({
    Expression<String>? id,
    Expression<String>? studentReportId,
    Expression<String>? type,
    Expression<int>? surahNumber,
    Expression<String>? surahName,
    Expression<int>? fromVerse,
    Expression<int>? toVerse,
    Expression<int>? rating,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentReportId != null) 'student_report_id': studentReportId,
      if (type != null) 'type': type,
      if (surahNumber != null) 'surah_number': surahNumber,
      if (surahName != null) 'surah_name': surahName,
      if (fromVerse != null) 'from_verse': fromVerse,
      if (toVerse != null) 'to_verse': toVerse,
      if (rating != null) 'rating': rating,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecitationsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? studentReportId,
      Value<String>? type,
      Value<int>? surahNumber,
      Value<String>? surahName,
      Value<int>? fromVerse,
      Value<int>? toVerse,
      Value<int?>? rating,
      Value<String?>? notes,
      Value<int>? rowid}) {
    return RecitationsTableCompanion(
      id: id ?? this.id,
      studentReportId: studentReportId ?? this.studentReportId,
      type: type ?? this.type,
      surahNumber: surahNumber ?? this.surahNumber,
      surahName: surahName ?? this.surahName,
      fromVerse: fromVerse ?? this.fromVerse,
      toVerse: toVerse ?? this.toVerse,
      rating: rating ?? this.rating,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (studentReportId.present) {
      map['student_report_id'] = Variable<String>(studentReportId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (surahNumber.present) {
      map['surah_number'] = Variable<int>(surahNumber.value);
    }
    if (surahName.present) {
      map['surah_name'] = Variable<String>(surahName.value);
    }
    if (fromVerse.present) {
      map['from_verse'] = Variable<int>(fromVerse.value);
    }
    if (toVerse.present) {
      map['to_verse'] = Variable<int>(toVerse.value);
    }
    if (rating.present) {
      map['rating'] = Variable<int>(rating.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecitationsTableCompanion(')
          ..write('id: $id, ')
          ..write('studentReportId: $studentReportId, ')
          ..write('type: $type, ')
          ..write('surahNumber: $surahNumber, ')
          ..write('surahName: $surahName, ')
          ..write('fromVerse: $fromVerse, ')
          ..write('toVerse: $toVerse, ')
          ..write('rating: $rating, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CoursesTableTable extends CoursesTable
    with TableInfo<$CoursesTableTable, CoursesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CoursesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _centerIdMeta =
      const VerificationMeta('centerId');
  @override
  late final GeneratedColumn<String> centerId = GeneratedColumn<String>(
      'center_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _responsibleTeacherIdMeta =
      const VerificationMeta('responsibleTeacherId');
  @override
  late final GeneratedColumn<String> responsibleTeacherId =
      GeneratedColumn<String>('responsible_teacher_id', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _targetHalqaIdsMeta =
      const VerificationMeta('targetHalqaIds');
  @override
  late final GeneratedColumn<String> targetHalqaIds = GeneratedColumn<String>(
      'target_halqa_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _targetStudentIdsMeta =
      const VerificationMeta('targetStudentIds');
  @override
  late final GeneratedColumn<String> targetStudentIds = GeneratedColumn<String>(
      'target_student_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        image,
        centerId,
        responsibleTeacherId,
        startDate,
        endDate,
        targetHalqaIds,
        targetStudentIds,
        notes,
        isActive,
        createdAt,
        updatedAt,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'courses';
  @override
  VerificationContext validateIntegrity(Insertable<CoursesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('center_id')) {
      context.handle(_centerIdMeta,
          centerId.isAcceptableOrUnknown(data['center_id']!, _centerIdMeta));
    } else if (isInserting) {
      context.missing(_centerIdMeta);
    }
    if (data.containsKey('responsible_teacher_id')) {
      context.handle(
          _responsibleTeacherIdMeta,
          responsibleTeacherId.isAcceptableOrUnknown(
              data['responsible_teacher_id']!, _responsibleTeacherIdMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('target_halqa_ids')) {
      context.handle(
          _targetHalqaIdsMeta,
          targetHalqaIds.isAcceptableOrUnknown(
              data['target_halqa_ids']!, _targetHalqaIdsMeta));
    }
    if (data.containsKey('target_student_ids')) {
      context.handle(
          _targetStudentIdsMeta,
          targetStudentIds.isAcceptableOrUnknown(
              data['target_student_ids']!, _targetStudentIdsMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CoursesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CoursesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      centerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_id'])!,
      responsibleTeacherId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}responsible_teacher_id']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date'])!,
      targetHalqaIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_halqa_ids'])!,
      targetStudentIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_student_ids'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $CoursesTableTable createAlias(String alias) {
    return $CoursesTableTable(attachedDatabase, alias);
  }
}

class CoursesTableData extends DataClass
    implements Insertable<CoursesTableData> {
  final String id;
  final String name;
  final String? description;
  final String? image;
  final String centerId;
  final String? responsibleTeacherId;
  final DateTime startDate;
  final DateTime endDate;
  final String targetHalqaIds;
  final String targetStudentIds;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const CoursesTableData(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      required this.centerId,
      this.responsibleTeacherId,
      required this.startDate,
      required this.endDate,
      required this.targetHalqaIds,
      required this.targetStudentIds,
      this.notes,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['center_id'] = Variable<String>(centerId);
    if (!nullToAbsent || responsibleTeacherId != null) {
      map['responsible_teacher_id'] = Variable<String>(responsibleTeacherId);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    map['end_date'] = Variable<DateTime>(endDate);
    map['target_halqa_ids'] = Variable<String>(targetHalqaIds);
    map['target_student_ids'] = Variable<String>(targetStudentIds);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  CoursesTableCompanion toCompanion(bool nullToAbsent) {
    return CoursesTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      centerId: Value(centerId),
      responsibleTeacherId: responsibleTeacherId == null && nullToAbsent
          ? const Value.absent()
          : Value(responsibleTeacherId),
      startDate: Value(startDate),
      endDate: Value(endDate),
      targetHalqaIds: Value(targetHalqaIds),
      targetStudentIds: Value(targetStudentIds),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory CoursesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CoursesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      image: serializer.fromJson<String?>(json['image']),
      centerId: serializer.fromJson<String>(json['centerId']),
      responsibleTeacherId:
          serializer.fromJson<String?>(json['responsibleTeacherId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime>(json['endDate']),
      targetHalqaIds: serializer.fromJson<String>(json['targetHalqaIds']),
      targetStudentIds: serializer.fromJson<String>(json['targetStudentIds']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'image': serializer.toJson<String?>(image),
      'centerId': serializer.toJson<String>(centerId),
      'responsibleTeacherId': serializer.toJson<String?>(responsibleTeacherId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime>(endDate),
      'targetHalqaIds': serializer.toJson<String>(targetHalqaIds),
      'targetStudentIds': serializer.toJson<String>(targetStudentIds),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  CoursesTableData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> image = const Value.absent(),
          String? centerId,
          Value<String?> responsibleTeacherId = const Value.absent(),
          DateTime? startDate,
          DateTime? endDate,
          String? targetHalqaIds,
          String? targetStudentIds,
          Value<String?> notes = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      CoursesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        image: image.present ? image.value : this.image,
        centerId: centerId ?? this.centerId,
        responsibleTeacherId: responsibleTeacherId.present
            ? responsibleTeacherId.value
            : this.responsibleTeacherId,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
        targetStudentIds: targetStudentIds ?? this.targetStudentIds,
        notes: notes.present ? notes.value : this.notes,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  CoursesTableData copyWithCompanion(CoursesTableCompanion data) {
    return CoursesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
      centerId: data.centerId.present ? data.centerId.value : this.centerId,
      responsibleTeacherId: data.responsibleTeacherId.present
          ? data.responsibleTeacherId.value
          : this.responsibleTeacherId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      targetHalqaIds: data.targetHalqaIds.present
          ? data.targetHalqaIds.value
          : this.targetHalqaIds,
      targetStudentIds: data.targetStudentIds.present
          ? data.targetStudentIds.value
          : this.targetStudentIds,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CoursesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('centerId: $centerId, ')
          ..write('responsibleTeacherId: $responsibleTeacherId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('targetStudentIds: $targetStudentIds, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      image,
      centerId,
      responsibleTeacherId,
      startDate,
      endDate,
      targetHalqaIds,
      targetStudentIds,
      notes,
      isActive,
      createdAt,
      updatedAt,
      syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CoursesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.image == this.image &&
          other.centerId == this.centerId &&
          other.responsibleTeacherId == this.responsibleTeacherId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.targetHalqaIds == this.targetHalqaIds &&
          other.targetStudentIds == this.targetStudentIds &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class CoursesTableCompanion extends UpdateCompanion<CoursesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> image;
  final Value<String> centerId;
  final Value<String?> responsibleTeacherId;
  final Value<DateTime> startDate;
  final Value<DateTime> endDate;
  final Value<String> targetHalqaIds;
  final Value<String> targetStudentIds;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const CoursesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.centerId = const Value.absent(),
    this.responsibleTeacherId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.targetHalqaIds = const Value.absent(),
    this.targetStudentIds = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CoursesTableCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    required String centerId,
    this.responsibleTeacherId = const Value.absent(),
    required DateTime startDate,
    required DateTime endDate,
    this.targetHalqaIds = const Value.absent(),
    this.targetStudentIds = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        centerId = Value(centerId),
        startDate = Value(startDate),
        endDate = Value(endDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<CoursesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? image,
    Expression<String>? centerId,
    Expression<String>? responsibleTeacherId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? targetHalqaIds,
    Expression<String>? targetStudentIds,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (centerId != null) 'center_id': centerId,
      if (responsibleTeacherId != null)
        'responsible_teacher_id': responsibleTeacherId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (targetHalqaIds != null) 'target_halqa_ids': targetHalqaIds,
      if (targetStudentIds != null) 'target_student_ids': targetStudentIds,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CoursesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? image,
      Value<String>? centerId,
      Value<String?>? responsibleTeacherId,
      Value<DateTime>? startDate,
      Value<DateTime>? endDate,
      Value<String>? targetHalqaIds,
      Value<String>? targetStudentIds,
      Value<String?>? notes,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return CoursesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      centerId: centerId ?? this.centerId,
      responsibleTeacherId: responsibleTeacherId ?? this.responsibleTeacherId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
      targetStudentIds: targetStudentIds ?? this.targetStudentIds,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (centerId.present) {
      map['center_id'] = Variable<String>(centerId.value);
    }
    if (responsibleTeacherId.present) {
      map['responsible_teacher_id'] =
          Variable<String>(responsibleTeacherId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (targetHalqaIds.present) {
      map['target_halqa_ids'] = Variable<String>(targetHalqaIds.value);
    }
    if (targetStudentIds.present) {
      map['target_student_ids'] = Variable<String>(targetStudentIds.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CoursesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('centerId: $centerId, ')
          ..write('responsibleTeacherId: $responsibleTeacherId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('targetStudentIds: $targetStudentIds, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ActivitiesTableTable extends ActivitiesTable
    with TableInfo<$ActivitiesTableTable, ActivitiesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivitiesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _centerIdMeta =
      const VerificationMeta('centerId');
  @override
  late final GeneratedColumn<String> centerId = GeneratedColumn<String>(
      'center_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
      'start_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
      'end_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _targetHalqaIdsMeta =
      const VerificationMeta('targetHalqaIds');
  @override
  late final GeneratedColumn<String> targetHalqaIds = GeneratedColumn<String>(
      'target_halqa_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
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
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activities';
  @override
  VerificationContext validateIntegrity(
      Insertable<ActivitiesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('center_id')) {
      context.handle(_centerIdMeta,
          centerId.isAcceptableOrUnknown(data['center_id']!, _centerIdMeta));
    } else if (isInserting) {
      context.missing(_centerIdMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('target_halqa_ids')) {
      context.handle(
          _targetHalqaIdsMeta,
          targetHalqaIds.isAcceptableOrUnknown(
              data['target_halqa_ids']!, _targetHalqaIdsMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ActivitiesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivitiesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      centerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_id'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_time'])!,
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_time'])!,
      targetHalqaIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_halqa_ids'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $ActivitiesTableTable createAlias(String alias) {
    return $ActivitiesTableTable(attachedDatabase, alias);
  }
}

class ActivitiesTableData extends DataClass
    implements Insertable<ActivitiesTableData> {
  final String id;
  final String name;
  final String? description;
  final String? image;
  final String centerId;
  final String? location;
  final DateTime startDate;
  final DateTime startTime;
  final DateTime endTime;
  final String targetHalqaIds;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const ActivitiesTableData(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      required this.centerId,
      this.location,
      required this.startDate,
      required this.startTime,
      required this.endTime,
      required this.targetHalqaIds,
      this.notes,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['center_id'] = Variable<String>(centerId);
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    map['start_date'] = Variable<DateTime>(startDate);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    map['target_halqa_ids'] = Variable<String>(targetHalqaIds);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  ActivitiesTableCompanion toCompanion(bool nullToAbsent) {
    return ActivitiesTableCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      centerId: Value(centerId),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      startDate: Value(startDate),
      startTime: Value(startTime),
      endTime: Value(endTime),
      targetHalqaIds: Value(targetHalqaIds),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory ActivitiesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivitiesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      image: serializer.fromJson<String?>(json['image']),
      centerId: serializer.fromJson<String>(json['centerId']),
      location: serializer.fromJson<String?>(json['location']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      targetHalqaIds: serializer.fromJson<String>(json['targetHalqaIds']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'image': serializer.toJson<String?>(image),
      'centerId': serializer.toJson<String>(centerId),
      'location': serializer.toJson<String?>(location),
      'startDate': serializer.toJson<DateTime>(startDate),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'targetHalqaIds': serializer.toJson<String>(targetHalqaIds),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  ActivitiesTableData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> image = const Value.absent(),
          String? centerId,
          Value<String?> location = const Value.absent(),
          DateTime? startDate,
          DateTime? startTime,
          DateTime? endTime,
          String? targetHalqaIds,
          Value<String?> notes = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      ActivitiesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        image: image.present ? image.value : this.image,
        centerId: centerId ?? this.centerId,
        location: location.present ? location.value : this.location,
        startDate: startDate ?? this.startDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
        notes: notes.present ? notes.value : this.notes,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  ActivitiesTableData copyWithCompanion(ActivitiesTableCompanion data) {
    return ActivitiesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
      centerId: data.centerId.present ? data.centerId.value : this.centerId,
      location: data.location.present ? data.location.value : this.location,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      targetHalqaIds: data.targetHalqaIds.present
          ? data.targetHalqaIds.value
          : this.targetHalqaIds,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivitiesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('centerId: $centerId, ')
          ..write('location: $location, ')
          ..write('startDate: $startDate, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivitiesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.image == this.image &&
          other.centerId == this.centerId &&
          other.location == this.location &&
          other.startDate == this.startDate &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.targetHalqaIds == this.targetHalqaIds &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class ActivitiesTableCompanion extends UpdateCompanion<ActivitiesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> image;
  final Value<String> centerId;
  final Value<String?> location;
  final Value<DateTime> startDate;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<String> targetHalqaIds;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const ActivitiesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.centerId = const Value.absent(),
    this.location = const Value.absent(),
    this.startDate = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.targetHalqaIds = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ActivitiesTableCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    required String centerId,
    this.location = const Value.absent(),
    required DateTime startDate,
    required DateTime startTime,
    required DateTime endTime,
    this.targetHalqaIds = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        centerId = Value(centerId),
        startDate = Value(startDate),
        startTime = Value(startTime),
        endTime = Value(endTime),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ActivitiesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? image,
    Expression<String>? centerId,
    Expression<String>? location,
    Expression<DateTime>? startDate,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? targetHalqaIds,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (centerId != null) 'center_id': centerId,
      if (location != null) 'location': location,
      if (startDate != null) 'start_date': startDate,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (targetHalqaIds != null) 'target_halqa_ids': targetHalqaIds,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ActivitiesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? image,
      Value<String>? centerId,
      Value<String?>? location,
      Value<DateTime>? startDate,
      Value<DateTime>? startTime,
      Value<DateTime>? endTime,
      Value<String>? targetHalqaIds,
      Value<String?>? notes,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return ActivitiesTableCompanion(
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (centerId.present) {
      map['center_id'] = Variable<String>(centerId.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (targetHalqaIds.present) {
      map['target_halqa_ids'] = Variable<String>(targetHalqaIds.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivitiesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('centerId: $centerId, ')
          ..write('location: $location, ')
          ..write('startDate: $startDate, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FeesTableTable extends FeesTable
    with TableInfo<$FeesTableTable, FeesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _centerIdMeta =
      const VerificationMeta('centerId');
  @override
  late final GeneratedColumn<String> centerId = GeneratedColumn<String>(
      'center_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _monthMeta = const VerificationMeta('month');
  @override
  late final GeneratedColumn<int> month = GeneratedColumn<int>(
      'month', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<int> day = GeneratedColumn<int>(
      'day', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _targetHalqaIdsMeta =
      const VerificationMeta('targetHalqaIds');
  @override
  late final GeneratedColumn<String> targetHalqaIds = GeneratedColumn<String>(
      'target_halqa_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
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
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fees';
  @override
  VerificationContext validateIntegrity(Insertable<FeesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('center_id')) {
      context.handle(_centerIdMeta,
          centerId.isAcceptableOrUnknown(data['center_id']!, _centerIdMeta));
    } else if (isInserting) {
      context.missing(_centerIdMeta);
    }
    if (data.containsKey('month')) {
      context.handle(
          _monthMeta, month.isAcceptableOrUnknown(data['month']!, _monthMeta));
    } else if (isInserting) {
      context.missing(_monthMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
          _dayMeta, day.isAcceptableOrUnknown(data['day']!, _dayMeta));
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('target_halqa_ids')) {
      context.handle(
          _targetHalqaIdsMeta,
          targetHalqaIds.isAcceptableOrUnknown(
              data['target_halqa_ids']!, _targetHalqaIdsMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      centerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_id'])!,
      month: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}month'])!,
      day: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}day'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      targetHalqaIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_halqa_ids'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $FeesTableTable createAlias(String alias) {
    return $FeesTableTable(attachedDatabase, alias);
  }
}

class FeesTableData extends DataClass implements Insertable<FeesTableData> {
  final String id;
  final String name;
  final String centerId;
  final int month;
  final int day;
  final double amount;
  final String targetHalqaIds;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const FeesTableData(
      {required this.id,
      required this.name,
      required this.centerId,
      required this.month,
      required this.day,
      required this.amount,
      required this.targetHalqaIds,
      this.notes,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['center_id'] = Variable<String>(centerId);
    map['month'] = Variable<int>(month);
    map['day'] = Variable<int>(day);
    map['amount'] = Variable<double>(amount);
    map['target_halqa_ids'] = Variable<String>(targetHalqaIds);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  FeesTableCompanion toCompanion(bool nullToAbsent) {
    return FeesTableCompanion(
      id: Value(id),
      name: Value(name),
      centerId: Value(centerId),
      month: Value(month),
      day: Value(day),
      amount: Value(amount),
      targetHalqaIds: Value(targetHalqaIds),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory FeesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      centerId: serializer.fromJson<String>(json['centerId']),
      month: serializer.fromJson<int>(json['month']),
      day: serializer.fromJson<int>(json['day']),
      amount: serializer.fromJson<double>(json['amount']),
      targetHalqaIds: serializer.fromJson<String>(json['targetHalqaIds']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'centerId': serializer.toJson<String>(centerId),
      'month': serializer.toJson<int>(month),
      'day': serializer.toJson<int>(day),
      'amount': serializer.toJson<double>(amount),
      'targetHalqaIds': serializer.toJson<String>(targetHalqaIds),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  FeesTableData copyWith(
          {String? id,
          String? name,
          String? centerId,
          int? month,
          int? day,
          double? amount,
          String? targetHalqaIds,
          Value<String?> notes = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      FeesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        centerId: centerId ?? this.centerId,
        month: month ?? this.month,
        day: day ?? this.day,
        amount: amount ?? this.amount,
        targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
        notes: notes.present ? notes.value : this.notes,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  FeesTableData copyWithCompanion(FeesTableCompanion data) {
    return FeesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      centerId: data.centerId.present ? data.centerId.value : this.centerId,
      month: data.month.present ? data.month.value : this.month,
      day: data.day.present ? data.day.value : this.day,
      amount: data.amount.present ? data.amount.value : this.amount,
      targetHalqaIds: data.targetHalqaIds.present
          ? data.targetHalqaIds.value
          : this.targetHalqaIds,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('centerId: $centerId, ')
          ..write('month: $month, ')
          ..write('day: $day, ')
          ..write('amount: $amount, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, centerId, month, day, amount,
      targetHalqaIds, notes, isActive, createdAt, updatedAt, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.centerId == this.centerId &&
          other.month == this.month &&
          other.day == this.day &&
          other.amount == this.amount &&
          other.targetHalqaIds == this.targetHalqaIds &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class FeesTableCompanion extends UpdateCompanion<FeesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> centerId;
  final Value<int> month;
  final Value<int> day;
  final Value<double> amount;
  final Value<String> targetHalqaIds;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const FeesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.centerId = const Value.absent(),
    this.month = const Value.absent(),
    this.day = const Value.absent(),
    this.amount = const Value.absent(),
    this.targetHalqaIds = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeesTableCompanion.insert({
    required String id,
    required String name,
    required String centerId,
    required int month,
    required int day,
    required double amount,
    this.targetHalqaIds = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        centerId = Value(centerId),
        month = Value(month),
        day = Value(day),
        amount = Value(amount),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<FeesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? centerId,
    Expression<int>? month,
    Expression<int>? day,
    Expression<double>? amount,
    Expression<String>? targetHalqaIds,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (centerId != null) 'center_id': centerId,
      if (month != null) 'month': month,
      if (day != null) 'day': day,
      if (amount != null) 'amount': amount,
      if (targetHalqaIds != null) 'target_halqa_ids': targetHalqaIds,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? centerId,
      Value<int>? month,
      Value<int>? day,
      Value<double>? amount,
      Value<String>? targetHalqaIds,
      Value<String?>? notes,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return FeesTableCompanion(
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (centerId.present) {
      map['center_id'] = Variable<String>(centerId.value);
    }
    if (month.present) {
      map['month'] = Variable<int>(month.value);
    }
    if (day.present) {
      map['day'] = Variable<int>(day.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (targetHalqaIds.present) {
      map['target_halqa_ids'] = Variable<String>(targetHalqaIds.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('centerId: $centerId, ')
          ..write('month: $month, ')
          ..write('day: $day, ')
          ..write('amount: $amount, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FeePaymentsTableTable extends FeePaymentsTable
    with TableInfo<$FeePaymentsTableTable, FeePaymentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FeePaymentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _feeIdMeta = const VerificationMeta('feeId');
  @override
  late final GeneratedColumn<String> feeId = GeneratedColumn<String>(
      'fee_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _studentIdMeta =
      const VerificationMeta('studentId');
  @override
  late final GeneratedColumn<String> studentId = GeneratedColumn<String>(
      'student_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _halqaIdMeta =
      const VerificationMeta('halqaId');
  @override
  late final GeneratedColumn<String> halqaId = GeneratedColumn<String>(
      'halqa_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('unpaid'));
  static const VerificationMeta _paidAmountMeta =
      const VerificationMeta('paidAmount');
  @override
  late final GeneratedColumn<double> paidAmount = GeneratedColumn<double>(
      'paid_amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _paidAtMeta = const VerificationMeta('paidAt');
  @override
  late final GeneratedColumn<DateTime> paidAt = GeneratedColumn<DateTime>(
      'paid_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _confirmedByMeta =
      const VerificationMeta('confirmedBy');
  @override
  late final GeneratedColumn<String> confirmedBy = GeneratedColumn<String>(
      'confirmed_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        feeId,
        studentId,
        halqaId,
        status,
        paidAmount,
        paidAt,
        confirmedBy,
        notes,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'fee_payments';
  @override
  VerificationContext validateIntegrity(
      Insertable<FeePaymentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('fee_id')) {
      context.handle(
          _feeIdMeta, feeId.isAcceptableOrUnknown(data['fee_id']!, _feeIdMeta));
    } else if (isInserting) {
      context.missing(_feeIdMeta);
    }
    if (data.containsKey('student_id')) {
      context.handle(_studentIdMeta,
          studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta));
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('halqa_id')) {
      context.handle(_halqaIdMeta,
          halqaId.isAcceptableOrUnknown(data['halqa_id']!, _halqaIdMeta));
    } else if (isInserting) {
      context.missing(_halqaIdMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('paid_amount')) {
      context.handle(
          _paidAmountMeta,
          paidAmount.isAcceptableOrUnknown(
              data['paid_amount']!, _paidAmountMeta));
    }
    if (data.containsKey('paid_at')) {
      context.handle(_paidAtMeta,
          paidAt.isAcceptableOrUnknown(data['paid_at']!, _paidAtMeta));
    }
    if (data.containsKey('confirmed_by')) {
      context.handle(
          _confirmedByMeta,
          confirmedBy.isAcceptableOrUnknown(
              data['confirmed_by']!, _confirmedByMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FeePaymentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FeePaymentsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      feeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}fee_id'])!,
      studentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}student_id'])!,
      halqaId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}halqa_id'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      paidAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}paid_amount']),
      paidAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}paid_at']),
      confirmedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}confirmed_by']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $FeePaymentsTableTable createAlias(String alias) {
    return $FeePaymentsTableTable(attachedDatabase, alias);
  }
}

class FeePaymentsTableData extends DataClass
    implements Insertable<FeePaymentsTableData> {
  final String id;
  final String feeId;
  final String studentId;
  final String halqaId;
  final String status;
  final double? paidAmount;
  final DateTime? paidAt;
  final String? confirmedBy;
  final String? notes;
  final String syncStatus;
  const FeePaymentsTableData(
      {required this.id,
      required this.feeId,
      required this.studentId,
      required this.halqaId,
      required this.status,
      this.paidAmount,
      this.paidAt,
      this.confirmedBy,
      this.notes,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['fee_id'] = Variable<String>(feeId);
    map['student_id'] = Variable<String>(studentId);
    map['halqa_id'] = Variable<String>(halqaId);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || paidAmount != null) {
      map['paid_amount'] = Variable<double>(paidAmount);
    }
    if (!nullToAbsent || paidAt != null) {
      map['paid_at'] = Variable<DateTime>(paidAt);
    }
    if (!nullToAbsent || confirmedBy != null) {
      map['confirmed_by'] = Variable<String>(confirmedBy);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  FeePaymentsTableCompanion toCompanion(bool nullToAbsent) {
    return FeePaymentsTableCompanion(
      id: Value(id),
      feeId: Value(feeId),
      studentId: Value(studentId),
      halqaId: Value(halqaId),
      status: Value(status),
      paidAmount: paidAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(paidAmount),
      paidAt:
          paidAt == null && nullToAbsent ? const Value.absent() : Value(paidAt),
      confirmedBy: confirmedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(confirmedBy),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      syncStatus: Value(syncStatus),
    );
  }

  factory FeePaymentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FeePaymentsTableData(
      id: serializer.fromJson<String>(json['id']),
      feeId: serializer.fromJson<String>(json['feeId']),
      studentId: serializer.fromJson<String>(json['studentId']),
      halqaId: serializer.fromJson<String>(json['halqaId']),
      status: serializer.fromJson<String>(json['status']),
      paidAmount: serializer.fromJson<double?>(json['paidAmount']),
      paidAt: serializer.fromJson<DateTime?>(json['paidAt']),
      confirmedBy: serializer.fromJson<String?>(json['confirmedBy']),
      notes: serializer.fromJson<String?>(json['notes']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'feeId': serializer.toJson<String>(feeId),
      'studentId': serializer.toJson<String>(studentId),
      'halqaId': serializer.toJson<String>(halqaId),
      'status': serializer.toJson<String>(status),
      'paidAmount': serializer.toJson<double?>(paidAmount),
      'paidAt': serializer.toJson<DateTime?>(paidAt),
      'confirmedBy': serializer.toJson<String?>(confirmedBy),
      'notes': serializer.toJson<String?>(notes),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  FeePaymentsTableData copyWith(
          {String? id,
          String? feeId,
          String? studentId,
          String? halqaId,
          String? status,
          Value<double?> paidAmount = const Value.absent(),
          Value<DateTime?> paidAt = const Value.absent(),
          Value<String?> confirmedBy = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          String? syncStatus}) =>
      FeePaymentsTableData(
        id: id ?? this.id,
        feeId: feeId ?? this.feeId,
        studentId: studentId ?? this.studentId,
        halqaId: halqaId ?? this.halqaId,
        status: status ?? this.status,
        paidAmount: paidAmount.present ? paidAmount.value : this.paidAmount,
        paidAt: paidAt.present ? paidAt.value : this.paidAt,
        confirmedBy: confirmedBy.present ? confirmedBy.value : this.confirmedBy,
        notes: notes.present ? notes.value : this.notes,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  FeePaymentsTableData copyWithCompanion(FeePaymentsTableCompanion data) {
    return FeePaymentsTableData(
      id: data.id.present ? data.id.value : this.id,
      feeId: data.feeId.present ? data.feeId.value : this.feeId,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      halqaId: data.halqaId.present ? data.halqaId.value : this.halqaId,
      status: data.status.present ? data.status.value : this.status,
      paidAmount:
          data.paidAmount.present ? data.paidAmount.value : this.paidAmount,
      paidAt: data.paidAt.present ? data.paidAt.value : this.paidAt,
      confirmedBy:
          data.confirmedBy.present ? data.confirmedBy.value : this.confirmedBy,
      notes: data.notes.present ? data.notes.value : this.notes,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FeePaymentsTableData(')
          ..write('id: $id, ')
          ..write('feeId: $feeId, ')
          ..write('studentId: $studentId, ')
          ..write('halqaId: $halqaId, ')
          ..write('status: $status, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('paidAt: $paidAt, ')
          ..write('confirmedBy: $confirmedBy, ')
          ..write('notes: $notes, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, feeId, studentId, halqaId, status,
      paidAmount, paidAt, confirmedBy, notes, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FeePaymentsTableData &&
          other.id == this.id &&
          other.feeId == this.feeId &&
          other.studentId == this.studentId &&
          other.halqaId == this.halqaId &&
          other.status == this.status &&
          other.paidAmount == this.paidAmount &&
          other.paidAt == this.paidAt &&
          other.confirmedBy == this.confirmedBy &&
          other.notes == this.notes &&
          other.syncStatus == this.syncStatus);
}

class FeePaymentsTableCompanion extends UpdateCompanion<FeePaymentsTableData> {
  final Value<String> id;
  final Value<String> feeId;
  final Value<String> studentId;
  final Value<String> halqaId;
  final Value<String> status;
  final Value<double?> paidAmount;
  final Value<DateTime?> paidAt;
  final Value<String?> confirmedBy;
  final Value<String?> notes;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const FeePaymentsTableCompanion({
    this.id = const Value.absent(),
    this.feeId = const Value.absent(),
    this.studentId = const Value.absent(),
    this.halqaId = const Value.absent(),
    this.status = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.confirmedBy = const Value.absent(),
    this.notes = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FeePaymentsTableCompanion.insert({
    required String id,
    required String feeId,
    required String studentId,
    required String halqaId,
    this.status = const Value.absent(),
    this.paidAmount = const Value.absent(),
    this.paidAt = const Value.absent(),
    this.confirmedBy = const Value.absent(),
    this.notes = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        feeId = Value(feeId),
        studentId = Value(studentId),
        halqaId = Value(halqaId);
  static Insertable<FeePaymentsTableData> custom({
    Expression<String>? id,
    Expression<String>? feeId,
    Expression<String>? studentId,
    Expression<String>? halqaId,
    Expression<String>? status,
    Expression<double>? paidAmount,
    Expression<DateTime>? paidAt,
    Expression<String>? confirmedBy,
    Expression<String>? notes,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (feeId != null) 'fee_id': feeId,
      if (studentId != null) 'student_id': studentId,
      if (halqaId != null) 'halqa_id': halqaId,
      if (status != null) 'status': status,
      if (paidAmount != null) 'paid_amount': paidAmount,
      if (paidAt != null) 'paid_at': paidAt,
      if (confirmedBy != null) 'confirmed_by': confirmedBy,
      if (notes != null) 'notes': notes,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FeePaymentsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? feeId,
      Value<String>? studentId,
      Value<String>? halqaId,
      Value<String>? status,
      Value<double?>? paidAmount,
      Value<DateTime?>? paidAt,
      Value<String?>? confirmedBy,
      Value<String?>? notes,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return FeePaymentsTableCompanion(
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (feeId.present) {
      map['fee_id'] = Variable<String>(feeId.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<String>(studentId.value);
    }
    if (halqaId.present) {
      map['halqa_id'] = Variable<String>(halqaId.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (paidAmount.present) {
      map['paid_amount'] = Variable<double>(paidAmount.value);
    }
    if (paidAt.present) {
      map['paid_at'] = Variable<DateTime>(paidAt.value);
    }
    if (confirmedBy.present) {
      map['confirmed_by'] = Variable<String>(confirmedBy.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FeePaymentsTableCompanion(')
          ..write('id: $id, ')
          ..write('feeId: $feeId, ')
          ..write('studentId: $studentId, ')
          ..write('halqaId: $halqaId, ')
          ..write('status: $status, ')
          ..write('paidAmount: $paidAmount, ')
          ..write('paidAt: $paidAt, ')
          ..write('confirmedBy: $confirmedBy, ')
          ..write('notes: $notes, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $HolidaysTableTable extends HolidaysTable
    with TableInfo<$HolidaysTableTable, HolidaysTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HolidaysTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _centerIdMeta =
      const VerificationMeta('centerId');
  @override
  late final GeneratedColumn<String> centerId = GeneratedColumn<String>(
      'center_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _targetHalqaIdsMeta =
      const VerificationMeta('targetHalqaIds');
  @override
  late final GeneratedColumn<String> targetHalqaIds = GeneratedColumn<String>(
      'target_halqa_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _isRecurringMeta =
      const VerificationMeta('isRecurring');
  @override
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
      'is_recurring', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_recurring" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('approved'));
  static const VerificationMeta _requestedByMeta =
      const VerificationMeta('requestedBy');
  @override
  late final GeneratedColumn<String> requestedBy = GeneratedColumn<String>(
      'requested_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _approvedByMeta =
      const VerificationMeta('approvedBy');
  @override
  late final GeneratedColumn<String> approvedBy = GeneratedColumn<String>(
      'approved_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
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
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'holidays';
  @override
  VerificationContext validateIntegrity(Insertable<HolidaysTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('center_id')) {
      context.handle(_centerIdMeta,
          centerId.isAcceptableOrUnknown(data['center_id']!, _centerIdMeta));
    } else if (isInserting) {
      context.missing(_centerIdMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('target_halqa_ids')) {
      context.handle(
          _targetHalqaIdsMeta,
          targetHalqaIds.isAcceptableOrUnknown(
              data['target_halqa_ids']!, _targetHalqaIdsMeta));
    }
    if (data.containsKey('is_recurring')) {
      context.handle(
          _isRecurringMeta,
          isRecurring.isAcceptableOrUnknown(
              data['is_recurring']!, _isRecurringMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('requested_by')) {
      context.handle(
          _requestedByMeta,
          requestedBy.isAcceptableOrUnknown(
              data['requested_by']!, _requestedByMeta));
    }
    if (data.containsKey('approved_by')) {
      context.handle(
          _approvedByMeta,
          approvedBy.isAcceptableOrUnknown(
              data['approved_by']!, _approvedByMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HolidaysTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HolidaysTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      centerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_id'])!,
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date'])!,
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      targetHalqaIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_halqa_ids'])!,
      isRecurring: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_recurring'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      requestedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}requested_by']),
      approvedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}approved_by']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $HolidaysTableTable createAlias(String alias) {
    return $HolidaysTableTable(attachedDatabase, alias);
  }
}

class HolidaysTableData extends DataClass
    implements Insertable<HolidaysTableData> {
  final String id;
  final String name;
  final String centerId;
  final DateTime startDate;
  final DateTime? endDate;
  final String targetHalqaIds;
  final bool isRecurring;
  final String? notes;
  final String status;
  final String? requestedBy;
  final String? approvedBy;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const HolidaysTableData(
      {required this.id,
      required this.name,
      required this.centerId,
      required this.startDate,
      this.endDate,
      required this.targetHalqaIds,
      required this.isRecurring,
      this.notes,
      required this.status,
      this.requestedBy,
      this.approvedBy,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['center_id'] = Variable<String>(centerId);
    map['start_date'] = Variable<DateTime>(startDate);
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['target_halqa_ids'] = Variable<String>(targetHalqaIds);
    map['is_recurring'] = Variable<bool>(isRecurring);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || requestedBy != null) {
      map['requested_by'] = Variable<String>(requestedBy);
    }
    if (!nullToAbsent || approvedBy != null) {
      map['approved_by'] = Variable<String>(approvedBy);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  HolidaysTableCompanion toCompanion(bool nullToAbsent) {
    return HolidaysTableCompanion(
      id: Value(id),
      name: Value(name),
      centerId: Value(centerId),
      startDate: Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      targetHalqaIds: Value(targetHalqaIds),
      isRecurring: Value(isRecurring),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      status: Value(status),
      requestedBy: requestedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(requestedBy),
      approvedBy: approvedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(approvedBy),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory HolidaysTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HolidaysTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      centerId: serializer.fromJson<String>(json['centerId']),
      startDate: serializer.fromJson<DateTime>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      targetHalqaIds: serializer.fromJson<String>(json['targetHalqaIds']),
      isRecurring: serializer.fromJson<bool>(json['isRecurring']),
      notes: serializer.fromJson<String?>(json['notes']),
      status: serializer.fromJson<String>(json['status']),
      requestedBy: serializer.fromJson<String?>(json['requestedBy']),
      approvedBy: serializer.fromJson<String?>(json['approvedBy']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'centerId': serializer.toJson<String>(centerId),
      'startDate': serializer.toJson<DateTime>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'targetHalqaIds': serializer.toJson<String>(targetHalqaIds),
      'isRecurring': serializer.toJson<bool>(isRecurring),
      'notes': serializer.toJson<String?>(notes),
      'status': serializer.toJson<String>(status),
      'requestedBy': serializer.toJson<String?>(requestedBy),
      'approvedBy': serializer.toJson<String?>(approvedBy),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  HolidaysTableData copyWith(
          {String? id,
          String? name,
          String? centerId,
          DateTime? startDate,
          Value<DateTime?> endDate = const Value.absent(),
          String? targetHalqaIds,
          bool? isRecurring,
          Value<String?> notes = const Value.absent(),
          String? status,
          Value<String?> requestedBy = const Value.absent(),
          Value<String?> approvedBy = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      HolidaysTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        centerId: centerId ?? this.centerId,
        startDate: startDate ?? this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        targetHalqaIds: targetHalqaIds ?? this.targetHalqaIds,
        isRecurring: isRecurring ?? this.isRecurring,
        notes: notes.present ? notes.value : this.notes,
        status: status ?? this.status,
        requestedBy: requestedBy.present ? requestedBy.value : this.requestedBy,
        approvedBy: approvedBy.present ? approvedBy.value : this.approvedBy,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  HolidaysTableData copyWithCompanion(HolidaysTableCompanion data) {
    return HolidaysTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      centerId: data.centerId.present ? data.centerId.value : this.centerId,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      targetHalqaIds: data.targetHalqaIds.present
          ? data.targetHalqaIds.value
          : this.targetHalqaIds,
      isRecurring:
          data.isRecurring.present ? data.isRecurring.value : this.isRecurring,
      notes: data.notes.present ? data.notes.value : this.notes,
      status: data.status.present ? data.status.value : this.status,
      requestedBy:
          data.requestedBy.present ? data.requestedBy.value : this.requestedBy,
      approvedBy:
          data.approvedBy.present ? data.approvedBy.value : this.approvedBy,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HolidaysTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('centerId: $centerId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('requestedBy: $requestedBy, ')
          ..write('approvedBy: $approvedBy, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HolidaysTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.centerId == this.centerId &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.targetHalqaIds == this.targetHalqaIds &&
          other.isRecurring == this.isRecurring &&
          other.notes == this.notes &&
          other.status == this.status &&
          other.requestedBy == this.requestedBy &&
          other.approvedBy == this.approvedBy &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class HolidaysTableCompanion extends UpdateCompanion<HolidaysTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> centerId;
  final Value<DateTime> startDate;
  final Value<DateTime?> endDate;
  final Value<String> targetHalqaIds;
  final Value<bool> isRecurring;
  final Value<String?> notes;
  final Value<String> status;
  final Value<String?> requestedBy;
  final Value<String?> approvedBy;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const HolidaysTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.centerId = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.targetHalqaIds = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.requestedBy = const Value.absent(),
    this.approvedBy = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HolidaysTableCompanion.insert({
    required String id,
    required String name,
    required String centerId,
    required DateTime startDate,
    this.endDate = const Value.absent(),
    this.targetHalqaIds = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.notes = const Value.absent(),
    this.status = const Value.absent(),
    this.requestedBy = const Value.absent(),
    this.approvedBy = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        centerId = Value(centerId),
        startDate = Value(startDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<HolidaysTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? centerId,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? targetHalqaIds,
    Expression<bool>? isRecurring,
    Expression<String>? notes,
    Expression<String>? status,
    Expression<String>? requestedBy,
    Expression<String>? approvedBy,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (centerId != null) 'center_id': centerId,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (targetHalqaIds != null) 'target_halqa_ids': targetHalqaIds,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (notes != null) 'notes': notes,
      if (status != null) 'status': status,
      if (requestedBy != null) 'requested_by': requestedBy,
      if (approvedBy != null) 'approved_by': approvedBy,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HolidaysTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? centerId,
      Value<DateTime>? startDate,
      Value<DateTime?>? endDate,
      Value<String>? targetHalqaIds,
      Value<bool>? isRecurring,
      Value<String?>? notes,
      Value<String>? status,
      Value<String?>? requestedBy,
      Value<String?>? approvedBy,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return HolidaysTableCompanion(
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (centerId.present) {
      map['center_id'] = Variable<String>(centerId.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (targetHalqaIds.present) {
      map['target_halqa_ids'] = Variable<String>(targetHalqaIds.value);
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (requestedBy.present) {
      map['requested_by'] = Variable<String>(requestedBy.value);
    }
    if (approvedBy.present) {
      map['approved_by'] = Variable<String>(approvedBy.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HolidaysTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('centerId: $centerId, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('notes: $notes, ')
          ..write('status: $status, ')
          ..write('requestedBy: $requestedBy, ')
          ..write('approvedBy: $approvedBy, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AnnouncementsTableTable extends AnnouncementsTable
    with TableInfo<$AnnouncementsTableTable, AnnouncementsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AnnouncementsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _centerIdMeta =
      const VerificationMeta('centerId');
  @override
  late final GeneratedColumn<String> centerId = GeneratedColumn<String>(
      'center_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
      'scope', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('all'));
  static const VerificationMeta _targetHalqaIdsMeta =
      const VerificationMeta('targetHalqaIds');
  @override
  late final GeneratedColumn<String> targetHalqaIds = GeneratedColumn<String>(
      'target_halqa_ids', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  @override
  List<GeneratedColumn> get $columns => [
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
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'announcements';
  @override
  VerificationContext validateIntegrity(
      Insertable<AnnouncementsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('center_id')) {
      context.handle(_centerIdMeta,
          centerId.isAcceptableOrUnknown(data['center_id']!, _centerIdMeta));
    } else if (isInserting) {
      context.missing(_centerIdMeta);
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
          _scopeMeta, scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta));
    }
    if (data.containsKey('target_halqa_ids')) {
      context.handle(
          _targetHalqaIdsMeta,
          targetHalqaIds.isAcceptableOrUnknown(
              data['target_halqa_ids']!, _targetHalqaIdsMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AnnouncementsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AnnouncementsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      centerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_id'])!,
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])!,
      scope: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scope'])!,
      targetHalqaIds: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}target_halqa_ids']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $AnnouncementsTableTable createAlias(String alias) {
    return $AnnouncementsTableTable(attachedDatabase, alias);
  }
}

class AnnouncementsTableData extends DataClass
    implements Insertable<AnnouncementsTableData> {
  final String id;
  final String title;
  final String content;
  final String? image;
  final String centerId;
  final String createdBy;
  final String scope;
  final String? targetHalqaIds;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String syncStatus;
  const AnnouncementsTableData(
      {required this.id,
      required this.title,
      required this.content,
      this.image,
      required this.centerId,
      required this.createdBy,
      required this.scope,
      this.targetHalqaIds,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['content'] = Variable<String>(content);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['center_id'] = Variable<String>(centerId);
    map['created_by'] = Variable<String>(createdBy);
    map['scope'] = Variable<String>(scope);
    if (!nullToAbsent || targetHalqaIds != null) {
      map['target_halqa_ids'] = Variable<String>(targetHalqaIds);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['sync_status'] = Variable<String>(syncStatus);
    return map;
  }

  AnnouncementsTableCompanion toCompanion(bool nullToAbsent) {
    return AnnouncementsTableCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      centerId: Value(centerId),
      createdBy: Value(createdBy),
      scope: Value(scope),
      targetHalqaIds: targetHalqaIds == null && nullToAbsent
          ? const Value.absent()
          : Value(targetHalqaIds),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory AnnouncementsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AnnouncementsTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      image: serializer.fromJson<String?>(json['image']),
      centerId: serializer.fromJson<String>(json['centerId']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      scope: serializer.fromJson<String>(json['scope']),
      targetHalqaIds: serializer.fromJson<String?>(json['targetHalqaIds']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'image': serializer.toJson<String?>(image),
      'centerId': serializer.toJson<String>(centerId),
      'createdBy': serializer.toJson<String>(createdBy),
      'scope': serializer.toJson<String>(scope),
      'targetHalqaIds': serializer.toJson<String?>(targetHalqaIds),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'syncStatus': serializer.toJson<String>(syncStatus),
    };
  }

  AnnouncementsTableData copyWith(
          {String? id,
          String? title,
          String? content,
          Value<String?> image = const Value.absent(),
          String? centerId,
          String? createdBy,
          String? scope,
          Value<String?> targetHalqaIds = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          String? syncStatus}) =>
      AnnouncementsTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        content: content ?? this.content,
        image: image.present ? image.value : this.image,
        centerId: centerId ?? this.centerId,
        createdBy: createdBy ?? this.createdBy,
        scope: scope ?? this.scope,
        targetHalqaIds:
            targetHalqaIds.present ? targetHalqaIds.value : this.targetHalqaIds,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  AnnouncementsTableData copyWithCompanion(AnnouncementsTableCompanion data) {
    return AnnouncementsTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      image: data.image.present ? data.image.value : this.image,
      centerId: data.centerId.present ? data.centerId.value : this.centerId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      scope: data.scope.present ? data.scope.value : this.scope,
      targetHalqaIds: data.targetHalqaIds.present
          ? data.targetHalqaIds.value
          : this.targetHalqaIds,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AnnouncementsTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('image: $image, ')
          ..write('centerId: $centerId, ')
          ..write('createdBy: $createdBy, ')
          ..write('scope: $scope, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
      syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AnnouncementsTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.image == this.image &&
          other.centerId == this.centerId &&
          other.createdBy == this.createdBy &&
          other.scope == this.scope &&
          other.targetHalqaIds == this.targetHalqaIds &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class AnnouncementsTableCompanion
    extends UpdateCompanion<AnnouncementsTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> content;
  final Value<String?> image;
  final Value<String> centerId;
  final Value<String> createdBy;
  final Value<String> scope;
  final Value<String?> targetHalqaIds;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<String> syncStatus;
  final Value<int> rowid;
  const AnnouncementsTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.image = const Value.absent(),
    this.centerId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.scope = const Value.absent(),
    this.targetHalqaIds = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AnnouncementsTableCompanion.insert({
    required String id,
    required String title,
    required String content,
    this.image = const Value.absent(),
    required String centerId,
    required String createdBy,
    this.scope = const Value.absent(),
    this.targetHalqaIds = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        title = Value(title),
        content = Value(content),
        centerId = Value(centerId),
        createdBy = Value(createdBy),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<AnnouncementsTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<String>? image,
    Expression<String>? centerId,
    Expression<String>? createdBy,
    Expression<String>? scope,
    Expression<String>? targetHalqaIds,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<String>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'content': content,
      if (image != null) 'image': image,
      if (centerId != null) 'center_id': centerId,
      if (createdBy != null) 'created_by': createdBy,
      if (scope != null) 'scope': scope,
      if (targetHalqaIds != null) 'target_halqa_ids': targetHalqaIds,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AnnouncementsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? title,
      Value<String>? content,
      Value<String?>? image,
      Value<String>? centerId,
      Value<String>? createdBy,
      Value<String>? scope,
      Value<String?>? targetHalqaIds,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<String>? syncStatus,
      Value<int>? rowid}) {
    return AnnouncementsTableCompanion(
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (centerId.present) {
      map['center_id'] = Variable<String>(centerId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (targetHalqaIds.present) {
      map['target_halqa_ids'] = Variable<String>(targetHalqaIds.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AnnouncementsTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('image: $image, ')
          ..write('centerId: $centerId, ')
          ..write('createdBy: $createdBy, ')
          ..write('scope: $scope, ')
          ..write('targetHalqaIds: $targetHalqaIds, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTableTable extends AppSettingsTable
    with TableInfo<$AppSettingsTableTable, AppSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _centerIdMeta =
      const VerificationMeta('centerId');
  @override
  late final GeneratedColumn<String> centerId = GeneratedColumn<String>(
      'center_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [key, value, centerId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
      Insertable<AppSettingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('center_id')) {
      context.handle(_centerIdMeta,
          centerId.isAcceptableOrUnknown(data['center_id']!, _centerIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key, centerId};
  @override
  AppSettingsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingsTableData(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      centerId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}center_id']),
    );
  }

  @override
  $AppSettingsTableTable createAlias(String alias) {
    return $AppSettingsTableTable(attachedDatabase, alias);
  }
}

class AppSettingsTableData extends DataClass
    implements Insertable<AppSettingsTableData> {
  final String key;
  final String value;
  final String? centerId;
  const AppSettingsTableData(
      {required this.key, required this.value, this.centerId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    if (!nullToAbsent || centerId != null) {
      map['center_id'] = Variable<String>(centerId);
    }
    return map;
  }

  AppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsTableCompanion(
      key: Value(key),
      value: Value(value),
      centerId: centerId == null && nullToAbsent
          ? const Value.absent()
          : Value(centerId),
    );
  }

  factory AppSettingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingsTableData(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      centerId: serializer.fromJson<String?>(json['centerId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'centerId': serializer.toJson<String?>(centerId),
    };
  }

  AppSettingsTableData copyWith(
          {String? key,
          String? value,
          Value<String?> centerId = const Value.absent()}) =>
      AppSettingsTableData(
        key: key ?? this.key,
        value: value ?? this.value,
        centerId: centerId.present ? centerId.value : this.centerId,
      );
  AppSettingsTableData copyWithCompanion(AppSettingsTableCompanion data) {
    return AppSettingsTableData(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      centerId: data.centerId.present ? data.centerId.value : this.centerId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableData(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('centerId: $centerId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, centerId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingsTableData &&
          other.key == this.key &&
          other.value == this.value &&
          other.centerId == this.centerId);
}

class AppSettingsTableCompanion extends UpdateCompanion<AppSettingsTableData> {
  final Value<String> key;
  final Value<String> value;
  final Value<String?> centerId;
  final Value<int> rowid;
  const AppSettingsTableCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.centerId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsTableCompanion.insert({
    required String key,
    required String value,
    this.centerId = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<AppSettingsTableData> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<String>? centerId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (centerId != null) 'center_id': centerId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsTableCompanion copyWith(
      {Value<String>? key,
      Value<String>? value,
      Value<String?>? centerId,
      Value<int>? rowid}) {
    return AppSettingsTableCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      centerId: centerId ?? this.centerId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (centerId.present) {
      map['center_id'] = Variable<String>(centerId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsTableCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('centerId: $centerId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTableTable usersTable = $UsersTableTable(this);
  late final $CentersTableTable centersTable = $CentersTableTable(this);
  late final $HalqatTableTable halqatTable = $HalqatTableTable(this);
  late final $StudentsTableTable studentsTable = $StudentsTableTable(this);
  late final $DailyReportsTableTable dailyReportsTable =
      $DailyReportsTableTable(this);
  late final $StudentReportsTableTable studentReportsTable =
      $StudentReportsTableTable(this);
  late final $RecitationsTableTable recitationsTable =
      $RecitationsTableTable(this);
  late final $CoursesTableTable coursesTable = $CoursesTableTable(this);
  late final $ActivitiesTableTable activitiesTable =
      $ActivitiesTableTable(this);
  late final $FeesTableTable feesTable = $FeesTableTable(this);
  late final $FeePaymentsTableTable feePaymentsTable =
      $FeePaymentsTableTable(this);
  late final $HolidaysTableTable holidaysTable = $HolidaysTableTable(this);
  late final $AnnouncementsTableTable announcementsTable =
      $AnnouncementsTableTable(this);
  late final $AppSettingsTableTable appSettingsTable =
      $AppSettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        usersTable,
        centersTable,
        halqatTable,
        studentsTable,
        dailyReportsTable,
        studentReportsTable,
        recitationsTable,
        coursesTable,
        activitiesTable,
        feesTable,
        feePaymentsTable,
        holidaysTable,
        announcementsTable,
        appSettingsTable
      ];
}

typedef $$UsersTableTableCreateCompanionBuilder = UsersTableCompanion Function({
  required String id,
  required String username,
  required String passwordHash,
  required String fullName,
  Value<String?> email,
  Value<String?> phone,
  required String role,
  Value<String?> centerId,
  Value<String?> halqaId,
  Value<String?> profileImage,
  Value<bool> isActive,
  Value<bool> isBlocked,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$UsersTableTableUpdateCompanionBuilder = UsersTableCompanion Function({
  Value<String> id,
  Value<String> username,
  Value<String> passwordHash,
  Value<String> fullName,
  Value<String?> email,
  Value<String?> phone,
  Value<String> role,
  Value<String?> centerId,
  Value<String?> halqaId,
  Value<String?> profileImage,
  Value<bool> isActive,
  Value<bool> isBlocked,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$UsersTableTableFilterComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get halqaId => $composableBuilder(
      column: $table.halqaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBlocked => $composableBuilder(
      column: $table.isBlocked, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$UsersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get username => $composableBuilder(
      column: $table.username, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get role => $composableBuilder(
      column: $table.role, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get halqaId => $composableBuilder(
      column: $table.halqaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileImage => $composableBuilder(
      column: $table.profileImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBlocked => $composableBuilder(
      column: $table.isBlocked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$UsersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTableTable> {
  $$UsersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get username =>
      $composableBuilder(column: $table.username, builder: (column) => column);

  GeneratedColumn<String> get passwordHash => $composableBuilder(
      column: $table.passwordHash, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get centerId =>
      $composableBuilder(column: $table.centerId, builder: (column) => column);

  GeneratedColumn<String> get halqaId =>
      $composableBuilder(column: $table.halqaId, builder: (column) => column);

  GeneratedColumn<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isBlocked =>
      $composableBuilder(column: $table.isBlocked, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$UsersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTableTable,
    UsersTableData,
    $$UsersTableTableFilterComposer,
    $$UsersTableTableOrderingComposer,
    $$UsersTableTableAnnotationComposer,
    $$UsersTableTableCreateCompanionBuilder,
    $$UsersTableTableUpdateCompanionBuilder,
    (
      UsersTableData,
      BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData>
    ),
    UsersTableData,
    PrefetchHooks Function()> {
  $$UsersTableTableTableManager(_$AppDatabase db, $UsersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> username = const Value.absent(),
            Value<String> passwordHash = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String> role = const Value.absent(),
            Value<String?> centerId = const Value.absent(),
            Value<String?> halqaId = const Value.absent(),
            Value<String?> profileImage = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isBlocked = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersTableCompanion(
            id: id,
            username: username,
            passwordHash: passwordHash,
            fullName: fullName,
            email: email,
            phone: phone,
            role: role,
            centerId: centerId,
            halqaId: halqaId,
            profileImage: profileImage,
            isActive: isActive,
            isBlocked: isBlocked,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String username,
            required String passwordHash,
            required String fullName,
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            required String role,
            Value<String?> centerId = const Value.absent(),
            Value<String?> halqaId = const Value.absent(),
            Value<String?> profileImage = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isBlocked = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UsersTableCompanion.insert(
            id: id,
            username: username,
            passwordHash: passwordHash,
            fullName: fullName,
            email: email,
            phone: phone,
            role: role,
            centerId: centerId,
            halqaId: halqaId,
            profileImage: profileImage,
            isActive: isActive,
            isBlocked: isBlocked,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UsersTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTableTable,
    UsersTableData,
    $$UsersTableTableFilterComposer,
    $$UsersTableTableOrderingComposer,
    $$UsersTableTableAnnotationComposer,
    $$UsersTableTableCreateCompanionBuilder,
    $$UsersTableTableUpdateCompanionBuilder,
    (
      UsersTableData,
      BaseReferences<_$AppDatabase, $UsersTableTable, UsersTableData>
    ),
    UsersTableData,
    PrefetchHooks Function()>;
typedef $$CentersTableTableCreateCompanionBuilder = CentersTableCompanion
    Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> logo,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> managerId,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$CentersTableTableUpdateCompanionBuilder = CentersTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> logo,
  Value<String?> address,
  Value<String?> phone,
  Value<String?> email,
  Value<String?> managerId,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$CentersTableTableFilterComposer
    extends Composer<_$AppDatabase, $CentersTableTable> {
  $$CentersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get logo => $composableBuilder(
      column: $table.logo, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get managerId => $composableBuilder(
      column: $table.managerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$CentersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CentersTableTable> {
  $$CentersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get logo => $composableBuilder(
      column: $table.logo, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get managerId => $composableBuilder(
      column: $table.managerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$CentersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CentersTableTable> {
  $$CentersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get logo =>
      $composableBuilder(column: $table.logo, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get managerId =>
      $composableBuilder(column: $table.managerId, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$CentersTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CentersTableTable,
    CentersTableData,
    $$CentersTableTableFilterComposer,
    $$CentersTableTableOrderingComposer,
    $$CentersTableTableAnnotationComposer,
    $$CentersTableTableCreateCompanionBuilder,
    $$CentersTableTableUpdateCompanionBuilder,
    (
      CentersTableData,
      BaseReferences<_$AppDatabase, $CentersTableTable, CentersTableData>
    ),
    CentersTableData,
    PrefetchHooks Function()> {
  $$CentersTableTableTableManager(_$AppDatabase db, $CentersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CentersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CentersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CentersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> logo = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> managerId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CentersTableCompanion(
            id: id,
            name: name,
            description: description,
            logo: logo,
            address: address,
            phone: phone,
            email: email,
            managerId: managerId,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> logo = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> managerId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CentersTableCompanion.insert(
            id: id,
            name: name,
            description: description,
            logo: logo,
            address: address,
            phone: phone,
            email: email,
            managerId: managerId,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CentersTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CentersTableTable,
    CentersTableData,
    $$CentersTableTableFilterComposer,
    $$CentersTableTableOrderingComposer,
    $$CentersTableTableAnnotationComposer,
    $$CentersTableTableCreateCompanionBuilder,
    $$CentersTableTableUpdateCompanionBuilder,
    (
      CentersTableData,
      BaseReferences<_$AppDatabase, $CentersTableTable, CentersTableData>
    ),
    CentersTableData,
    PrefetchHooks Function()>;
typedef $$HalqatTableTableCreateCompanionBuilder = HalqatTableCompanion
    Function({
  required String id,
  required String name,
  required String centerId,
  Value<String?> teacherId,
  Value<String?> teacherName,
  required String category,
  Value<int> studentCount,
  Value<int> maxStudents,
  Value<String?> description,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$HalqatTableTableUpdateCompanionBuilder = HalqatTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> centerId,
  Value<String?> teacherId,
  Value<String?> teacherName,
  Value<String> category,
  Value<int> studentCount,
  Value<int> maxStudents,
  Value<String?> description,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$HalqatTableTableFilterComposer
    extends Composer<_$AppDatabase, $HalqatTableTable> {
  $$HalqatTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get teacherId => $composableBuilder(
      column: $table.teacherId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get teacherName => $composableBuilder(
      column: $table.teacherName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get studentCount => $composableBuilder(
      column: $table.studentCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxStudents => $composableBuilder(
      column: $table.maxStudents, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$HalqatTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HalqatTableTable> {
  $$HalqatTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get teacherId => $composableBuilder(
      column: $table.teacherId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get teacherName => $composableBuilder(
      column: $table.teacherName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get studentCount => $composableBuilder(
      column: $table.studentCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxStudents => $composableBuilder(
      column: $table.maxStudents, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$HalqatTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HalqatTableTable> {
  $$HalqatTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get centerId =>
      $composableBuilder(column: $table.centerId, builder: (column) => column);

  GeneratedColumn<String> get teacherId =>
      $composableBuilder(column: $table.teacherId, builder: (column) => column);

  GeneratedColumn<String> get teacherName => $composableBuilder(
      column: $table.teacherName, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<int> get studentCount => $composableBuilder(
      column: $table.studentCount, builder: (column) => column);

  GeneratedColumn<int> get maxStudents => $composableBuilder(
      column: $table.maxStudents, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$HalqatTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HalqatTableTable,
    HalqatTableData,
    $$HalqatTableTableFilterComposer,
    $$HalqatTableTableOrderingComposer,
    $$HalqatTableTableAnnotationComposer,
    $$HalqatTableTableCreateCompanionBuilder,
    $$HalqatTableTableUpdateCompanionBuilder,
    (
      HalqatTableData,
      BaseReferences<_$AppDatabase, $HalqatTableTable, HalqatTableData>
    ),
    HalqatTableData,
    PrefetchHooks Function()> {
  $$HalqatTableTableTableManager(_$AppDatabase db, $HalqatTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HalqatTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HalqatTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HalqatTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> centerId = const Value.absent(),
            Value<String?> teacherId = const Value.absent(),
            Value<String?> teacherName = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<int> studentCount = const Value.absent(),
            Value<int> maxStudents = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HalqatTableCompanion(
            id: id,
            name: name,
            centerId: centerId,
            teacherId: teacherId,
            teacherName: teacherName,
            category: category,
            studentCount: studentCount,
            maxStudents: maxStudents,
            description: description,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String centerId,
            Value<String?> teacherId = const Value.absent(),
            Value<String?> teacherName = const Value.absent(),
            required String category,
            Value<int> studentCount = const Value.absent(),
            Value<int> maxStudents = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HalqatTableCompanion.insert(
            id: id,
            name: name,
            centerId: centerId,
            teacherId: teacherId,
            teacherName: teacherName,
            category: category,
            studentCount: studentCount,
            maxStudents: maxStudents,
            description: description,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HalqatTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HalqatTableTable,
    HalqatTableData,
    $$HalqatTableTableFilterComposer,
    $$HalqatTableTableOrderingComposer,
    $$HalqatTableTableAnnotationComposer,
    $$HalqatTableTableCreateCompanionBuilder,
    $$HalqatTableTableUpdateCompanionBuilder,
    (
      HalqatTableData,
      BaseReferences<_$AppDatabase, $HalqatTableTable, HalqatTableData>
    ),
    HalqatTableData,
    PrefetchHooks Function()>;
typedef $$StudentsTableTableCreateCompanionBuilder = StudentsTableCompanion
    Function({
  required String id,
  required String fullName,
  required String halqaId,
  required String centerId,
  required String parentName,
  required String parentPhone,
  Value<String?> parentId,
  Value<String?> parentJob,
  Value<String?> currentResidence,
  Value<String?> previousResidence,
  Value<String?> governorate,
  Value<int?> age,
  Value<DateTime?> birthDate,
  required DateTime enrollmentDate,
  Value<String?> phone,
  Value<String?> profileImage,
  Value<String?> previousMemorization,
  Value<String?> notes,
  Value<String?> studentUserId,
  Value<bool> isActive,
  Value<bool> isBlocked,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$StudentsTableTableUpdateCompanionBuilder = StudentsTableCompanion
    Function({
  Value<String> id,
  Value<String> fullName,
  Value<String> halqaId,
  Value<String> centerId,
  Value<String> parentName,
  Value<String> parentPhone,
  Value<String?> parentId,
  Value<String?> parentJob,
  Value<String?> currentResidence,
  Value<String?> previousResidence,
  Value<String?> governorate,
  Value<int?> age,
  Value<DateTime?> birthDate,
  Value<DateTime> enrollmentDate,
  Value<String?> phone,
  Value<String?> profileImage,
  Value<String?> previousMemorization,
  Value<String?> notes,
  Value<String?> studentUserId,
  Value<bool> isActive,
  Value<bool> isBlocked,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$StudentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $StudentsTableTable> {
  $$StudentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get halqaId => $composableBuilder(
      column: $table.halqaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parentName => $composableBuilder(
      column: $table.parentName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parentPhone => $composableBuilder(
      column: $table.parentPhone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parentJob => $composableBuilder(
      column: $table.parentJob, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentResidence => $composableBuilder(
      column: $table.currentResidence,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get previousResidence => $composableBuilder(
      column: $table.previousResidence,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get governorate => $composableBuilder(
      column: $table.governorate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get enrollmentDate => $composableBuilder(
      column: $table.enrollmentDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get previousMemorization => $composableBuilder(
      column: $table.previousMemorization,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get studentUserId => $composableBuilder(
      column: $table.studentUserId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isBlocked => $composableBuilder(
      column: $table.isBlocked, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$StudentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentsTableTable> {
  $$StudentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fullName => $composableBuilder(
      column: $table.fullName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get halqaId => $composableBuilder(
      column: $table.halqaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parentName => $composableBuilder(
      column: $table.parentName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parentPhone => $composableBuilder(
      column: $table.parentPhone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parentJob => $composableBuilder(
      column: $table.parentJob, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentResidence => $composableBuilder(
      column: $table.currentResidence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get previousResidence => $composableBuilder(
      column: $table.previousResidence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get governorate => $composableBuilder(
      column: $table.governorate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get age => $composableBuilder(
      column: $table.age, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
      column: $table.birthDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get enrollmentDate => $composableBuilder(
      column: $table.enrollmentDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get profileImage => $composableBuilder(
      column: $table.profileImage,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get previousMemorization => $composableBuilder(
      column: $table.previousMemorization,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get studentUserId => $composableBuilder(
      column: $table.studentUserId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isBlocked => $composableBuilder(
      column: $table.isBlocked, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$StudentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentsTableTable> {
  $$StudentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get fullName =>
      $composableBuilder(column: $table.fullName, builder: (column) => column);

  GeneratedColumn<String> get halqaId =>
      $composableBuilder(column: $table.halqaId, builder: (column) => column);

  GeneratedColumn<String> get centerId =>
      $composableBuilder(column: $table.centerId, builder: (column) => column);

  GeneratedColumn<String> get parentName => $composableBuilder(
      column: $table.parentName, builder: (column) => column);

  GeneratedColumn<String> get parentPhone => $composableBuilder(
      column: $table.parentPhone, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get parentJob =>
      $composableBuilder(column: $table.parentJob, builder: (column) => column);

  GeneratedColumn<String> get currentResidence => $composableBuilder(
      column: $table.currentResidence, builder: (column) => column);

  GeneratedColumn<String> get previousResidence => $composableBuilder(
      column: $table.previousResidence, builder: (column) => column);

  GeneratedColumn<String> get governorate => $composableBuilder(
      column: $table.governorate, builder: (column) => column);

  GeneratedColumn<int> get age =>
      $composableBuilder(column: $table.age, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);

  GeneratedColumn<DateTime> get enrollmentDate => $composableBuilder(
      column: $table.enrollmentDate, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get profileImage => $composableBuilder(
      column: $table.profileImage, builder: (column) => column);

  GeneratedColumn<String> get previousMemorization => $composableBuilder(
      column: $table.previousMemorization, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get studentUserId => $composableBuilder(
      column: $table.studentUserId, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<bool> get isBlocked =>
      $composableBuilder(column: $table.isBlocked, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$StudentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StudentsTableTable,
    StudentsTableData,
    $$StudentsTableTableFilterComposer,
    $$StudentsTableTableOrderingComposer,
    $$StudentsTableTableAnnotationComposer,
    $$StudentsTableTableCreateCompanionBuilder,
    $$StudentsTableTableUpdateCompanionBuilder,
    (
      StudentsTableData,
      BaseReferences<_$AppDatabase, $StudentsTableTable, StudentsTableData>
    ),
    StudentsTableData,
    PrefetchHooks Function()> {
  $$StudentsTableTableTableManager(_$AppDatabase db, $StudentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> fullName = const Value.absent(),
            Value<String> halqaId = const Value.absent(),
            Value<String> centerId = const Value.absent(),
            Value<String> parentName = const Value.absent(),
            Value<String> parentPhone = const Value.absent(),
            Value<String?> parentId = const Value.absent(),
            Value<String?> parentJob = const Value.absent(),
            Value<String?> currentResidence = const Value.absent(),
            Value<String?> previousResidence = const Value.absent(),
            Value<String?> governorate = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<DateTime?> birthDate = const Value.absent(),
            Value<DateTime> enrollmentDate = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> profileImage = const Value.absent(),
            Value<String?> previousMemorization = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> studentUserId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isBlocked = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudentsTableCompanion(
            id: id,
            fullName: fullName,
            halqaId: halqaId,
            centerId: centerId,
            parentName: parentName,
            parentPhone: parentPhone,
            parentId: parentId,
            parentJob: parentJob,
            currentResidence: currentResidence,
            previousResidence: previousResidence,
            governorate: governorate,
            age: age,
            birthDate: birthDate,
            enrollmentDate: enrollmentDate,
            phone: phone,
            profileImage: profileImage,
            previousMemorization: previousMemorization,
            notes: notes,
            studentUserId: studentUserId,
            isActive: isActive,
            isBlocked: isBlocked,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String fullName,
            required String halqaId,
            required String centerId,
            required String parentName,
            required String parentPhone,
            Value<String?> parentId = const Value.absent(),
            Value<String?> parentJob = const Value.absent(),
            Value<String?> currentResidence = const Value.absent(),
            Value<String?> previousResidence = const Value.absent(),
            Value<String?> governorate = const Value.absent(),
            Value<int?> age = const Value.absent(),
            Value<DateTime?> birthDate = const Value.absent(),
            required DateTime enrollmentDate,
            Value<String?> phone = const Value.absent(),
            Value<String?> profileImage = const Value.absent(),
            Value<String?> previousMemorization = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String?> studentUserId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<bool> isBlocked = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudentsTableCompanion.insert(
            id: id,
            fullName: fullName,
            halqaId: halqaId,
            centerId: centerId,
            parentName: parentName,
            parentPhone: parentPhone,
            parentId: parentId,
            parentJob: parentJob,
            currentResidence: currentResidence,
            previousResidence: previousResidence,
            governorate: governorate,
            age: age,
            birthDate: birthDate,
            enrollmentDate: enrollmentDate,
            phone: phone,
            profileImage: profileImage,
            previousMemorization: previousMemorization,
            notes: notes,
            studentUserId: studentUserId,
            isActive: isActive,
            isBlocked: isBlocked,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StudentsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StudentsTableTable,
    StudentsTableData,
    $$StudentsTableTableFilterComposer,
    $$StudentsTableTableOrderingComposer,
    $$StudentsTableTableAnnotationComposer,
    $$StudentsTableTableCreateCompanionBuilder,
    $$StudentsTableTableUpdateCompanionBuilder,
    (
      StudentsTableData,
      BaseReferences<_$AppDatabase, $StudentsTableTable, StudentsTableData>
    ),
    StudentsTableData,
    PrefetchHooks Function()>;
typedef $$DailyReportsTableTableCreateCompanionBuilder
    = DailyReportsTableCompanion Function({
  required String id,
  required String halqaId,
  required String teacherId,
  required DateTime date,
  Value<String> status,
  Value<String?> reviewedBy,
  Value<String?> reviewNotes,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$DailyReportsTableTableUpdateCompanionBuilder
    = DailyReportsTableCompanion Function({
  Value<String> id,
  Value<String> halqaId,
  Value<String> teacherId,
  Value<DateTime> date,
  Value<String> status,
  Value<String?> reviewedBy,
  Value<String?> reviewNotes,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$DailyReportsTableTableFilterComposer
    extends Composer<_$AppDatabase, $DailyReportsTableTable> {
  $$DailyReportsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get halqaId => $composableBuilder(
      column: $table.halqaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get teacherId => $composableBuilder(
      column: $table.teacherId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reviewedBy => $composableBuilder(
      column: $table.reviewedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reviewNotes => $composableBuilder(
      column: $table.reviewNotes, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$DailyReportsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $DailyReportsTableTable> {
  $$DailyReportsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get halqaId => $composableBuilder(
      column: $table.halqaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get teacherId => $composableBuilder(
      column: $table.teacherId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get date => $composableBuilder(
      column: $table.date, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reviewedBy => $composableBuilder(
      column: $table.reviewedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reviewNotes => $composableBuilder(
      column: $table.reviewNotes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$DailyReportsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $DailyReportsTableTable> {
  $$DailyReportsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get halqaId =>
      $composableBuilder(column: $table.halqaId, builder: (column) => column);

  GeneratedColumn<String> get teacherId =>
      $composableBuilder(column: $table.teacherId, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get reviewedBy => $composableBuilder(
      column: $table.reviewedBy, builder: (column) => column);

  GeneratedColumn<String> get reviewNotes => $composableBuilder(
      column: $table.reviewNotes, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$DailyReportsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DailyReportsTableTable,
    DailyReportsTableData,
    $$DailyReportsTableTableFilterComposer,
    $$DailyReportsTableTableOrderingComposer,
    $$DailyReportsTableTableAnnotationComposer,
    $$DailyReportsTableTableCreateCompanionBuilder,
    $$DailyReportsTableTableUpdateCompanionBuilder,
    (
      DailyReportsTableData,
      BaseReferences<_$AppDatabase, $DailyReportsTableTable,
          DailyReportsTableData>
    ),
    DailyReportsTableData,
    PrefetchHooks Function()> {
  $$DailyReportsTableTableTableManager(
      _$AppDatabase db, $DailyReportsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DailyReportsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DailyReportsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DailyReportsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> halqaId = const Value.absent(),
            Value<String> teacherId = const Value.absent(),
            Value<DateTime> date = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> reviewedBy = const Value.absent(),
            Value<String?> reviewNotes = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyReportsTableCompanion(
            id: id,
            halqaId: halqaId,
            teacherId: teacherId,
            date: date,
            status: status,
            reviewedBy: reviewedBy,
            reviewNotes: reviewNotes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String halqaId,
            required String teacherId,
            required DateTime date,
            Value<String> status = const Value.absent(),
            Value<String?> reviewedBy = const Value.absent(),
            Value<String?> reviewNotes = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DailyReportsTableCompanion.insert(
            id: id,
            halqaId: halqaId,
            teacherId: teacherId,
            date: date,
            status: status,
            reviewedBy: reviewedBy,
            reviewNotes: reviewNotes,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DailyReportsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DailyReportsTableTable,
    DailyReportsTableData,
    $$DailyReportsTableTableFilterComposer,
    $$DailyReportsTableTableOrderingComposer,
    $$DailyReportsTableTableAnnotationComposer,
    $$DailyReportsTableTableCreateCompanionBuilder,
    $$DailyReportsTableTableUpdateCompanionBuilder,
    (
      DailyReportsTableData,
      BaseReferences<_$AppDatabase, $DailyReportsTableTable,
          DailyReportsTableData>
    ),
    DailyReportsTableData,
    PrefetchHooks Function()>;
typedef $$StudentReportsTableTableCreateCompanionBuilder
    = StudentReportsTableCompanion Function({
  required String id,
  required String reportId,
  required String studentId,
  required String studentName,
  required String attendanceStatus,
  Value<String?> notes,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$StudentReportsTableTableUpdateCompanionBuilder
    = StudentReportsTableCompanion Function({
  Value<String> id,
  Value<String> reportId,
  Value<String> studentId,
  Value<String> studentName,
  Value<String> attendanceStatus,
  Value<String?> notes,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$StudentReportsTableTableFilterComposer
    extends Composer<_$AppDatabase, $StudentReportsTableTable> {
  $$StudentReportsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reportId => $composableBuilder(
      column: $table.reportId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get studentName => $composableBuilder(
      column: $table.studentName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get attendanceStatus => $composableBuilder(
      column: $table.attendanceStatus,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$StudentReportsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentReportsTableTable> {
  $$StudentReportsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reportId => $composableBuilder(
      column: $table.reportId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get studentName => $composableBuilder(
      column: $table.studentName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get attendanceStatus => $composableBuilder(
      column: $table.attendanceStatus,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$StudentReportsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentReportsTableTable> {
  $$StudentReportsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get reportId =>
      $composableBuilder(column: $table.reportId, builder: (column) => column);

  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get studentName => $composableBuilder(
      column: $table.studentName, builder: (column) => column);

  GeneratedColumn<String> get attendanceStatus => $composableBuilder(
      column: $table.attendanceStatus, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$StudentReportsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StudentReportsTableTable,
    StudentReportsTableData,
    $$StudentReportsTableTableFilterComposer,
    $$StudentReportsTableTableOrderingComposer,
    $$StudentReportsTableTableAnnotationComposer,
    $$StudentReportsTableTableCreateCompanionBuilder,
    $$StudentReportsTableTableUpdateCompanionBuilder,
    (
      StudentReportsTableData,
      BaseReferences<_$AppDatabase, $StudentReportsTableTable,
          StudentReportsTableData>
    ),
    StudentReportsTableData,
    PrefetchHooks Function()> {
  $$StudentReportsTableTableTableManager(
      _$AppDatabase db, $StudentReportsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentReportsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentReportsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentReportsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> reportId = const Value.absent(),
            Value<String> studentId = const Value.absent(),
            Value<String> studentName = const Value.absent(),
            Value<String> attendanceStatus = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudentReportsTableCompanion(
            id: id,
            reportId: reportId,
            studentId: studentId,
            studentName: studentName,
            attendanceStatus: attendanceStatus,
            notes: notes,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String reportId,
            required String studentId,
            required String studentName,
            required String attendanceStatus,
            Value<String?> notes = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              StudentReportsTableCompanion.insert(
            id: id,
            reportId: reportId,
            studentId: studentId,
            studentName: studentName,
            attendanceStatus: attendanceStatus,
            notes: notes,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$StudentReportsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $StudentReportsTableTable,
    StudentReportsTableData,
    $$StudentReportsTableTableFilterComposer,
    $$StudentReportsTableTableOrderingComposer,
    $$StudentReportsTableTableAnnotationComposer,
    $$StudentReportsTableTableCreateCompanionBuilder,
    $$StudentReportsTableTableUpdateCompanionBuilder,
    (
      StudentReportsTableData,
      BaseReferences<_$AppDatabase, $StudentReportsTableTable,
          StudentReportsTableData>
    ),
    StudentReportsTableData,
    PrefetchHooks Function()>;
typedef $$RecitationsTableTableCreateCompanionBuilder
    = RecitationsTableCompanion Function({
  required String id,
  required String studentReportId,
  required String type,
  required int surahNumber,
  required String surahName,
  required int fromVerse,
  required int toVerse,
  Value<int?> rating,
  Value<String?> notes,
  Value<int> rowid,
});
typedef $$RecitationsTableTableUpdateCompanionBuilder
    = RecitationsTableCompanion Function({
  Value<String> id,
  Value<String> studentReportId,
  Value<String> type,
  Value<int> surahNumber,
  Value<String> surahName,
  Value<int> fromVerse,
  Value<int> toVerse,
  Value<int?> rating,
  Value<String?> notes,
  Value<int> rowid,
});

class $$RecitationsTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecitationsTableTable> {
  $$RecitationsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get studentReportId => $composableBuilder(
      column: $table.studentReportId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get surahNumber => $composableBuilder(
      column: $table.surahNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get surahName => $composableBuilder(
      column: $table.surahName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fromVerse => $composableBuilder(
      column: $table.fromVerse, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get toVerse => $composableBuilder(
      column: $table.toVerse, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));
}

class $$RecitationsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecitationsTableTable> {
  $$RecitationsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get studentReportId => $composableBuilder(
      column: $table.studentReportId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get surahNumber => $composableBuilder(
      column: $table.surahNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get surahName => $composableBuilder(
      column: $table.surahName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fromVerse => $composableBuilder(
      column: $table.fromVerse, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get toVerse => $composableBuilder(
      column: $table.toVerse, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get rating => $composableBuilder(
      column: $table.rating, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));
}

class $$RecitationsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecitationsTableTable> {
  $$RecitationsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get studentReportId => $composableBuilder(
      column: $table.studentReportId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get surahNumber => $composableBuilder(
      column: $table.surahNumber, builder: (column) => column);

  GeneratedColumn<String> get surahName =>
      $composableBuilder(column: $table.surahName, builder: (column) => column);

  GeneratedColumn<int> get fromVerse =>
      $composableBuilder(column: $table.fromVerse, builder: (column) => column);

  GeneratedColumn<int> get toVerse =>
      $composableBuilder(column: $table.toVerse, builder: (column) => column);

  GeneratedColumn<int> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$RecitationsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecitationsTableTable,
    RecitationsTableData,
    $$RecitationsTableTableFilterComposer,
    $$RecitationsTableTableOrderingComposer,
    $$RecitationsTableTableAnnotationComposer,
    $$RecitationsTableTableCreateCompanionBuilder,
    $$RecitationsTableTableUpdateCompanionBuilder,
    (
      RecitationsTableData,
      BaseReferences<_$AppDatabase, $RecitationsTableTable,
          RecitationsTableData>
    ),
    RecitationsTableData,
    PrefetchHooks Function()> {
  $$RecitationsTableTableTableManager(
      _$AppDatabase db, $RecitationsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecitationsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecitationsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecitationsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> studentReportId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<int> surahNumber = const Value.absent(),
            Value<String> surahName = const Value.absent(),
            Value<int> fromVerse = const Value.absent(),
            Value<int> toVerse = const Value.absent(),
            Value<int?> rating = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecitationsTableCompanion(
            id: id,
            studentReportId: studentReportId,
            type: type,
            surahNumber: surahNumber,
            surahName: surahName,
            fromVerse: fromVerse,
            toVerse: toVerse,
            rating: rating,
            notes: notes,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String studentReportId,
            required String type,
            required int surahNumber,
            required String surahName,
            required int fromVerse,
            required int toVerse,
            Value<int?> rating = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecitationsTableCompanion.insert(
            id: id,
            studentReportId: studentReportId,
            type: type,
            surahNumber: surahNumber,
            surahName: surahName,
            fromVerse: fromVerse,
            toVerse: toVerse,
            rating: rating,
            notes: notes,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RecitationsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecitationsTableTable,
    RecitationsTableData,
    $$RecitationsTableTableFilterComposer,
    $$RecitationsTableTableOrderingComposer,
    $$RecitationsTableTableAnnotationComposer,
    $$RecitationsTableTableCreateCompanionBuilder,
    $$RecitationsTableTableUpdateCompanionBuilder,
    (
      RecitationsTableData,
      BaseReferences<_$AppDatabase, $RecitationsTableTable,
          RecitationsTableData>
    ),
    RecitationsTableData,
    PrefetchHooks Function()>;
typedef $$CoursesTableTableCreateCompanionBuilder = CoursesTableCompanion
    Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> image,
  required String centerId,
  Value<String?> responsibleTeacherId,
  required DateTime startDate,
  required DateTime endDate,
  Value<String> targetHalqaIds,
  Value<String> targetStudentIds,
  Value<String?> notes,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$CoursesTableTableUpdateCompanionBuilder = CoursesTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> image,
  Value<String> centerId,
  Value<String?> responsibleTeacherId,
  Value<DateTime> startDate,
  Value<DateTime> endDate,
  Value<String> targetHalqaIds,
  Value<String> targetStudentIds,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$CoursesTableTableFilterComposer
    extends Composer<_$AppDatabase, $CoursesTableTable> {
  $$CoursesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get responsibleTeacherId => $composableBuilder(
      column: $table.responsibleTeacherId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetStudentIds => $composableBuilder(
      column: $table.targetStudentIds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$CoursesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CoursesTableTable> {
  $$CoursesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get responsibleTeacherId => $composableBuilder(
      column: $table.responsibleTeacherId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetStudentIds => $composableBuilder(
      column: $table.targetStudentIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$CoursesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CoursesTableTable> {
  $$CoursesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get centerId =>
      $composableBuilder(column: $table.centerId, builder: (column) => column);

  GeneratedColumn<String> get responsibleTeacherId => $composableBuilder(
      column: $table.responsibleTeacherId, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds, builder: (column) => column);

  GeneratedColumn<String> get targetStudentIds => $composableBuilder(
      column: $table.targetStudentIds, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$CoursesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CoursesTableTable,
    CoursesTableData,
    $$CoursesTableTableFilterComposer,
    $$CoursesTableTableOrderingComposer,
    $$CoursesTableTableAnnotationComposer,
    $$CoursesTableTableCreateCompanionBuilder,
    $$CoursesTableTableUpdateCompanionBuilder,
    (
      CoursesTableData,
      BaseReferences<_$AppDatabase, $CoursesTableTable, CoursesTableData>
    ),
    CoursesTableData,
    PrefetchHooks Function()> {
  $$CoursesTableTableTableManager(_$AppDatabase db, $CoursesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CoursesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CoursesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CoursesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String> centerId = const Value.absent(),
            Value<String?> responsibleTeacherId = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> endDate = const Value.absent(),
            Value<String> targetHalqaIds = const Value.absent(),
            Value<String> targetStudentIds = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CoursesTableCompanion(
            id: id,
            name: name,
            description: description,
            image: image,
            centerId: centerId,
            responsibleTeacherId: responsibleTeacherId,
            startDate: startDate,
            endDate: endDate,
            targetHalqaIds: targetHalqaIds,
            targetStudentIds: targetStudentIds,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            required String centerId,
            Value<String?> responsibleTeacherId = const Value.absent(),
            required DateTime startDate,
            required DateTime endDate,
            Value<String> targetHalqaIds = const Value.absent(),
            Value<String> targetStudentIds = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CoursesTableCompanion.insert(
            id: id,
            name: name,
            description: description,
            image: image,
            centerId: centerId,
            responsibleTeacherId: responsibleTeacherId,
            startDate: startDate,
            endDate: endDate,
            targetHalqaIds: targetHalqaIds,
            targetStudentIds: targetStudentIds,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CoursesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CoursesTableTable,
    CoursesTableData,
    $$CoursesTableTableFilterComposer,
    $$CoursesTableTableOrderingComposer,
    $$CoursesTableTableAnnotationComposer,
    $$CoursesTableTableCreateCompanionBuilder,
    $$CoursesTableTableUpdateCompanionBuilder,
    (
      CoursesTableData,
      BaseReferences<_$AppDatabase, $CoursesTableTable, CoursesTableData>
    ),
    CoursesTableData,
    PrefetchHooks Function()>;
typedef $$ActivitiesTableTableCreateCompanionBuilder = ActivitiesTableCompanion
    Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> image,
  required String centerId,
  Value<String?> location,
  required DateTime startDate,
  required DateTime startTime,
  required DateTime endTime,
  Value<String> targetHalqaIds,
  Value<String?> notes,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$ActivitiesTableTableUpdateCompanionBuilder = ActivitiesTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> image,
  Value<String> centerId,
  Value<String?> location,
  Value<DateTime> startDate,
  Value<DateTime> startTime,
  Value<DateTime> endTime,
  Value<String> targetHalqaIds,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$ActivitiesTableTableFilterComposer
    extends Composer<_$AppDatabase, $ActivitiesTableTable> {
  $$ActivitiesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$ActivitiesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivitiesTableTable> {
  $$ActivitiesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$ActivitiesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivitiesTableTable> {
  $$ActivitiesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get centerId =>
      $composableBuilder(column: $table.centerId, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$ActivitiesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ActivitiesTableTable,
    ActivitiesTableData,
    $$ActivitiesTableTableFilterComposer,
    $$ActivitiesTableTableOrderingComposer,
    $$ActivitiesTableTableAnnotationComposer,
    $$ActivitiesTableTableCreateCompanionBuilder,
    $$ActivitiesTableTableUpdateCompanionBuilder,
    (
      ActivitiesTableData,
      BaseReferences<_$AppDatabase, $ActivitiesTableTable, ActivitiesTableData>
    ),
    ActivitiesTableData,
    PrefetchHooks Function()> {
  $$ActivitiesTableTableTableManager(
      _$AppDatabase db, $ActivitiesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivitiesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivitiesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivitiesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String> centerId = const Value.absent(),
            Value<String?> location = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime> startTime = const Value.absent(),
            Value<DateTime> endTime = const Value.absent(),
            Value<String> targetHalqaIds = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ActivitiesTableCompanion(
            id: id,
            name: name,
            description: description,
            image: image,
            centerId: centerId,
            location: location,
            startDate: startDate,
            startTime: startTime,
            endTime: endTime,
            targetHalqaIds: targetHalqaIds,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            required String centerId,
            Value<String?> location = const Value.absent(),
            required DateTime startDate,
            required DateTime startTime,
            required DateTime endTime,
            Value<String> targetHalqaIds = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ActivitiesTableCompanion.insert(
            id: id,
            name: name,
            description: description,
            image: image,
            centerId: centerId,
            location: location,
            startDate: startDate,
            startTime: startTime,
            endTime: endTime,
            targetHalqaIds: targetHalqaIds,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ActivitiesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ActivitiesTableTable,
    ActivitiesTableData,
    $$ActivitiesTableTableFilterComposer,
    $$ActivitiesTableTableOrderingComposer,
    $$ActivitiesTableTableAnnotationComposer,
    $$ActivitiesTableTableCreateCompanionBuilder,
    $$ActivitiesTableTableUpdateCompanionBuilder,
    (
      ActivitiesTableData,
      BaseReferences<_$AppDatabase, $ActivitiesTableTable, ActivitiesTableData>
    ),
    ActivitiesTableData,
    PrefetchHooks Function()>;
typedef $$FeesTableTableCreateCompanionBuilder = FeesTableCompanion Function({
  required String id,
  required String name,
  required String centerId,
  required int month,
  required int day,
  required double amount,
  Value<String> targetHalqaIds,
  Value<String?> notes,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$FeesTableTableUpdateCompanionBuilder = FeesTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> centerId,
  Value<int> month,
  Value<int> day,
  Value<double> amount,
  Value<String> targetHalqaIds,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$FeesTableTableFilterComposer
    extends Composer<_$AppDatabase, $FeesTableTable> {
  $$FeesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$FeesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FeesTableTable> {
  $$FeesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get month => $composableBuilder(
      column: $table.month, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get day => $composableBuilder(
      column: $table.day, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$FeesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeesTableTable> {
  $$FeesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get centerId =>
      $composableBuilder(column: $table.centerId, builder: (column) => column);

  GeneratedColumn<int> get month =>
      $composableBuilder(column: $table.month, builder: (column) => column);

  GeneratedColumn<int> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$FeesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeesTableTable,
    FeesTableData,
    $$FeesTableTableFilterComposer,
    $$FeesTableTableOrderingComposer,
    $$FeesTableTableAnnotationComposer,
    $$FeesTableTableCreateCompanionBuilder,
    $$FeesTableTableUpdateCompanionBuilder,
    (
      FeesTableData,
      BaseReferences<_$AppDatabase, $FeesTableTable, FeesTableData>
    ),
    FeesTableData,
    PrefetchHooks Function()> {
  $$FeesTableTableTableManager(_$AppDatabase db, $FeesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> centerId = const Value.absent(),
            Value<int> month = const Value.absent(),
            Value<int> day = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> targetHalqaIds = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FeesTableCompanion(
            id: id,
            name: name,
            centerId: centerId,
            month: month,
            day: day,
            amount: amount,
            targetHalqaIds: targetHalqaIds,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String centerId,
            required int month,
            required int day,
            required double amount,
            Value<String> targetHalqaIds = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FeesTableCompanion.insert(
            id: id,
            name: name,
            centerId: centerId,
            month: month,
            day: day,
            amount: amount,
            targetHalqaIds: targetHalqaIds,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeesTableTable,
    FeesTableData,
    $$FeesTableTableFilterComposer,
    $$FeesTableTableOrderingComposer,
    $$FeesTableTableAnnotationComposer,
    $$FeesTableTableCreateCompanionBuilder,
    $$FeesTableTableUpdateCompanionBuilder,
    (
      FeesTableData,
      BaseReferences<_$AppDatabase, $FeesTableTable, FeesTableData>
    ),
    FeesTableData,
    PrefetchHooks Function()>;
typedef $$FeePaymentsTableTableCreateCompanionBuilder
    = FeePaymentsTableCompanion Function({
  required String id,
  required String feeId,
  required String studentId,
  required String halqaId,
  Value<String> status,
  Value<double?> paidAmount,
  Value<DateTime?> paidAt,
  Value<String?> confirmedBy,
  Value<String?> notes,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$FeePaymentsTableTableUpdateCompanionBuilder
    = FeePaymentsTableCompanion Function({
  Value<String> id,
  Value<String> feeId,
  Value<String> studentId,
  Value<String> halqaId,
  Value<String> status,
  Value<double?> paidAmount,
  Value<DateTime?> paidAt,
  Value<String?> confirmedBy,
  Value<String?> notes,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$FeePaymentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $FeePaymentsTableTable> {
  $$FeePaymentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get feeId => $composableBuilder(
      column: $table.feeId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get halqaId => $composableBuilder(
      column: $table.halqaId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get paidAt => $composableBuilder(
      column: $table.paidAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get confirmedBy => $composableBuilder(
      column: $table.confirmedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$FeePaymentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $FeePaymentsTableTable> {
  $$FeePaymentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get feeId => $composableBuilder(
      column: $table.feeId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get studentId => $composableBuilder(
      column: $table.studentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get halqaId => $composableBuilder(
      column: $table.halqaId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get paidAt => $composableBuilder(
      column: $table.paidAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get confirmedBy => $composableBuilder(
      column: $table.confirmedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$FeePaymentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $FeePaymentsTableTable> {
  $$FeePaymentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get feeId =>
      $composableBuilder(column: $table.feeId, builder: (column) => column);

  GeneratedColumn<String> get studentId =>
      $composableBuilder(column: $table.studentId, builder: (column) => column);

  GeneratedColumn<String> get halqaId =>
      $composableBuilder(column: $table.halqaId, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<double> get paidAmount => $composableBuilder(
      column: $table.paidAmount, builder: (column) => column);

  GeneratedColumn<DateTime> get paidAt =>
      $composableBuilder(column: $table.paidAt, builder: (column) => column);

  GeneratedColumn<String> get confirmedBy => $composableBuilder(
      column: $table.confirmedBy, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$FeePaymentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FeePaymentsTableTable,
    FeePaymentsTableData,
    $$FeePaymentsTableTableFilterComposer,
    $$FeePaymentsTableTableOrderingComposer,
    $$FeePaymentsTableTableAnnotationComposer,
    $$FeePaymentsTableTableCreateCompanionBuilder,
    $$FeePaymentsTableTableUpdateCompanionBuilder,
    (
      FeePaymentsTableData,
      BaseReferences<_$AppDatabase, $FeePaymentsTableTable,
          FeePaymentsTableData>
    ),
    FeePaymentsTableData,
    PrefetchHooks Function()> {
  $$FeePaymentsTableTableTableManager(
      _$AppDatabase db, $FeePaymentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FeePaymentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FeePaymentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FeePaymentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> feeId = const Value.absent(),
            Value<String> studentId = const Value.absent(),
            Value<String> halqaId = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<double?> paidAmount = const Value.absent(),
            Value<DateTime?> paidAt = const Value.absent(),
            Value<String?> confirmedBy = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FeePaymentsTableCompanion(
            id: id,
            feeId: feeId,
            studentId: studentId,
            halqaId: halqaId,
            status: status,
            paidAmount: paidAmount,
            paidAt: paidAt,
            confirmedBy: confirmedBy,
            notes: notes,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String feeId,
            required String studentId,
            required String halqaId,
            Value<String> status = const Value.absent(),
            Value<double?> paidAmount = const Value.absent(),
            Value<DateTime?> paidAt = const Value.absent(),
            Value<String?> confirmedBy = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              FeePaymentsTableCompanion.insert(
            id: id,
            feeId: feeId,
            studentId: studentId,
            halqaId: halqaId,
            status: status,
            paidAmount: paidAmount,
            paidAt: paidAt,
            confirmedBy: confirmedBy,
            notes: notes,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FeePaymentsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FeePaymentsTableTable,
    FeePaymentsTableData,
    $$FeePaymentsTableTableFilterComposer,
    $$FeePaymentsTableTableOrderingComposer,
    $$FeePaymentsTableTableAnnotationComposer,
    $$FeePaymentsTableTableCreateCompanionBuilder,
    $$FeePaymentsTableTableUpdateCompanionBuilder,
    (
      FeePaymentsTableData,
      BaseReferences<_$AppDatabase, $FeePaymentsTableTable,
          FeePaymentsTableData>
    ),
    FeePaymentsTableData,
    PrefetchHooks Function()>;
typedef $$HolidaysTableTableCreateCompanionBuilder = HolidaysTableCompanion
    Function({
  required String id,
  required String name,
  required String centerId,
  required DateTime startDate,
  Value<DateTime?> endDate,
  Value<String> targetHalqaIds,
  Value<bool> isRecurring,
  Value<String?> notes,
  Value<String> status,
  Value<String?> requestedBy,
  Value<String?> approvedBy,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$HolidaysTableTableUpdateCompanionBuilder = HolidaysTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> centerId,
  Value<DateTime> startDate,
  Value<DateTime?> endDate,
  Value<String> targetHalqaIds,
  Value<bool> isRecurring,
  Value<String?> notes,
  Value<String> status,
  Value<String?> requestedBy,
  Value<String?> approvedBy,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$HolidaysTableTableFilterComposer
    extends Composer<_$AppDatabase, $HolidaysTableTable> {
  $$HolidaysTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get requestedBy => $composableBuilder(
      column: $table.requestedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get approvedBy => $composableBuilder(
      column: $table.approvedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$HolidaysTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HolidaysTableTable> {
  $$HolidaysTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get requestedBy => $composableBuilder(
      column: $table.requestedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get approvedBy => $composableBuilder(
      column: $table.approvedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$HolidaysTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HolidaysTableTable> {
  $$HolidaysTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get centerId =>
      $composableBuilder(column: $table.centerId, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds, builder: (column) => column);

  GeneratedColumn<bool> get isRecurring => $composableBuilder(
      column: $table.isRecurring, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get requestedBy => $composableBuilder(
      column: $table.requestedBy, builder: (column) => column);

  GeneratedColumn<String> get approvedBy => $composableBuilder(
      column: $table.approvedBy, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$HolidaysTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HolidaysTableTable,
    HolidaysTableData,
    $$HolidaysTableTableFilterComposer,
    $$HolidaysTableTableOrderingComposer,
    $$HolidaysTableTableAnnotationComposer,
    $$HolidaysTableTableCreateCompanionBuilder,
    $$HolidaysTableTableUpdateCompanionBuilder,
    (
      HolidaysTableData,
      BaseReferences<_$AppDatabase, $HolidaysTableTable, HolidaysTableData>
    ),
    HolidaysTableData,
    PrefetchHooks Function()> {
  $$HolidaysTableTableTableManager(_$AppDatabase db, $HolidaysTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HolidaysTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HolidaysTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HolidaysTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> centerId = const Value.absent(),
            Value<DateTime> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<String> targetHalqaIds = const Value.absent(),
            Value<bool> isRecurring = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> requestedBy = const Value.absent(),
            Value<String?> approvedBy = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HolidaysTableCompanion(
            id: id,
            name: name,
            centerId: centerId,
            startDate: startDate,
            endDate: endDate,
            targetHalqaIds: targetHalqaIds,
            isRecurring: isRecurring,
            notes: notes,
            status: status,
            requestedBy: requestedBy,
            approvedBy: approvedBy,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String centerId,
            required DateTime startDate,
            Value<DateTime?> endDate = const Value.absent(),
            Value<String> targetHalqaIds = const Value.absent(),
            Value<bool> isRecurring = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> requestedBy = const Value.absent(),
            Value<String?> approvedBy = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              HolidaysTableCompanion.insert(
            id: id,
            name: name,
            centerId: centerId,
            startDate: startDate,
            endDate: endDate,
            targetHalqaIds: targetHalqaIds,
            isRecurring: isRecurring,
            notes: notes,
            status: status,
            requestedBy: requestedBy,
            approvedBy: approvedBy,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$HolidaysTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $HolidaysTableTable,
    HolidaysTableData,
    $$HolidaysTableTableFilterComposer,
    $$HolidaysTableTableOrderingComposer,
    $$HolidaysTableTableAnnotationComposer,
    $$HolidaysTableTableCreateCompanionBuilder,
    $$HolidaysTableTableUpdateCompanionBuilder,
    (
      HolidaysTableData,
      BaseReferences<_$AppDatabase, $HolidaysTableTable, HolidaysTableData>
    ),
    HolidaysTableData,
    PrefetchHooks Function()>;
typedef $$AnnouncementsTableTableCreateCompanionBuilder
    = AnnouncementsTableCompanion Function({
  required String id,
  required String title,
  required String content,
  Value<String?> image,
  required String centerId,
  required String createdBy,
  Value<String> scope,
  Value<String?> targetHalqaIds,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});
typedef $$AnnouncementsTableTableUpdateCompanionBuilder
    = AnnouncementsTableCompanion Function({
  Value<String> id,
  Value<String> title,
  Value<String> content,
  Value<String?> image,
  Value<String> centerId,
  Value<String> createdBy,
  Value<String> scope,
  Value<String?> targetHalqaIds,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<String> syncStatus,
  Value<int> rowid,
});

class $$AnnouncementsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AnnouncementsTableTable> {
  $$AnnouncementsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scope => $composableBuilder(
      column: $table.scope, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$AnnouncementsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AnnouncementsTableTable> {
  $$AnnouncementsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scope => $composableBuilder(
      column: $table.scope, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$AnnouncementsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AnnouncementsTableTable> {
  $$AnnouncementsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get centerId =>
      $composableBuilder(column: $table.centerId, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get targetHalqaIds => $composableBuilder(
      column: $table.targetHalqaIds, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$AnnouncementsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AnnouncementsTableTable,
    AnnouncementsTableData,
    $$AnnouncementsTableTableFilterComposer,
    $$AnnouncementsTableTableOrderingComposer,
    $$AnnouncementsTableTableAnnotationComposer,
    $$AnnouncementsTableTableCreateCompanionBuilder,
    $$AnnouncementsTableTableUpdateCompanionBuilder,
    (
      AnnouncementsTableData,
      BaseReferences<_$AppDatabase, $AnnouncementsTableTable,
          AnnouncementsTableData>
    ),
    AnnouncementsTableData,
    PrefetchHooks Function()> {
  $$AnnouncementsTableTableTableManager(
      _$AppDatabase db, $AnnouncementsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AnnouncementsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AnnouncementsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AnnouncementsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String> centerId = const Value.absent(),
            Value<String> createdBy = const Value.absent(),
            Value<String> scope = const Value.absent(),
            Value<String?> targetHalqaIds = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AnnouncementsTableCompanion(
            id: id,
            title: title,
            content: content,
            image: image,
            centerId: centerId,
            createdBy: createdBy,
            scope: scope,
            targetHalqaIds: targetHalqaIds,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String title,
            required String content,
            Value<String?> image = const Value.absent(),
            required String centerId,
            required String createdBy,
            Value<String> scope = const Value.absent(),
            Value<String?> targetHalqaIds = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<String> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AnnouncementsTableCompanion.insert(
            id: id,
            title: title,
            content: content,
            image: image,
            centerId: centerId,
            createdBy: createdBy,
            scope: scope,
            targetHalqaIds: targetHalqaIds,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AnnouncementsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AnnouncementsTableTable,
    AnnouncementsTableData,
    $$AnnouncementsTableTableFilterComposer,
    $$AnnouncementsTableTableOrderingComposer,
    $$AnnouncementsTableTableAnnotationComposer,
    $$AnnouncementsTableTableCreateCompanionBuilder,
    $$AnnouncementsTableTableUpdateCompanionBuilder,
    (
      AnnouncementsTableData,
      BaseReferences<_$AppDatabase, $AnnouncementsTableTable,
          AnnouncementsTableData>
    ),
    AnnouncementsTableData,
    PrefetchHooks Function()>;
typedef $$AppSettingsTableTableCreateCompanionBuilder
    = AppSettingsTableCompanion Function({
  required String key,
  required String value,
  Value<String?> centerId,
  Value<int> rowid,
});
typedef $$AppSettingsTableTableUpdateCompanionBuilder
    = AppSettingsTableCompanion Function({
  Value<String> key,
  Value<String> value,
  Value<String?> centerId,
  Value<int> rowid,
});

class $$AppSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get centerId => $composableBuilder(
      column: $table.centerId, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTableTable> {
  $$AppSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get centerId =>
      $composableBuilder(column: $table.centerId, builder: (column) => column);
}

class $$AppSettingsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettingsTableData,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableAnnotationComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder,
    (
      AppSettingsTableData,
      BaseReferences<_$AppDatabase, $AppSettingsTableTable,
          AppSettingsTableData>
    ),
    AppSettingsTableData,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableTableManager(
      _$AppDatabase db, $AppSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<String?> centerId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsTableCompanion(
            key: key,
            value: value,
            centerId: centerId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<String?> centerId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsTableCompanion.insert(
            key: key,
            value: value,
            centerId: centerId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTableTable,
    AppSettingsTableData,
    $$AppSettingsTableTableFilterComposer,
    $$AppSettingsTableTableOrderingComposer,
    $$AppSettingsTableTableAnnotationComposer,
    $$AppSettingsTableTableCreateCompanionBuilder,
    $$AppSettingsTableTableUpdateCompanionBuilder,
    (
      AppSettingsTableData,
      BaseReferences<_$AppDatabase, $AppSettingsTableTable,
          AppSettingsTableData>
    ),
    AppSettingsTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableTableManager get usersTable =>
      $$UsersTableTableTableManager(_db, _db.usersTable);
  $$CentersTableTableTableManager get centersTable =>
      $$CentersTableTableTableManager(_db, _db.centersTable);
  $$HalqatTableTableTableManager get halqatTable =>
      $$HalqatTableTableTableManager(_db, _db.halqatTable);
  $$StudentsTableTableTableManager get studentsTable =>
      $$StudentsTableTableTableManager(_db, _db.studentsTable);
  $$DailyReportsTableTableTableManager get dailyReportsTable =>
      $$DailyReportsTableTableTableManager(_db, _db.dailyReportsTable);
  $$StudentReportsTableTableTableManager get studentReportsTable =>
      $$StudentReportsTableTableTableManager(_db, _db.studentReportsTable);
  $$RecitationsTableTableTableManager get recitationsTable =>
      $$RecitationsTableTableTableManager(_db, _db.recitationsTable);
  $$CoursesTableTableTableManager get coursesTable =>
      $$CoursesTableTableTableManager(_db, _db.coursesTable);
  $$ActivitiesTableTableTableManager get activitiesTable =>
      $$ActivitiesTableTableTableManager(_db, _db.activitiesTable);
  $$FeesTableTableTableManager get feesTable =>
      $$FeesTableTableTableManager(_db, _db.feesTable);
  $$FeePaymentsTableTableTableManager get feePaymentsTable =>
      $$FeePaymentsTableTableTableManager(_db, _db.feePaymentsTable);
  $$HolidaysTableTableTableManager get holidaysTable =>
      $$HolidaysTableTableTableManager(_db, _db.holidaysTable);
  $$AnnouncementsTableTableTableManager get announcementsTable =>
      $$AnnouncementsTableTableTableManager(_db, _db.announcementsTable);
  $$AppSettingsTableTableTableManager get appSettingsTable =>
      $$AppSettingsTableTableTableManager(_db, _db.appSettingsTable);
}
