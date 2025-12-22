import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/course_provider.dart';
import '../../../data/models/course.dart';

class CoursesManagementScreen extends StatefulWidget {
  const CoursesManagementScreen({super.key});

  @override
  State<CoursesManagementScreen> createState() => _CoursesManagementScreenState();
}

class _CoursesManagementScreenState extends State<CoursesManagementScreen> {
  String _selectedFilter = 'all';
  final List<String> _filters = ['الكل', 'نشطة', 'منتهية', 'مجدولة'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        body: Consumer<CourseProvider>(
          builder: (context, provider, child) {
            final courses = provider.courses;
            
            return Column(
              children: [
                _buildHeader(isDark, provider),
                Expanded(
                  child: courses.isEmpty
                      ? _buildEmptyState(isDark)
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildStatsRow(isDark, provider),
                              const SizedBox(height: 20),
                              _buildSectionHeader(isDark, courses.length),
                              const SizedBox(height: 12),
                              ...courses.map((course) => _buildCourseCard(course, isDark, provider)),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('سيتم فتح نموذج إضافة دورة جديدة'), behavior: SnackBarBehavior.floating)),
          backgroundColor: AppTheme.primaryColor,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('دورة جديدة', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
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
          const SizedBox(height: 8),
          Text('جرب تغيير التصفية', style: TextStyle(color: Colors.grey[500])),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isDark, CourseProvider provider) {
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
                  Expanded(child: Text('إدارة الدورات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary))),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppTheme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: Text('${provider.courses.length} دورة', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  final filter = _filters[index];
                  final isSelected = (index == 0 && _selectedFilter == 'all') || _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: FilterChip(
                      label: Text(filter),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() => _selectedFilter = index == 0 ? 'all' : filter);
                        provider.setStatusFilter(index == 0 ? null : filter);
                      },
                      backgroundColor: isDark ? Colors.grey[800] : Colors.white,
                      selectedColor: AppTheme.primaryColor,
                      labelStyle: TextStyle(color: isSelected ? Colors.white : (isDark ? Colors.grey[200] : AppTheme.textPrimary), fontSize: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: isSelected ? AppTheme.primaryColor : (isDark ? Colors.grey[700]! : Colors.grey[200]!))),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsRow(bool isDark, CourseProvider provider) {
    return Row(
      children: [
        _buildStatCard(Icons.school, AppTheme.primaryColor, Colors.blue.withOpacity(0.1), '${provider.activeCourses}', 'الدورات النشطة', isDark),
        const SizedBox(width: 12),
        _buildStatCard(Icons.groups, Colors.green, Colors.green.withOpacity(0.1), '${provider.totalStudents}', 'إجمالي المسجلين', isDark),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, Color iconColor, Color iconBgColor, String value, String label, bool isDark) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: isDark ? AppTheme.darkSurface : Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!)),
        child: Row(
          children: [
            Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle), child: Icon(icon, color: iconColor, size: 24)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                  Text(label, style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(bool isDark, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('الدورات الحالية ($count)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
        TextButton(
          onPressed: () {
            setState(() => _selectedFilter = 'all');
            context.read<CourseProvider>().setStatusFilter(null);
          },
          child: Text('إعادة ضبط', style: TextStyle(color: AppTheme.primaryColor, fontSize: 14)),
        ),
      ],
    );
  }

  Widget _buildCourseCard(Course course, bool isDark, CourseProvider provider) {
    Color statusColor;
    String statusText;
    
    if (course.isOngoing) {
      statusColor = Colors.green;
      statusText = 'نشطة';
    } else if (course.hasEnded) {
      statusColor = Colors.grey;
      statusText = 'منتهية';
    } else {
      statusColor = Colors.blue;
      statusText = 'مجدولة';
    }
    
    final studentsCount = course.targetStudentIds.length;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(color: isDark ? AppTheme.darkSurface : Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!)),
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
                          Text(course.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                          const SizedBox(height: 4),
                          Text(course.description ?? '', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(width: 6, height: 6, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                          const SizedBox(width: 4),
                          Text(statusText, style: TextStyle(fontSize: 12, color: statusColor, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(children: [
                  Icon(Icons.person, size: 14, color: AppTheme.textSecondary), const SizedBox(width: 4),
                  Text(provider.getTeacherName(course.responsibleTeacherId), style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                  const SizedBox(width: 24),
                  Icon(Icons.groups, size: 14, color: AppTheme.textSecondary), const SizedBox(width: 4),
                  Text('$studentsCount طالب', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                ]),
                const SizedBox(height: 8),
                Row(children: [
                  Icon(Icons.date_range, size: 14, color: AppTheme.textSecondary), const SizedBox(width: 4),
                  Text(_formatDateRange(course.startDate, course.endDate), style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                ]),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!))),
            child: Row(
              children: [
                Expanded(child: _buildActionButton(Icons.edit_outlined, 'تعديل', AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.1), () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تعديل "${course.name}"'), behavior: SnackBarBehavior.floating)))),
                const SizedBox(width: 8),
                Expanded(child: _buildActionButton(Icons.groups_outlined, 'الطلاب', Colors.green, Colors.green.withOpacity(0.1), () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('عرض طلاب "${course.name}"'), behavior: SnackBarBehavior.floating)))),
                const SizedBox(width: 8),
                Expanded(child: _buildActionButton(Icons.delete_outline, 'حذف', Colors.red, Colors.red.withOpacity(0.1), () => _deleteCourse(course, provider))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDateRange(DateTime start, DateTime end) {
    return '${start.day}/${start.month}/${start.year} - ${end.day}/${end.month}/${end.year}';
  }

  Widget _buildActionButton(IconData icon, String label, Color color, Color bgColor, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8)),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 16, color: color), const SizedBox(width: 4), Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: color))]),
      ),
    );
  }

  void _deleteCourse(Course course, CourseProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف الدورة'),
        content: Text('هل أنت متأكد من حذف "${course.name}"؟'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () async {
              await provider.deleteCourse(course.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم حذف "${course.name}" بنجاح'), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
