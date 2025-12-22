import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/settings_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  int _maxStudentsPerHalqa = 25;
  bool _hidePhoneNumbers = false;
  bool _allowTeacherReports = true;
  bool _allowTeacherActivityRequests = true;
  bool _biometricLoginEnabled = false;
  
  final _copyrightController = TextEditingController();
  final _developerLinkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with current settings
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final settings = context.read<SettingsProvider>();
      setState(() {
        _maxStudentsPerHalqa = settings.maxStudentsPerHalqa;
        _hidePhoneNumbers = settings.hideParentPhone;
        _allowTeacherReports = settings.allowTeacherReports;
        _allowTeacherActivityRequests = settings.allowTeacherActivityRequests;
        _biometricLoginEnabled = settings.biometricLoginEnabled;
        _copyrightController.text = settings.copyrightText;
        _developerLinkController.text = settings.developerLink;
      });
    });
  }

  @override
  void dispose() {
    _copyrightController.dispose();
    _developerLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ... [No changes to build method structure up to _saveSettings]
    // But since I'm replacing the whole file content to be safe or using blocks...
    // I'll use the provided lines.
    
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        appBar: _buildAppBar(isDark),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Identity section
              _buildSectionTitle('الهوية والنظام', isDark),
              _buildIdentitySection(isDark),
              
              // Halqat settings
              _buildSectionTitle('إعدادات الحلقات', isDark),
              _buildHalqatSection(isDark),
              
              // Privacy section
              _buildSectionTitle('الخصوصية والصلاحيات', isDark),
              _buildPrivacySection(isDark),
              
              // Info card
              _buildInfoCard(isDark),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isDark) {
    return AppBar(
      backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_forward,
          color: isDark ? Colors.white : AppTheme.textPrimary,
        ),
        onPressed: () => context.pop(),
      ),
      title: Text(
        'الإعدادات المتقدمة',
        style: TextStyle(
          color: isDark ? Colors.white : AppTheme.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: _saveSettings,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'حفظ',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: isDark ? Colors.grey[800] : Colors.grey[200]),
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
          letterSpacing: 1,
        ),
      ),
    );
  }

  Widget _buildIdentitySection(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo upload
          InkWell(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('ميزة تغيير الشعار قيد التطوير'), behavior: SnackBarBehavior.floating),
            ),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.grey[800] : Colors.grey[100],
                      borderRadius: BorderRadius.circular(32),
                      border: Border.all(color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.primaryColor.withOpacity(0.3),
                              AppTheme.primaryColor.withOpacity(0.1),
                            ],
                          ),
                        ),
                        child: Icon(Icons.mosque_rounded, color: AppTheme.primaryColor, size: 32),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'شعار النظام',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'يظهر في التقارير والتطبيق',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_left, color: Colors.grey[400]),
                ],
              ),
            ),
          ),
          
          Divider(height: 1, color: isDark ? Colors.grey[800] : Colors.grey[100]),
          
          // Copyright field
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'نص حقوق الملكية',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _copyrightController,
                  style: TextStyle(
                    color: isDark ? Colors.white : AppTheme.textPrimary,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.copyright, color: Colors.grey[400], size: 20),
                    filled: true,
                    fillColor: isDark ? AppTheme.darkBackground : Colors.grey[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ],
            ),
          ),
          
          Divider(height: 1, color: isDark ? Colors.grey[800] : Colors.grey[100]),
          
          // Developer link
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'رابط المطور',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark ? Colors.white : AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _developerLinkController,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: isDark ? Colors.white : AppTheme.textPrimary,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.link, color: Colors.grey[400], size: 20),
                    filled: true,
                    fillColor: isDark ? AppTheme.darkBackground : Colors.grey[50],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHalqatSection(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'الحد الأقصى للطلاب',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppTheme.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'العدد المسموح به في الحلقة الواحدة',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkBackground : Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(4),
            child: Row(
              children: [
                _buildCounterButton(
                  icon: Icons.add,
                  onTap: () => setState(() => _maxStudentsPerHalqa++),
                  isDark: isDark,
                ),
                SizedBox(
                  width: 40,
                  child: Text(
                    '$_maxStudentsPerHalqa',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppTheme.textPrimary,
                    ),
                  ),
                ),
                _buildCounterButton(
                  icon: Icons.remove,
                  onTap: () {
                    if (_maxStudentsPerHalqa > 1) {
                      setState(() => _maxStudentsPerHalqa--);
                    }
                  },
                  isDark: isDark,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
            ),
          ],
        ),
        child: Icon(icon, size: 18, color: isDark ? Colors.white : AppTheme.textPrimary),
      ),
    );
  }

  Widget _buildPrivacySection(bool isDark) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          // Hide phone numbers toggle
          _buildToggleItem(
            icon: Icons.visibility_off,
            iconColor: AppTheme.primaryColor,
            iconBgColor: Colors.blue.withOpacity(0.1),
            title: 'إخفاء أرقام الهواتف',
            subtitle: 'منع المعلمين من رؤية أرقام أولياء الأمور',
            value: _hidePhoneNumbers,
            onChanged: (v) => setState(() => _hidePhoneNumbers = v),
            isDark: isDark,
          ),
          
          // Sub-header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkBackground.withOpacity(0.5) : Colors.grey[50],
              border: Border(
                top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
                bottom: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
              ),
            ),
            child: Text(
              'صلاحيات المعلمين',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
              ),
            ),
          ),
          
          // Teacher reports toggle
          _buildToggleItem(
            icon: Icons.edit_document,
            iconColor: Colors.green,
            iconBgColor: Colors.green.withOpacity(0.1),
            title: 'تسجيل التقارير اليومية',
            subtitle: null,
            value: _allowTeacherReports,
            onChanged: (v) => setState(() => _allowTeacherReports = v),
            isDark: isDark,
          ),
          
          Divider(height: 1, color: isDark ? Colors.grey[800] : Colors.grey[100]),
          
          // Teacher activity requests toggle
          _buildToggleItem(
            icon: Icons.event,
            iconColor: Colors.purple,
            iconBgColor: Colors.purple.withOpacity(0.1),
            title: 'طلب الأنشطة',
            subtitle: 'السماح للمعلمين بطلب أنشطة',
            value: _allowTeacherActivityRequests,
            onChanged: (v) => setState(() => _allowTeacherActivityRequests = v),
            isDark: isDark,
          ),
          
          // Sub-header for security
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkBackground.withOpacity(0.5) : Colors.grey[50],
              border: Border(
                top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
                bottom: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
              ),
            ),
            child: Text(
              'الأمان',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
              ),
            ),
          ),
          
          // Biometric login toggle
          _buildToggleItem(
            icon: Icons.fingerprint,
            iconColor: AppTheme.primaryColor,
            iconBgColor: AppTheme.primaryColor.withOpacity(0.1),
            title: 'تسجيل الدخول بالبصمة',
            subtitle: 'السماح بالدخول باستخدام البصمة أو الوجه',
            value: _biometricLoginEnabled,
            onChanged: (v) => setState(() => _biometricLoginEnabled = v),
            isDark: isDark,
            showBorder: false,
          ),
        ],
      ),
    );
  }

  Widget _buildToggleItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    String? subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool isDark,
    bool showBorder = true,
  }) {
    return Container(
      decoration: showBorder ? BoxDecoration(
        border: Border(
          bottom: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
        ),
      ) : null,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppTheme.textPrimary,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: AppTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(bool isDark) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: AppTheme.primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'أي تغييرات في "حقوق الملكية" أو "الشعار" ستنعكس فوراً على جميع المستخدمين بعد الحفظ.',
              style: TextStyle(
                fontSize: 12,
                color: isDark ? Colors.blue[200] : AppTheme.primaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveSettings() {
    final settings = context.read<SettingsProvider>();
    settings.setMaxStudentsPerHalqa(_maxStudentsPerHalqa);
    settings.setHideParentPhone(_hidePhoneNumbers);
    settings.setAllowTeacherReports(_allowTeacherReports);
    settings.setAllowTeacherActivityRequests(_allowTeacherActivityRequests);
    settings.setBiometricLoginEnabled(_biometricLoginEnabled);
    settings.setCopyrightText(_copyrightController.text);
    settings.setDeveloperLink(_developerLinkController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('تم حفظ الإعدادات بنجاح'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
