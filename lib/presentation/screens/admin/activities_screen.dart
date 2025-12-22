import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class ActivitiesScreen extends StatefulWidget {
  const ActivitiesScreen({super.key});

  @override
  State<ActivitiesScreen> createState() => _ActivitiesScreenState();
}

class _ActivitiesScreenState extends State<ActivitiesScreen> {
  final List<Map<String, dynamic>> _activities = [
    {
      'id': '1',
      'name': 'رحلة ترفيهية',
      'location': 'حديقة الملك فهد',
      'date': DateTime(2024, 4, 20),
      'time': '9:00 صباحاً',
      'approvedCount': 35,
      'pendingCount': 10,
      'rejectedCount': 5,
      'halqat': ['حلقة أبو بكر', 'حلقة عمر'],
    },
    {
      'id': '2',
      'name': 'مسابقة حفظ القرآن',
      'location': 'قاعة المركز',
      'date': DateTime(2024, 5, 1),
      'time': '4:00 مساءً',
      'approvedCount': 20,
      'pendingCount': 25,
      'rejectedCount': 0,
      'halqat': ['جميع الحلقات'],
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
          title: Text('إدارة الأنشطة', style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary, fontWeight: FontWeight.bold)),
          leading: IconButton(icon: Icon(Icons.arrow_forward, color: isDark ? Colors.white : AppTheme.textPrimary), onPressed: () => context.pop()),
        ),
        body: _activities.isEmpty
            ? _buildEmptyState(isDark)
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _activities.length,
                itemBuilder: (context, index) => _buildActivityCard(_activities[index], isDark),
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showAddActivityDialog(isDark),
          backgroundColor: AppTheme.primaryColor,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('إضافة نشاط', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.event_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('لا توجد أنشطة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildActivityCard(Map<String, dynamic> activity, bool isDark) {
    final date = activity['date'] as DateTime;
    final totalResponses = activity['approvedCount'] + activity['pendingCount'] + activity['rejectedCount'];
    
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
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.purple.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: const Icon(Icons.event, color: Colors.purple, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(activity['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                          const SizedBox(height: 4),
                          Row(children: [
                            Icon(Icons.location_on, size: 14, color: AppTheme.textSecondary),
                            const SizedBox(width: 4),
                            Text(activity['location'], style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(children: [
                  Icon(Icons.calendar_today, size: 14, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text('${date.day}/${date.month}/${date.year}', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                  const SizedBox(width: 16),
                  Icon(Icons.access_time, size: 14, color: AppTheme.textSecondary),
                  const SizedBox(width: 4),
                  Text(activity['time'], style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                ]),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _buildStatusChip('موافق', activity['approvedCount'], Colors.green),
                    const SizedBox(width: 8),
                    _buildStatusChip('معلق', activity['pendingCount'], Colors.orange),
                    const SizedBox(width: 8),
                    _buildStatusChip('رافض', activity['rejectedCount'], Colors.red),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: (activity['halqat'] as List).map((h) => Chip(
                    label: Text(h, style: const TextStyle(fontSize: 11)),
                    backgroundColor: isDark ? Colors.grey[800] : Colors.grey[100],
                  )).toList(),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!))),
            child: Row(
              children: [
                Expanded(child: _buildActionButton(Icons.visibility_outlined, 'التفاصيل', AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.1), () {})),
                const SizedBox(width: 8),
                Expanded(child: _buildActionButton(Icons.how_to_reg_outlined, 'الحضور', Colors.green, Colors.green.withOpacity(0.1), () {})),
                const SizedBox(width: 8),
                Expanded(child: _buildActionButton(Icons.delete_outline, 'حذف', Colors.red, Colors.red.withOpacity(0.1), () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label, int count, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Container(width: 6, height: 6, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text('$label: $count', style: TextStyle(fontSize: 11, color: color, fontWeight: FontWeight.w500)),
      ]),
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

  void _showAddActivityDialog(bool isDark) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
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
                  Text('نشاط جديد', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم إضافة النشاط وإرسال إشعارات'), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
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
                    _buildTextField('اسم النشاط', 'مثال: رحلة ترفيهية', isDark),
                    const SizedBox(height: 16),
                    _buildTextField('المكان', 'مثال: حديقة الملك فهد', isDark),
                    const SizedBox(height: 16),
                    _buildTextField('التفاصيل', 'وصف النشاط...', isDark, maxLines: 3),
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
