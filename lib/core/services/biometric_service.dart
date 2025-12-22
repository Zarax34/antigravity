import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

/// خدمة المصادقة البيومترية (البصمة/الوجه)
class BiometricService {
  static final BiometricService _instance = BiometricService._internal();
  factory BiometricService() => _instance;
  BiometricService._internal();

  final LocalAuthentication _localAuth = LocalAuthentication();

  /// التحقق من دعم الجهاز للبصمة
  Future<bool> isDeviceSupported() async {
    try {
      return await _localAuth.isDeviceSupported();
    } on PlatformException {
      return false;
    }
  }

  /// التحقق من وجود بصمات مسجلة
  Future<bool> canCheckBiometrics() async {
    try {
      return await _localAuth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  /// الحصول على أنواع البيومترية المتاحة
  Future<List<BiometricType>> getAvailableBiometrics() async {
    try {
      return await _localAuth.getAvailableBiometrics();
    } on PlatformException {
      return [];
    }
  }

  /// التحقق من هوية المستخدم بالبصمة
  Future<bool> authenticate() async {
    try {
      final isSupported = await isDeviceSupported();
      if (!isSupported) return false;

      final canCheck = await canCheckBiometrics();
      if (!canCheck) return false;

      return await _localAuth.authenticate(
        localizedReason: 'يرجى التحقق من هويتك للدخول',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print('خطأ في المصادقة البيومترية: ${e.message}');
      return false;
    }
  }

  /// التحقق مع السماح بكلمة المرور كبديل
  Future<bool> authenticateWithFallback() async {
    try {
      final isSupported = await isDeviceSupported();
      if (!isSupported) return false;

      return await _localAuth.authenticate(
        localizedReason: 'يرجى التحقق من هويتك للدخول',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
    } on PlatformException catch (e) {
      print('خطأ في المصادقة: ${e.message}');
      return false;
    }
  }
}
