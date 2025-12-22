import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/course_provider.dart';
import '../../providers/user_provider.dart';
import '../../../data/models/user.dart';

class AddCourseScreen extends StatefulWidget {
  const AddCourseScreen({super.key});

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _locationController = TextEditingController();
  final _notesController = TextEditingController();
  final _feesController = TextEditingController();
  
  DateTime? _startDate;
  DateTime? _endDate;
  String? _selectedTeacherId;
  String? _targetAudience;
  String? _courseImagePath;
  bool _isLoading = false;
  
  final List<String> _targetAudienceOptions = [
    'الكل',
    'الذكور فقط',
    'الإناث فقط',
    'الأطفال (5-12 سنة)',
    'الشباب (13-25 سنة)',
    'الكبار (25+ سنة)',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _locationController.dispose();
    _notesController.dispose();
    _feesController.dispose();
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صورة الدورة
                _buildImageSection(isDark),
                const SizedBox(height: 24),
                
                // معلومات الدورة الأساسية
                _buildSectionTitle('معلومات الدورة', isDark),
                _buildBasicInfoSection(isDark),
                const SizedBox(height: 24),
                
                // التواريخ
                _buildSectionTitle('التواريخ', isDark),
                _buildDatesSection(isDark),
                const SizedBox(height: 24),
                
                // تفاصيل إضافية
                _buildSectionTitle('تفاصيل إضافية', isDark),
                _buildAdditionalInfoSection(isDark),
                const SizedBox(height: 32),
                
                // أزرار الحفظ
                _buildActionButtons(isDark),
                const SizedBox(height: 24),
              ],
            ),
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
        'إضافة دورة جديدة',
        style: TextStyle(
          color: isDark ? Colors.white : AppTheme.textPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSectionTitle(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isDark ? Colors.white : AppTheme.textPrimary,
        ),
      ),
    );
  }

  Widget _buildImageSection(bool isDark) {
    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[300]!,
              style: BorderStyle.solid,
            ),
          ),
          child: _courseImagePath != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    _courseImagePath!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildImagePlaceholder(isDark),
                  ),
                )
              : _buildImagePlaceholder(isDark),
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder(bool isDark) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_photo_alternate_outlined,
          size: 48,
          color: AppTheme.primaryColor,
        ),
        const SizedBox(height: 8),
        Text(
          'اضغط لإضافة صورة الدورة',
          style: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildBasicInfoSection(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
      ),
      child: Column(
        children: [
          // اسم الدورة
          TextFormField(
            controller: _nameController,
            style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
            decoration: InputDecoration(
              labelText: 'اسم الدورة *',
              hintText: 'مثال: دورة تجويد القرآن',
              prefixIcon: Icon(Icons.school, color: AppTheme.primaryColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'يرجى إدخال اسم الدورة';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          // وصف الدورة
          TextFormField(
            controller: _descriptionController,
            style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'وصف الدورة',
              hintText: 'اكتب وصفاً مختصراً للدورة...',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: Icon(Icons.description, color: AppTheme.primaryColor),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 16),
          
          // الفئة المستهدفة
          DropdownButtonFormField<String>(
            value: _targetAudience,
            style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
            decoration: InputDecoration(
              labelText: 'الفئة المستهدفة',
              prefixIcon: Icon(Icons.people, color: AppTheme.primaryColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
            items: _targetAudienceOptions.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (value) => setState(() => _targetAudience = value),
          ),
        ],
      ),
    );
  }

  Widget _buildDatesSection(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
      ),
      child: Row(
        children: [
          // تاريخ البداية
          Expanded(
            child: InkWell(
              onTap: () => _pickDate(isStart: true),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today, size: 16, color: AppTheme.primaryColor),
                        const SizedBox(width: 8),
                        Text(
                          'تاريخ البداية',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _startDate != null
                          ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                          : 'اختر التاريخ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppTheme.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          
          // تاريخ النهاية
          Expanded(
            child: InkWell(
              onTap: () => _pickDate(isStart: false),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.event, size: 16, color: Colors.red),
                        const SizedBox(width: 8),
                        Text(
                          'تاريخ النهاية',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _endDate != null
                          ? '${_endDate!.day}/${_endDate!.month}/${_endDate!.year}'
                          : 'اختر التاريخ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppTheme.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalInfoSection(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
      ),
      child: Column(
        children: [
          // المعلم
          Consumer<UserProvider>(
            builder: (context, userProvider, _) {
              final teachers = userProvider.allUsers
                  .where((u) => u.role == UserRole.teacher && u.isActive)
                  .toList();
              
              return DropdownButtonFormField<String>(
                value: _selectedTeacherId,
                style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
                decoration: InputDecoration(
                  labelText: 'المعلم المسؤول',
                  prefixIcon: Icon(Icons.person, color: AppTheme.primaryColor),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                items: teachers.map((teacher) {
                  return DropdownMenuItem(
                    value: teacher.id,
                    child: Text(teacher.fullName),
                  );
                }).toList(),
                onChanged: (value) => setState(() => _selectedTeacherId = value),
              );
            },
          ),
          const SizedBox(height: 16),
          
          // المكان
          TextFormField(
            controller: _locationController,
            style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
            decoration: InputDecoration(
              labelText: 'المكان',
              hintText: 'مثال: قاعة رقم 1',
              prefixIcon: Icon(Icons.location_on, color: AppTheme.primaryColor),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 16),
          
          // الرسوم
          TextFormField(
            controller: _feesController,
            style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'الرسوم (اختياري)',
              hintText: 'مثال: 100',
              prefixIcon: Icon(Icons.attach_money, color: Colors.green),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 16),
          
          // ملاحظات
          TextFormField(
            controller: _notesController,
            style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
            maxLines: 2,
            decoration: InputDecoration(
              labelText: 'ملاحظات',
              hintText: 'أي ملاحظات إضافية...',
              prefixIcon: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Icon(Icons.note, color: Colors.orange),
              ),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(bool isDark) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => context.pop(),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: Colors.grey.shade400),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'إلغاء',
              style: TextStyle(
                color: isDark ? Colors.grey[400] : Colors.grey[700],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _saveCourse,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: _isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : const Text(
                    'حفظ الدورة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _courseImagePath = image.path);
    }
  }

  Future<void> _pickDate({required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  Future<void> _saveCourse() async {
    if (!_formKey.currentState!.validate()) return;
    
    if (_startDate == null || _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('يرجى تحديد تاريخ البداية والنهاية'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    
    setState(() => _isLoading = true);
    
    try {
      final success = await context.read<CourseProvider>().addCourse(
        name: _nameController.text,
        description: _descriptionController.text,
        startDate: _startDate!,
        endDate: _endDate!,
        teacherId: _selectedTeacherId,
        location: _locationController.text,
        targetAudience: _targetAudience,
        fees: double.tryParse(_feesController.text),
        notes: _notesController.text,
        imageUrl: _courseImagePath,
      );
      
      if (success && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('تم إضافة الدورة بنجاح'),
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
          ),
        );
        context.pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('فشل في إضافة الدورة'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }
}
