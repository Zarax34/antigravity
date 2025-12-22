import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  String _selectedFilter = 'all';
  
  final List<Map<String, dynamic>> _courses = [
    {
      'id': '1',
      'name': 'دورة التجويد المكثفة',
      'teacher': 'الشيخ أحمد محمد',
      'startDate': DateTime(2024, 3, 1),
      'endDate': DateTime(2024, 6, 30),
      'studentsCount': 25,
      'status': 'active',
      'halqat': ['حلقة أبو بكر', 'حلقة عمر'],
    },
    {
      'id': '2',
      'name': 'دورة حفظ جزء عم',
      'teacher': 'الشيخ خالد السعود',
      'startDate': DateTime(2024, 1, 15),
      'endDate': DateTime(2024, 2, 28),
      'studentsCount': 30,
      'status': 'ended',
      'halqat': ['جميع الحلقات'],
    },
    {
      'id': '3',
      'name': 'دورة المراجعة الصيفية',
      'teacher': 'الشيخ عمر الفاتح',
      'startDate': DateTime(2024, 7, 1),
      'endDate': DateTime(2024, 8, 31),
      'studentsCount': 0,
      'status': 'scheduled',
      'halqat': ['حلقة أبو بكر'],
    },
  ];

  List<Map<String, dynamic>> get filteredCourses {
    if (_selectedFilter == 'all') return _courses;
    return _courses.where((c) => c['status'] == _selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        body: Column(
          children: [
            _buildHeader(isDark),
            Expanded(
              child: filteredCourses.isEmpty
                  ? _buildEmptyState(isDark)
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: filteredCourses.length,
                      itemBuilder: (context, index) => _buildCourseCard(filteredCourses[index], isDark),
                    ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showAddCourseDialog(isDark),
          backgroundColor: AppTheme.primaryColor,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('دورة جديدة', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Container(
      color: isDark ? AppTheme.darkSurface : Colors.white,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_forward, color: isDark ? Colors.white : AppTheme.textPrimary)),
                  Expanded(child: Text('الدورات التدريبية', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary))),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppTheme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: Text('${_courses.length} دورة', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildFilterChip('الكل', 'all', isDark),
                  _buildFilterChip('نشطة', 'active', isDark),
                  _buildFilterChip('مجدولة', 'scheduled', isDark),
                  _buildFilterChip('منتهية', 'ended', isDark),
                ],
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, String value, bool isDark) {
    final isSelected = _selectedFilter == value;
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => setState(() => _selectedFilter = value),
        backgroundColor: isDark ? Colors.grey[800] : Colors.white,
        selectedColor: AppTheme.primaryColor,
        labelStyle: TextStyle(color: isSelected ? Colors.white : (isDark ? Colors.grey[200] : AppTheme.textPrimary), fontSize: 13),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: isSelected ? AppTheme.primaryColor : (isDark ? Colors.grey[700]! : Colors.grey[200]!))),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.school_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('لا توجد دورات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildCourseCard(Map<String, dynamic> course, bool isDark) {
    Color statusColor;
    String statusText;
    switch (course['status']) {
      case 'active':
        statusColor = Colors.green;
        statusText = 'نشطة';
        break;
      case 'scheduled':
        statusColor = Colors.blue;
        statusText = 'مجدولة';
        break;
      default:
        statusColor = Colors.grey;
        statusText = 'منتهية';
    }
    
    final startDate = course['startDate'] as DateTime;
    final endDate = course['endDate'] as DateTime;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48, height: 48,
                      decoration: BoxDecoration(gradient: LinearGradient(colors: [statusColor.withOpacity(0.2), statusColor.withOpacity(0.1)]), borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.school, color: statusColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(course['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                          const SizedBox(height: 4),
                          Text(course['teacher'], style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Container(width: 6, height: 6, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                        const SizedBox(width: 4),
                        Text(statusText, style: TextStyle(fontSize: 12, color: statusColor, fontWeight: FontWeight.w500)),
                      ]),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(children: [
                  Icon(Icons.date_range, size: 14, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text('${startDate.day}/${startDate.month}/${startDate.year} - ${endDate.day}/${endDate.month}/${endDate.year}', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                  const SizedBox(width: 16),
                  Icon(Icons.groups, size: 14, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text('${course['studentsCount']} طالب', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                ]),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: (course['halqat'] as List).map((h) => Chip(
                    label: Text(h, style: const TextStyle(fontSize: 10)),
                    backgroundColor: isDark ? Colors.grey[800] : Colors.grey[100],
                    visualDensity: VisualDensity.compact,
                  )).toList(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!))),
            child: Row(
              children: [
                Expanded(child: _buildActionButton(Icons.edit_outlined, 'تعديل', AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.1), () {})),
                const SizedBox(width: 8),
                Expanded(child: _buildActionButton(Icons.groups_outlined, 'الطلاب', Colors.green, Colors.green.withOpacity(0.1), () {})),
                const SizedBox(width: 8),
                Expanded(child: _buildActionButton(Icons.card_giftcard_outlined, 'الشهادات', Colors.orange, Colors.orange.withOpacity(0.1), () {})),
                const SizedBox(width: 8),
                Expanded(child: _buildActionButton(Icons.delete_outline, 'حذف', Colors.red, Colors.red.withOpacity(0.1), () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color, Color bgColor, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 14, color: color), const SizedBox(width: 2), Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: color))]),
      ),
    );
  }

  void _showAddCourseDialog(bool isDark) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(color: isDark ? AppTheme.darkSurface : Colors.white, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
        child: Column(
          children: [
            Container(margin: const EdgeInsets.symmetric(vertical: 12), width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text('إلغاء', style: TextStyle(color: AppTheme.textSecondary))),
                  Text('دورة جديدة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم إضافة الدورة وإرسال إشعارات'), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
                    },
                    child: Text('حفظ', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField('اسم الدورة', 'مثال: دورة التجويد المكثفة', isDark),
                    const SizedBox(height: 16),
                    _buildTextField('المعلم المسؤول', 'اختر المعلم', isDark),
                    const SizedBox(height: 16),
                    _buildTextField('التفاصيل', 'وصف الدورة وأهدافها...', isDark, maxLines: 3),
                    const SizedBox(height: 16),
                    _buildTextField('ملاحظات', 'أي ملاحظات إضافية...', isDark, maxLines: 2),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, bool isDark, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: isDark ? Colors.grey[200] : AppTheme.textPrimary)),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            filled: true, fillColor: isDark ? AppTheme.darkBackground : Colors.grey[50],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ],
    );
  }
}
