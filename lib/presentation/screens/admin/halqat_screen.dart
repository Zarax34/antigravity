import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../providers/halqa_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/models/halqa.dart';

class HalqatScreen extends StatefulWidget {
  const HalqatScreen({super.key});

  @override
  State<HalqatScreen> createState() => _HalqatScreenState();
}

class _HalqatScreenState extends State<HalqatScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HalqaProvider>().loadHalqat();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إدارة الحلقات'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/admin'),
        ),
      ),
      body: Consumer<HalqaProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.halqat.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.groups_outlined,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'لا توجد حلقات',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => _showAddHalqaDialog(),
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة حلقة'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.halqat.length,
            itemBuilder: (context, index) {
              final halqa = provider.halqat[index];
              return _buildHalqaCard(halqa);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddHalqaDialog(),
        icon: const Icon(Icons.add),
        label: const Text('إضافة حلقة'),
      ),
    );
  }

  Widget _buildHalqaCard(Halqa halqa) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: halqa.category == HalqaCategory.youth
              ? Colors.blue.shade100
              : Colors.orange.shade100,
          child: Icon(
            Icons.groups,
            color: halqa.category == HalqaCategory.youth
                ? Colors.blue
                : Colors.orange,
          ),
        ),
        title: Text(
          halqa.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${halqa.category.arabicName} • ${halqa.studentCount}/${halqa.maxStudents} طالب',
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('المعلم', halqa.displayTeacherName),
                if (halqa.description != null)
                  _buildInfoRow('الوصف', halqa.description!),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () => _showEditHalqaDialog(halqa),
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text('تعديل'),
                    ),
                    TextButton.icon(
                      onPressed: () => _showDeleteDialog(halqa),
                      icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                      label: const Text('حذف', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label:',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  void _showAddHalqaDialog() {
    final nameController = TextEditingController();
    final teacherNameController = TextEditingController();
    HalqaCategory selectedCategory = HalqaCategory.youth;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('إضافة حلقة جديدة'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'اسم الحلقة',
                    prefixIcon: Icon(Icons.groups),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: teacherNameController,
                  decoration: const InputDecoration(
                    labelText: 'اسم المعلم',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<HalqaCategory>(
                  value: selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'فئة الحلقة',
                    prefixIcon: Icon(Icons.category),
                  ),
                  items: HalqaCategory.values.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(cat.arabicName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setDialogState(() => selectedCategory = value!);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty) return;
                
                final success = await context.read<HalqaProvider>().addHalqa(
                  name: nameController.text,
                  category: selectedCategory,
                  teacherName: teacherNameController.text.isEmpty
                      ? null
                      : teacherNameController.text,
                );
                
                if (success && context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم إضافة الحلقة بنجاح')),
                  );
                }
              },
              child: const Text('إضافة'),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditHalqaDialog(Halqa halqa) {
    final nameController = TextEditingController(text: halqa.name);
    final teacherNameController = TextEditingController(text: halqa.teacherName ?? '');
    HalqaCategory selectedCategory = halqa.category;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: const Text('تعديل الحلقة'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'اسم الحلقة',
                    prefixIcon: Icon(Icons.groups),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: teacherNameController,
                  decoration: const InputDecoration(
                    labelText: 'اسم المعلم',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<HalqaCategory>(
                  value: selectedCategory,
                  decoration: const InputDecoration(
                    labelText: 'فئة الحلقة',
                    prefixIcon: Icon(Icons.category),
                  ),
                  items: HalqaCategory.values.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(cat.arabicName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setDialogState(() => selectedCategory = value!);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty) return;
                
                final success = await context.read<HalqaProvider>().updateHalqa(
                  id: halqa.id,
                  name: nameController.text,
                  category: selectedCategory,
                  teacherName: teacherNameController.text.isEmpty
                      ? null
                      : teacherNameController.text,
                );
                
                if (success && context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('تم تعديل الحلقة بنجاح')),
                  );
                }
              },
              child: const Text('حفظ'),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteDialog(Halqa halqa) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف الحلقة'),
        content: Text('هل أنت متأكد من حذف حلقة "${halqa.name}"؟'),
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
                const SnackBar(content: Text('تم حذف الحلقة')),
              );
            },
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
