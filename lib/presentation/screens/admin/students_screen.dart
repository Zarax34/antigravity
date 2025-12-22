import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';

import '../../providers/student_provider.dart';
import '../../providers/halqa_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/models/student.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  State<StudentsScreen> createState() => _StudentsScreenState();
}

class _StudentsScreenState extends State<StudentsScreen> {
  final _searchController = TextEditingController();
  String? _selectedHalqaId;
  List<Student> _filteredStudents = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<StudentProvider>().loadStudents();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterStudents() {
    final provider = context.read<StudentProvider>();
    final query = _searchController.text.toLowerCase();
    
    setState(() {
      if (query.isEmpty) {
        _filteredStudents = _selectedHalqaId != null
            ? provider.allStudents.where((s) => s.halqaId == _selectedHalqaId).toList()
            : provider.allStudents;
      } else {
        _filteredStudents = provider.searchStudents(query);
        if (_selectedHalqaId != null) {
          _filteredStudents = _filteredStudents
              .where((s) => s.halqaId == _selectedHalqaId)
              .toList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة الطلاب'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/admin'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.upload_file),
            tooltip: 'استيراد من Excel',
            onPressed: _importFromExcel,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search and Filter Bar
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                // Search Field
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'بحث عن طالب...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              _filterStudents();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (_) => _filterStudents(),
                ),
                const SizedBox(height: 12),
                
                // Halqa Filter
                Consumer<HalqaProvider>(
                  builder: (context, provider, _) {
                    return DropdownButtonFormField<String?>(
                      value: _selectedHalqaId,
                      decoration: InputDecoration(
                        labelText: 'تصفية حسب الحلقة',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      items: [
                        const DropdownMenuItem(
                          value: null,
                          child: Text('جميع الحلقات'),
                        ),
                        ...provider.halqat.map((halqa) {
                          return DropdownMenuItem(
                            value: halqa.id,
                            child: Text(halqa.name),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        setState(() => _selectedHalqaId = value);
                        _filterStudents();
                      },
                    );
                  },
                ),
              ],
            ),
          ),

          // Students List
          Expanded(
            child: Consumer<StudentProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                final students = _searchController.text.isEmpty && _selectedHalqaId == null
                    ? provider.allStudents
                    : _filteredStudents;

                if (students.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.people_outline,
                          size: 80,
                          color: Colors.grey.shade300,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'لا يوجد طلاب',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: students.length,
                  itemBuilder: (context, index) {
                    final student = students[index];
                    return _buildStudentCard(student);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddStudentDialog(),
        icon: const Icon(Icons.person_add),
        label: const Text('إضافة طالب'),
      ),
    );
  }

  Widget _buildStudentCard(Student student) {
    final halqa = context.read<HalqaProvider>().getHalqaById(student.halqaId);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.primaryLight.withOpacity(0.2),
          child: student.profileImage != null
              ? ClipOval(
                  child: Image.network(
                    student.profileImage!,
                    fit: BoxFit.cover,
                  ),
                )
              : Text(
                  student.fullName.isNotEmpty ? student.fullName[0] : '?',
                  style: const TextStyle(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        title: Text(
          student.fullName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(halqa?.name ?? 'غير محدد'),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'view',
              child: Row(
                children: [
                  Icon(Icons.visibility),
                  SizedBox(width: 8),
                  Text('معاينة'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'edit',
              child: Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 8),
                  Text('تعديل'),
                ],
              ),
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(Icons.delete, color: Colors.red),
                  SizedBox(width: 8),
                  Text('حذف', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 'view':
                _showStudentDetails(student);
                break;
              case 'edit':
                // TODO: Implement edit
                break;
              case 'delete':
                _showDeleteDialog(student);
                break;
            }
          },
        ),
        onTap: () => _showStudentDetails(student),
      ),
    );
  }

  void _showStudentDetails(Student student) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final halqa = context.read<HalqaProvider>().getHalqaById(student.halqaId);
        
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  // Profile
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: AppTheme.primaryLight.withOpacity(0.2),
                          child: Text(
                            student.fullName[0],
                            style: const TextStyle(
                              fontSize: 40,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          student.fullName,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          halqa?.name ?? 'غير محدد',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Info Sections
                  _buildInfoSection('معلومات ولي الأمر', [
                    _buildDetailRow('الاسم', student.parentName),
                    _buildDetailRow('رقم الهاتف', student.parentPhone),
                    if (student.parentJob != null)
                      _buildDetailRow('المهنة', student.parentJob!),
                  ]),
                  
                  _buildInfoSection('معلومات السكن', [
                    if (student.currentResidence != null)
                      _buildDetailRow('السكن الحالي', student.currentResidence!),
                    if (student.previousResidence != null)
                      _buildDetailRow('السكن السابق', student.previousResidence!),
                    if (student.governorate != null)
                      _buildDetailRow('المحافظة', student.governorate!),
                  ]),
                  
                  _buildInfoSection('معلومات أخرى', [
                    if (student.age != null)
                      _buildDetailRow('العمر', '${student.age} سنة'),
                    _buildDetailRow(
                      'تاريخ الالتحاق',
                      '${student.enrollmentDate.day}/${student.enrollmentDate.month}/${student.enrollmentDate.year}',
                    ),
                    if (student.previousMemorization != null)
                      _buildDetailRow('الحفظ السابق', student.previousMemorization!),
                    if (student.notes != null)
                      _buildDetailRow('ملاحظات', student.notes!),
                  ]),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildInfoSection(String title, List<Widget> children) {
    if (children.isEmpty) return const SizedBox.shrink();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        ...children,
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddStudentDialog() {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final parentNameController = TextEditingController();
    final parentPhoneController = TextEditingController();
    String? selectedHalqaId;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            initialChildSize: 0.8,
            minChildSize: 0.5,
            maxChildSize: 0.95,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'إضافة طالب جديد',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: 'الاسم الرباعي *',
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (v) => v?.isEmpty ?? true ? 'مطلوب' : null,
                      ),
                      const SizedBox(height: 16),
                      
                      Consumer<HalqaProvider>(
                        builder: (context, provider, _) {
                          return DropdownButtonFormField<String>(
                            value: selectedHalqaId,
                            decoration: const InputDecoration(
                              labelText: 'الحلقة *',
                              prefixIcon: Icon(Icons.groups),
                            ),
                            items: provider.halqat.map((h) {
                              return DropdownMenuItem(
                                value: h.id,
                                child: Text(h.name),
                              );
                            }).toList(),
                            onChanged: (v) => selectedHalqaId = v,
                            validator: (v) => v == null ? 'مطلوب' : null,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      
                      TextFormField(
                        controller: parentNameController,
                        decoration: const InputDecoration(
                          labelText: 'اسم ولي الأمر *',
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (v) => v?.isEmpty ?? true ? 'مطلوب' : null,
                      ),
                      const SizedBox(height: 16),
                      
                      TextFormField(
                        controller: parentPhoneController,
                        decoration: const InputDecoration(
                          labelText: 'رقم ولي الأمر *',
                          prefixIcon: Icon(Icons.phone),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (v) => v?.isEmpty ?? true ? 'مطلوب' : null,
                      ),
                      const SizedBox(height: 24),
                      
                      ElevatedButton(
                        onPressed: () async {
                          if (!formKey.currentState!.validate()) return;
                          
                          final success = await context
                              .read<StudentProvider>()
                              .addStudent(
                                fullName: nameController.text,
                                halqaId: selectedHalqaId!,
                                parentName: parentNameController.text,
                                parentPhone: parentPhoneController.text,
                              );
                          
                          if (success && context.mounted) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('تم إضافة الطالب بنجاح'),
                              ),
                            );
                          }
                        },
                        child: const Text('إضافة الطالب'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void _showDeleteDialog(Student student) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف الطالب'),
        content: Text('هل أنت متأكد من حذف الطالب "${student.fullName}"؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم حذف الطالب')),
              );
            },
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }

  Future<void> _importFromExcel() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
      );
      
      if (result != null) {
        // TODO: Process Excel file
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('جاري معالجة الملف...')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطأ: $e')),
      );
    }
  }
}
