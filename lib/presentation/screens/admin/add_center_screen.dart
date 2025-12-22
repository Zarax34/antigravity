import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/center_provider.dart';
import '../../providers/user_provider.dart';
import '../../../data/models/user.dart';

class AddCenterScreen extends StatefulWidget {
  const AddCenterScreen({super.key});

  @override
  State<AddCenterScreen> createState() => _AddCenterScreenState();
}

class _AddCenterScreenState extends State<AddCenterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _descriptionController = TextEditingController();
  
  String? _selectedManager;
  
  @override
  void initState() {
    super.initState();
    // Load users explicitly to ensure we have the latest list
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().loadUsers();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
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
                    // Logo section
                    _buildLogoSection(isDark),
                    
                    // Basic info section
                    _buildSectionHeader(
                      icon: Icons.mosque,
                      title: 'البيانات الأساسية',
                      isDark: isDark,
                    ),
                    _buildBasicInfoFields(isDark),
                    
                    _buildDivider(isDark),
                    
                    // Contact section
                    _buildSectionHeader(
                      icon: Icons.contact_phone,
                      title: 'بيانات التواصل',
                      isDark: isDark,
                    ),
                    _buildContactFields(isDark),
                    
                    _buildDivider(isDark),
                    
                    // Management section
                    _buildSectionHeader(
                      icon: Icons.manage_accounts,
                      title: 'الإدارة',
                      isDark: isDark,
                    ),
                    _buildManagementFields(isDark),
                    
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
        'إضافة مركز جديد',
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

  Widget _buildLogoSection(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.grey[100],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.mosque_rounded,
                    size: 56,
                    color: isDark ? Colors.grey[600] : Colors.grey[400],
                  ),
                ),
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark ? AppTheme.darkBackground : Colors.white,
                        width: 2,
                      ),
                    ),
                    child: const Icon(
                      Icons.add_photo_alternate,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'شعار المركز',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'اضغط لرفع صورة',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
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

  Widget _buildBasicInfoFields(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildTextField(
            controller: _nameController,
            label: 'اسم المركز',
            hint: 'مثال: مركز النور لتحفيظ القرآن',
            icon: Icons.mosque_outlined,
            isRequired: true,
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _cityController,
                  label: 'المدينة',
                  hint: 'الرياض',
                  icon: Icons.location_city,
                  isRequired: true,
                  isDark: isDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _addressController,
            label: 'العنوان التفصيلي',
            hint: 'الحي، الشارع، رقم المبنى',
            icon: Icons.location_on_outlined,
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _descriptionController,
            label: 'وصف المركز',
            hint: 'نبذة مختصرة عن المركز وأنشطته...',
            icon: Icons.description_outlined,
            maxLines: 3,
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildContactFields(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _buildTextField(
            controller: _phoneController,
            label: 'رقم الهاتف',
            hint: '01xxxxxxxxx',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            isRequired: true,
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: _emailController,
            label: 'البريد الإلكتروني',
            hint: 'center@example.com',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildManagementFields(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'مسؤول المركز',
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
              border: Border.all(
                color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
              ),
            ),
            child: Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                // Filter for center managers only
                // If list is empty, we should probably allow adding one or show a message
                // For now, we show all potential candidates (e.g. Center Managers)
                final managers = userProvider.users.where((u) => u.role == UserRole.centerManager).toList();
                
                return DropdownButtonFormField<String>(
                  value: _selectedManager,
                  hint: Row(
                    children: [
                      Icon(Icons.person_outline, color: isDark ? Colors.grey[500] : Colors.grey[400], size: 20),
                      const SizedBox(width: 12),
                      Text(
                        managers.isEmpty ? 'لا يوجد مدراء متاحين' : 'اختر مسؤول المركز...',
                        style: TextStyle(color: isDark ? Colors.grey[500] : AppTheme.textHint),
                      ),
                    ],
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  dropdownColor: isDark ? AppTheme.darkSurface : Colors.white,
                  items: managers.map((m) => DropdownMenuItem(
                    value: m.id,
                    child: Text(m.fullName),
                  )).toList(),
                  onChanged: (value) => setState(() => _selectedManager = value),
                );
              }
            ),
          ),
          const SizedBox(height: 16),
          
          // Info card
          Container(
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
                    'سيتم إرسال دعوة للمسؤول المختار لإدارة المركز',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.blue[200] : AppTheme.primaryDark,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required bool isDark,
    bool isRequired = false,
    TextInputType? keyboardType,
    int maxLines = 1,
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
          maxLines: maxLines,
          style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: isDark ? Colors.grey[500] : AppTheme.textHint),
            prefixIcon: maxLines == 1
                ? Icon(icon, color: isDark ? Colors.grey[400] : Colors.grey[500])
                : null,
            filled: true,
            fillColor: isDark ? AppTheme.darkSurface : Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: maxLines > 1 ? 16 : 0,
            ),
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
                onPressed: _saveCenter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                  shadowColor: AppTheme.primaryColor.withOpacity(0.3),
                ),
                child: const Text(
                  'حفظ المركز',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveCenter() async {
    if (_formKey.currentState!.validate()) {
      final success = await context.read<CenterProvider>().addCenter(
        name: _nameController.text.trim(),
        address: _addressController.text.trim(),
        city: _cityController.text.trim(),
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        managerId: _selectedManager,
      );
      
      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('تم حفظ المركز بنجاح'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          );
          context.pop();
        } else {
          final error = context.read<CenterProvider>().error;
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
