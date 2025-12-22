import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class HolidaysScreen extends StatefulWidget {
  const HolidaysScreen({super.key});

  @override
  State<HolidaysScreen> createState() => _HolidaysScreenState();
}

class _HolidaysScreenState extends State<HolidaysScreen> {
  final List<Map<String, dynamic>> _holidays = [
    {
      'id': '1',
      'name': 'إجازة عيد الفطر',
      'startDate': DateTime(2024, 4, 9),
      'endDate': DateTime(2024, 4, 15),
      'isRecurring': true,
      'halqat': ['جميع الحلقات'],
    },
    {
      'id': '2',
      'name': 'إجازة عيد الأضحى',
      'startDate': DateTime(2024, 6, 16),
      'endDate': DateTime(2024, 6, 22),
      'isRecurring': true,
      'halqat': ['جميع الحلقات'],
    },
    {
      'id': '3',
      'name': 'إجازة نصف السنة',
      'startDate': DateTime(2024, 1, 28),
      'endDate': DateTime(2024, 2, 8),
      'isRecurring': false,
      'halqat': ['حلقة أبو بكر', 'حلقة عمر'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
          title: Text('العطل والإجازات', style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary, fontWeight: FontWeight.bold)),
          leading: IconButton(icon: Icon(Icons.arrow_forward, color: isDark ? Colors.white : AppTheme.textPrimary), onPressed: () => context.pop()),
        ),
        body: _holidays.isEmpty
            ? _buildEmptyState(isDark)
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _holidays.length,
                itemBuilder: (context, index) => _buildHolidayCard(_holidays[index], isDark),
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showAddHolidayDialog(isDark),
          backgroundColor: AppTheme.primaryColor,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('إضافة عطلة', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.beach_access_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('لا توجد عطل', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildHolidayCard(Map<String, dynamic> holiday, bool isDark) {
    final startDate = holiday['startDate'] as DateTime;
    final endDate = holiday['endDate'] as DateTime?;
    final isRecurring = holiday['isRecurring'] as bool;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                  child: const Icon(Icons.beach_access, color: Colors.orange, size: 24),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(child: Text(holiday['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary))),
                          if (isRecurring) Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                            child: const Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.repeat, size: 12, color: Colors.blue), SizedBox(width: 4), Text('سنوية', style: TextStyle(fontSize: 10, color: Colors.blue, fontWeight: FontWeight.bold))]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(children: [
                        Icon(Icons.date_range, size: 14, color: AppTheme.textSecondary),
                        const SizedBox(width: 4),
                        Text('${startDate.day}/${startDate.month}/${startDate.year}', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                        if (endDate != null) ...[
                          Text(' - ${endDate.day}/${endDate.month}/${endDate.year}', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                        ],
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: (holiday['halqat'] as List).map((h) => Chip(
                label: Text(h, style: const TextStyle(fontSize: 11)),
                backgroundColor: isDark ? Colors.grey[800] : Colors.grey[100],
              )).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildActionButton(Icons.edit_outlined, 'تعديل', AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.1), () {})),
                const SizedBox(width: 8),
                Expanded(child: _buildActionButton(Icons.delete_outline, 'حذف', Colors.red, Colors.red.withOpacity(0.1), () {})),
              ],
            ),
          ],
        ),
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
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 16, color: color), const SizedBox(width: 4), Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: color))]),
      ),
    );
  }

  void _showAddHolidayDialog(bool isDark) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
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
                  Text('عطلة جديدة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم إضافة العطلة'), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
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
                    Text('اسم العطلة', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: isDark ? Colors.grey[200] : AppTheme.textPrimary)),
                    const SizedBox(height: 8),
                    TextField(
                      style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
                      decoration: InputDecoration(
                        hintText: 'مثال: إجازة عيد الفطر',
                        filled: true, fillColor: isDark ? AppTheme.darkBackground : Colors.grey[50],
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SwitchListTile(
                      title: Text('عطلة سنوية متكررة', style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary)),
                      value: false,
                      onChanged: (v) {},
                      activeColor: AppTheme.primaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
