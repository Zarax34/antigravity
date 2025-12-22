import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/user_provider.dart';
import '../../providers/center_provider.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  
  String? _selectedRole;
  String? _selectedCenter;
  bool _obscurePassword = true;
  
  final List<Map<String, String>> _roles = [
    {'id': 'system_admin', 'name': 'مسؤول النظام', 'icon': 'admin_panel_settings'},
    {'id': 'center_manager', 'name': 'مسؤول مركز', 'icon': 'manage_accounts'},
    {'id': 'teacher', 'name': 'معلم', 'icon': 'school'},
    {'id': 'parent', 'name': 'ولي أمر', 'icon': 'family_restroom'},
    {'id': 'student', 'name': 'طالب', 'icon': 'person'},
  ];
  
  @override
  void initState() {
    super.initState();
    // Load centers explicitly to ensure we have the latest list
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CenterProvider>().loadCenters();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        appBar: _buildAppBar(isDark),
        body: Stack(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 100),
                child: Column(
                  children: [
                    // Profile photo section
                    _buildPhotoSection(isDark),
                    
                    // Personal info section
                    _buildSectionHeader(
                      icon: Icons.person,
                      title: 'البيانات الشخصية',
                      isDark: isDark,
                    ),
                    _buildPersonalInfoFields(isDark),
                    
                    _buildDivider(isDark),
                    
                    // Account section
                    _buildSectionHeader(
                      icon: Icons.lock,
                      title: 'بيانات الحساب',
                      isDark: isDark,
                    ),
                    _buildAccountFields(isDark),
                    
                    _buildDivider(isDark),
                    
                    // Role section
                    _buildSectionHeader(
                      icon: Icons.admin_panel_settings,
                      title: 'الصلاحيات',
                      isDark: isDark,
                    ),
                    _buildRoleSelection(isDark),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            
            // Bottom buttons
            _buildBottomButtons(isDark),
          ],
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
        'إضافة مستخدم جديد',
        style: TextStyle(
          color: isDark ? Colors.white : AppTheme.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: isDark ? Colors.grey[800] : Colors.grey[200]),
      ),
    );
  }

  Widget _buildPhotoSection(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.grey[100],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                      width: 4,
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 48,
                    color: isDark ? Colors.grey[600] : Colors.grey[400],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark ? AppTheme.darkBackground : Colors.white,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'صورة المستخدم',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 24),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Divider(color: isDark ? Colors.grey[800] : Colors.grey[100]),
    );
  }

  Widget _buildPersonalInfoFields(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildTextField(
            controller: _nameController,
            label: 'الاسم الكامل',
            hint: 'أدخل الاسم الثلاثي',
            icon: Icons.person_outline,
            isRequired: true,
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            label: 'البريد الإلكتروني',
            hint: 'example@email.com',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _phoneController,
            label: 'رقم الهاتف',
            hint: '05xxxxxxxx',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            isRequired: true,
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildAccountFields(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildTextField(
            controller: _usernameController,
            label: 'اسم المستخدم',
            hint: 'أدخل اسم المستخدم',
            icon: Icons.alternate_email,
            isRequired: true,
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _passwordController,
            label: 'كلمة المرور',
            hint: '••••••••',
            icon: Icons.lock_outline,
            isPassword: true,
            isRequired: true,
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildRoleSelection(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'اختر الدور',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isDark ? Colors.grey[200] : AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'حدد صلاحيات المستخدم في النظام',
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.grey[500] : AppTheme.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          
          // Role cards
          ..._roles.map((role) => _buildRoleCard(role, isDark)),
          
          // Center selection (if applicable)
          if (_selectedRole != null && _selectedRole != 'system_admin') ...[
            const SizedBox(height: 16),
            Consumer<CenterProvider>(builder: (context, centerProvider, child) {
              final activeCenters = centerProvider.activeCenters;
              return _buildDropdownField(
                label: 'المركز التابع له',
                value: _selectedCenter,
                items: activeCenters.map((c) => DropdownMenuItem(
                  value: c.id,
                  child: Text(c.name),
                )).toList(),
                onChanged: (value) => setState(() => _selectedCenter = value),
                isDark: isDark,
              );
            }),
          ],
        ],
      ),
    );
  }

  Widget _buildRoleCard(Map<String, String> role, bool isDark) {
    final isSelected = _selectedRole == role['id'];
    
    return GestureDetector(
      onTap: () => setState(() => _selectedRole = role['id']),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryColor.withOpacity(0.1)
              : (isDark ? AppTheme.darkSurface : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppTheme.primaryColor
                : (isDark ? Colors.grey[700]! : Colors.grey[200]!),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.primaryColor.withOpacity(0.2)
                    : (isDark ? Colors.grey[700] : Colors.grey[100]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _getIconForRole(role['icon']!),
                color: isSelected ? AppTheme.primaryColor : AppTheme.textSecondary,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                role['name']!,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? AppTheme.primaryColor
                      : (isDark ? Colors.white : AppTheme.textPrimary),
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: AppTheme.primaryColor,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForRole(String iconName) {
    switch (iconName) {
      case 'admin_panel_settings':
        return Icons.admin_panel_settings;
      case 'manage_accounts':
        return Icons.manage_accounts;
      case 'school':
        return Icons.school;
      case 'family_restroom':
        return Icons.family_restroom;
      case 'person':
        return Icons.person;
      default:
        return Icons.person;
    }
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool isDark,
    bool isRequired = false,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey[200] : AppTheme.textPrimary,
              ),
            ),
            if (isRequired)
              const Text(' *', style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword ? _obscurePassword : false,
          style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: isDark ? Colors.grey[500] : AppTheme.textHint),
            prefixIcon: Icon(icon, color: isDark ? Colors.grey[400] : Colors.grey[500]),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: isDark ? Colors.grey[400] : Colors.grey[500],
                    ),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  )
                : null,
            filled: true,
            fillColor: isDark ? AppTheme.darkSurface : Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppTheme.primaryColor, width: 2),
            ),
          ),
          validator: isRequired
              ? (value) => value?.isEmpty ?? true ? 'هذا الحقل مطلوب' : null
              : null,
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<DropdownMenuItem<String>> items,
    required ValueChanged<String?> onChanged,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey[200] : AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            hint: Text(
              'اختر المركز...',
              style: TextStyle(color: isDark ? Colors.grey[500] : AppTheme.textHint),
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            dropdownColor: isDark ? AppTheme.darkSurface : Colors.white,
            items: items,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButtons(bool isDark) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurface : Colors.white,
          border: Border(
            top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[200]!),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => context.pop(),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  side: BorderSide(color: isDark ? Colors.grey[600]! : Colors.grey[300]!),
                ),
                child: Text(
                  'إلغاء',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppTheme.textPrimary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: _saveUser,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  shadowColor: AppTheme.primaryColor.withOpacity(0.3),
                ),
                child: const Text(
                  'حفظ المستخدم',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveUser() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedRole == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('يرجى اختيار دور المستخدم'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        );
        return;
      }
      
      // Convert role string to UserRole enum
      UserRole role;
      switch (_selectedRole) {
        case 'system_admin':
          role = UserRole.systemAdmin;
          break;
        case 'center_manager':
          role = UserRole.centerManager;
          break;
        case 'teacher':
          role = UserRole.teacher;
          break;
        case 'parent':
          role = UserRole.parent;
          break;
        case 'student':
          role = UserRole.student;
          break;
        default:
          role = UserRole.student;
      }
      
      final success = await context.read<UserProvider>().addUser(
        username: _usernameController.text.trim(),
        fullName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        role: role,
        centerId: _selectedCenter,
        password: _passwordController.text,
      );
      
      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('تم حفظ المستخدم بنجاح'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          );
          context.pop();
        } else {
          final error = context.read<UserProvider>().error;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error ?? 'حدث خطأ أثناء الحفظ'),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          );
        }
      }
    }
  }
}

