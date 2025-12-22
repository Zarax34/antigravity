import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  final List<Map<String, dynamic>> _fees = [
    {
      'id': '1',
      'name': 'رسوم الفصل الأول',
      'month': 9,
      'amount': 200.0,
      'paidCount': 45,
      'totalCount': 60,
      'halqat': ['حلقة أبو بكر', 'حلقة عمر'],
    },
    {
      'id': '2',
      'name': 'رسوم الفصل الثاني',
      'month': 2,
      'amount': 200.0,
      'paidCount': 30,
      'totalCount': 60,
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
          title: Text('الرسوم والاشتراكات', style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary, fontWeight: FontWeight.bold)),
          leading: IconButton(icon: Icon(Icons.arrow_forward, color: isDark ? Colors.white : AppTheme.textPrimary), onPressed: () => context.pop()),
        ),
        body: _fees.isEmpty
            ? _buildEmptyState(isDark)
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _fees.length,
                itemBuilder: (context, index) => _buildFeeCard(_fees[index], isDark),
              ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showAddFeeDialog(isDark),
          backgroundColor: AppTheme.primaryColor,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('إضافة رسوم', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.payment_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('لا توجد رسوم', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildFeeCard(Map<String, dynamic> fee, bool isDark) {
    final double progress = fee['paidCount'] / fee['totalCount'];
    
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
                      decoration: BoxDecoration(color: AppTheme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                      child: Icon(Icons.payment, color: AppTheme.primaryColor, size: 24),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(fee['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                          Text('شهر ${fee['month']}', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                        ],
                      ),
                    ),
                    Text('${fee['amount'].toInt()} ر.س', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('التحصيل: ${fee['paidCount']}/${fee['totalCount']}', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                          const SizedBox(height: 4),
                          LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(progress > 0.7 ? Colors.green : (progress > 0.4 ? Colors.orange : Colors.red)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text('${(progress * 100).toInt()}%', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: progress > 0.7 ? Colors.green : (progress > 0.4 ? Colors.orange : Colors.red))),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: (fee['halqat'] as List).map((h) => Chip(
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
                Expanded(child: _buildActionButton(Icons.edit_outlined, 'تعديل', Colors.orange, Colors.orange.withOpacity(0.1), () {})),
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
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(icon, size: 16, color: color), const SizedBox(width: 4), Text(label, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: color))]),
      ),
    );
  }

  void _showAddFeeDialog(bool isDark) {
    final nameController = TextEditingController();
    final amountController = TextEditingController();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(color: isDark ? AppTheme.darkSurface : Colors.white, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            Container(margin: const EdgeInsets.symmetric(vertical: 12), width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: () => Navigator.pop(context), child: Text('إلغاء', style: TextStyle(color: AppTheme.textSecondary))),
                  Text('رسوم جديدة', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم إضافة الرسوم'), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
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
                    _buildFormField('اسم الرسوم', nameController, 'مثال: رسوم الفصل الأول', isDark),
                    const SizedBox(height: 16),
                    _buildFormField('المبلغ', amountController, 'المبلغ بالريال', isDark, keyboardType: TextInputType.number),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, String hint, bool isDark, {TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: isDark ? Colors.grey[200] : AppTheme.textPrimary)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller, keyboardType: keyboardType,
          style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint, hintStyle: TextStyle(color: isDark ? Colors.grey[500] : AppTheme.textHint),
            filled: true, fillColor: isDark ? AppTheme.darkBackground : Colors.grey[50],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: isDark ? Colors.grey[700]! : Colors.grey[200]!)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: isDark ? Colors.grey[700]! : Colors.grey[200]!)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: AppTheme.primaryColor, width: 2)),
          ),
        ),
      ],
    );
  }
}
