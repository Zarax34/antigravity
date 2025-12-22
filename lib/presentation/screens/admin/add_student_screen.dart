import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/halqa_provider.dart';
import '../../providers/student_provider.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers
  final _nameController = TextEditingController();
  final _ageController = TextEditingController(); // العمر
  final _birthPlaceController = TextEditingController(); // مكان الميلاد
  
  final _guardianNameController = TextEditingController();
  final _guardianJobController = TextEditingController();
  final _studentPhoneController = TextEditingController();
  final _guardianPhoneController = TextEditingController();
  final _addressController = TextEditingController(); // السكن الحالي
  
  final _notesController = TextEditingController();

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  DateTime? _birthDate;
  DateTime? _joinDate;
  String? _selectedHalqa;
  
  // Note: Previous memorization removed to match design requirements

  @override
  void initState() {
    super.initState();
    // Load halqat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HalqaProvider>().loadHalqat();
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _birthPlaceController.dispose();
    _guardianNameController.dispose();
    _guardianJobController.dispose();
    _studentPhoneController.dispose();
    _guardianPhoneController.dispose();
    _addressController.dispose();
    _notesController.dispose();
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
                    
                    // Guardian section
                    _buildSectionHeader(
                      icon: Icons.family_restroom,
                      title: 'ولي الأمر والتواصل',
                      isDark: isDark,
                    ),
                    _buildGuardianFields(isDark),
                    
                    _buildDivider(isDark),
                    
                    // Academic section
                    _buildSectionHeader(
                      icon: Icons.school,
                      title: 'بيانات التحفيظ',
                      isDark: isDark,
                    ),
                    _buildAcademicFields(isDark),
                    
                    _buildDivider(isDark),
                    
                    // Notes section
                    _buildSectionHeader(
                      icon: Icons.note,
                      title: 'ملاحظات',
                      isDark: isDark,
                    ),
                    _buildNotesField(isDark),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            
            // Bottom action buttons
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
        'تسجيل طالب جديد',
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
            onTap: _pickImage,
            child: Stack(
              children: [
                Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    color: isDark ? Colors.grey[800] : Colors.grey[100],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                      width: 4,
                    ),
                    image: _selectedImage != null
                        ? DecorationImage(
                            image: FileImage(_selectedImage!),
                            fit: BoxFit.cover,
                          )
                        : const DecorationImage(
                            image: NetworkImage(
                              "https://lh3.googleusercontent.com/aida-public/AB6AXuBz8DKddvayhbh3IgU6NwfNh7fV7gT122yw6YEncfhRzqarHbZY7dZ-iViDiAX8QKvOa0uQEU30tC37LWVa_I-qsCF_PxTRLWMbA6Dp0lHP__zvG27v0CE1tqtch3BfPF_caFUCpXAeLrievljJtU3TH4ERH61XsRyRbl2DlLWkOwgyftHqW07-f9eIUWOlzmmfBwkTdnY6LwvpNtGDRBAGOHpyQg4coq_rjshB78o3g8b6DwRIj6ll8GsWJirOnHbBM74dVriOri8"
                            ),
                            fit: BoxFit.cover,
                          ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
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
                    child: Icon(
                      _selectedImage != null ? Icons.edit : Icons.add_a_photo,
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
            'صورة الطالب',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'اضغط للتحميل',
                style: TextStyle(
                  fontSize: 14,
                  color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
                ),
              ),
              if (_selectedImage != null) ...[
                const SizedBox(width: 8),
                Text('|', style: TextStyle(color: Colors.grey[400])),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () => setState(() => _selectedImage = null),
                  child: const Text(
                    'حذف',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('فشل في تحميل الصورة')),
      );
    }
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
      child: Divider(
        color: isDark ? Colors.grey[800] : Colors.grey[100],
      ),
    );
  }

  Widget _buildPersonalInfoFields(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Name Field
          _buildTextField(
            controller: _nameController,
            label: 'الاسم الكامل',
            hint: 'اسم الطالب الرباعي',
            isRequired: true,
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          
          // Age & Birthplace Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: _buildTextField(
                  controller: _ageController,
                  label: 'العمر',
                  hint: '10',
                  keyboardType: TextInputType.number,
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: _buildTextField(
                  controller: _birthPlaceController,
                  label: 'مكان الميلاد',
                  hint: 'المدينة، الدولة',
                  isDark: isDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Date of Birth
          _buildDateField(
            label: 'تاريخ الميلاد',
            value: _birthDate,
            onTap: () => _selectDate(context, (date) {
              setState(() => _birthDate = date);
            }),
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildGuardianFields(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Guardian Name
          _buildTextField(
            controller: _guardianNameController,
            label: 'اسم ولي الأمر',
            hint: 'الاسم الثلاثي',
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          
          // Guardian Job
          _buildTextField(
            controller: _guardianJobController,
            label: 'عمل ولي الأمر',
            hint: 'مثال: معلم، مهندس...',
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          
          // Phones Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildTextField(
                  controller: _studentPhoneController,
                  label: 'هاتف الطالب',
                  hint: '05xxxxxxxx',
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.call,
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildTextField(
                  controller: _guardianPhoneController,
                  label: 'هاتف ولي الأمر',
                  hint: '05xxxxxxxx',
                  keyboardType: TextInputType.phone,
                  prefixIcon: Icons.call,
                  isRequired: true,
                  isDark: isDark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Residence
          _buildTextField(
            controller: _addressController,
            label: 'السكن الحالي',
            hint: 'الحي، الشارع',
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildAcademicFields(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Consumer<HalqaProvider>(
        builder: (context, halqaProvider, child) {
          final halqat = halqaProvider.halqat;
          
          return Column(
            children: [
              // Join Date
              _buildDateField(
                label: 'تاريخ الالتحاق',
                value: _joinDate,
                onTap: () => _selectDate(context, (date) {
                  setState(() => _joinDate = date);
                }),
                isDark: isDark,
              ),
              const SizedBox(height: 16),
              
              // Halqa Selection
              _buildDropdownField(
                label: 'اسم الحلقة',
                value: _selectedHalqa,
                items: halqat.map((h) => DropdownMenuItem(
                  value: h.id,
                  child: Text(h.name),
                )).toList(),
                onChanged: (value) => setState(() => _selectedHalqa = value),
                isDark: isDark,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNotesField(bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _notesController,
            maxLines: 4,
            style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
            decoration: InputDecoration(
              hintText: 'أي ملاحظات إضافية عن الطالب...',
              hintStyle: TextStyle(color: isDark ? Colors.grey[500] : AppTheme.textHint),
              filled: true,
              fillColor: isDark ? AppTheme.darkSurface : Colors.white,
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
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool isDark,
    bool isRequired = false,
    TextInputType? keyboardType,
    IconData? prefixIcon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey[200] : AppTheme.textPrimary,
              ),
            ),
            if (isRequired)
              const Text(
                ' *',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: isDark ? Colors.grey[500] : AppTheme.textHint),
            prefixIcon: prefixIcon != null
                ? Icon(prefixIcon, color: isDark ? Colors.grey[400] : Colors.grey[500])
                : null,
            filled: true,
            fillColor: isDark ? AppTheme.darkSurface : Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'هذا الحقل مطلوب';
                  }
                  return null;
                }
              : null,
        ),
      ],
    );
  }

  Widget _buildDateField({
    required String label,
    required DateTime? value,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey[200] : AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkSurface : Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value != null
                        ? '${value.year}-${value.month.toString().padLeft(2, '0')}-${value.day.toString().padLeft(2, '0')}'
                        : 'dd/mm/yyyy', // Placeholder style
                    style: TextStyle(
                      color: value != null
                          ? (isDark ? Colors.white : AppTheme.textPrimary)
                          : (isDark ? Colors.grey[500] : AppTheme.textHint),
                    ),
                  ),
                ),
                Icon(
                  Icons.calendar_today,
                  color: isDark ? Colors.grey[400] : Colors.grey[500],
                  size: 20,
                ),
              ],
            ),
          ),
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
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: isDark ? Colors.grey[200] : AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
            ),
          ),
          child: DropdownButtonFormField<String>(
            value: value,
            hint: Text(
              'اختر الحلقة...',
              style: TextStyle(color: isDark ? Colors.grey[500] : AppTheme.textHint),
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 11, vertical: 4),
            ),
            dropdownColor: isDark ? AppTheme.darkSurface : Colors.white,
            items: items,
            onChanged: onChanged,
            icon: Icon(
              Icons.expand_more,
              color: isDark ? Colors.grey[400] : Colors.grey[500],
            ),
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
            top: BorderSide(
              color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: BorderSide(
                    color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
                  ),
                  backgroundColor: isDark ? Colors.grey[800] : const Color(0xFFF6F6F8),
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
                onPressed: _saveStudent,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  shadowColor: AppTheme.primaryColor.withValues(alpha: 0.3),
                ),
                child: const Text(
                  'حفظ الطالب',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, Function(DateTime) onSelect) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      locale: const Locale('ar'),
    );
    if (date != null) {
      onSelect(date);
    }
  }

  void _saveStudent() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedHalqa == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('يرجى اختيار الحلقة'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        );
        return;
      }
      
      if (_guardianPhoneController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('رقم هاتف ولي الأمر مطلوب'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        );
        return;
      }
      
      // Get the selected halqa to pass its maxStudents limit
      final halqaProvider = context.read<HalqaProvider>();
      final selectedHalqa = halqaProvider.getHalqaById(_selectedHalqa!);
      
      final success = await context.read<StudentProvider>().addStudent(
        fullName: _nameController.text.trim(),
        halqaId: _selectedHalqa!,
        parentName: _guardianNameController.text.trim(),
        parentPhone: _guardianPhoneController.text.trim(),
        parentJob: _guardianJobController.text.trim(),
        currentResidence: _addressController.text.trim(),
        age: int.tryParse(_ageController.text),
        birthDate: _birthDate,
        phone: _studentPhoneController.text.trim(),
        profileImage: _selectedImage?.path,
        // previousMemorization removed as per requirement
        notes: _notesController.text.trim(),
        maxStudentsInHalqa: selectedHalqa?.maxStudents,
      );
      
      if (mounted) {
        if (success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('تم حفظ الطالب بنجاح'),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          );
          context.pop();
        } else {
          final error = context.read<StudentProvider>().error;
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
