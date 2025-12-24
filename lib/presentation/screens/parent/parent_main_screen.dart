import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../../core/theme/app_theme.dart';

class ParentMainScreen extends StatefulWidget {
  const ParentMainScreen({super.key});

  @override
  State<ParentMainScreen> createState() => _ParentMainScreenState();
}

class _ParentMainScreenState extends State<ParentMainScreen> {
  int _currentIndex = 0;

  // Demo children data
  final List<Map<String, dynamic>> _children = [
    {
      'id': '1',
      'name': 'أحمد محمد',
      'halqa': 'حلقة أبو بكر الصديق',
      'memorized': '5 أجزاء',
      'attendance': 90,
      'lastReport': {'date': DateTime.now(), 'status': 'حاضر', 'grade': 'ممتاز'},
    },
    {
      'id': '2',
      'name': 'يوسف محمد',
      'halqa': 'حلقة عمر بن الخطاب',
      'memorized': '3 أجزاء',
      'attendance': 85,
      'lastReport': {'date': DateTime.now().subtract(Duration(days: 1)), 'status': 'حاضر', 'grade': 'جيد جداً'},
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        body: _buildBody(isDark),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurface : Colors.white,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -5))],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, Icons.home, 'الرئيسية', isDark),
                  _buildNavItem(1, Icons.description, 'التقارير', isDark),
                  _buildNavItem(2, Icons.event, 'الأنشطة', isDark),
                  _buildNavItem(3, Icons.more_horiz, 'المزيد', isDark),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, bool isDark) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isSelected ? AppTheme.primaryColor : Colors.grey),
            Text(label, style: TextStyle(fontSize: 12, color: isSelected ? AppTheme.primaryColor : Colors.grey, fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(bool isDark) {
    switch (_currentIndex) {
      case 0:
        return _buildHome(isDark);
      case 1:
        return _buildReports(isDark);
      case 2:
        return _buildActivities(isDark);
      case 3:
        return _buildMore(isDark);
      default:
        return _buildHome(isDark);
    }
  }

  Widget _buildHome(bool isDark) {
    final user = context.read<AuthProvider>().currentUser;
    
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 160,
          floating: false,
          pinned: true,
          backgroundColor: AppTheme.primaryColor,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('مرحباً ${user?.fullName ?? ""}', style: const TextStyle(fontSize: 18)),
            background: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: [AppTheme.primaryColor, AppTheme.primaryDark])),
              child: Stack(
                children: [
                  Positioned(right: -30, top: -30, child: Container(width: 150, height: 150, decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), shape: BoxShape.circle))),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('لا توجد إشعارات جديدة'), behavior: SnackBarBehavior.floating))),
          ],
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('أبنائي', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                const SizedBox(height: 16),
                ..._children.map((child) => _buildChildCard(child, isDark)).toList(),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('آخر التقارير', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                    TextButton(onPressed: () => setState(() => _currentIndex = 1), child: const Text('عرض الكل')),
                  ],
                ),
                const SizedBox(height: 12),
                ..._children.map((child) => _buildReportCard(child, isDark)).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChildCard(Map<String, dynamic> child, bool isDark) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 56, height: 56,
              decoration: BoxDecoration(color: AppTheme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Center(child: Text(child['name'].toString().substring(0, 1), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primaryColor))),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(child['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                  const SizedBox(height: 4),
                  Text(child['halqa'], style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.menu_book, size: 12, color: AppTheme.textSecondary),
                      const SizedBox(width: 4),
                      Text(child['memorized'], style: TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
                      const SizedBox(width: 16),
                      Icon(Icons.check_circle, size: 12, color: Colors.green),
                      const SizedBox(width: 4),
                      Text('${child['attendance']}% حضور', style: TextStyle(fontSize: 11, color: Colors.green)),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  Widget _buildReportCard(Map<String, dynamic> child, bool isDark) {
    final report = child['lastReport'] as Map<String, dynamic>;
    final date = report['date'] as DateTime;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 40, height: 40,
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
              child: const Icon(Icons.check, color: Colors.green, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(child['name'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                  Text('${date.day}/${date.month}/${date.year}', style: TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: Text(report['grade'], style: const TextStyle(fontSize: 11, color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReports(bool isDark) {
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
        title: Text('تقارير الأبناء', style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _children.length * 5, // Demo multiple reports
        itemBuilder: (context, index) {
          final child = _children[index % _children.length];
          return _buildReportCard(child, isDark);
        },
      ),
    );
  }

  Widget _buildActivities(bool isDark) {
    final List<Map<String, dynamic>> activities = [
      {'name': 'رحلة ترفيهية', 'date': DateTime(2024, 4, 20), 'status': 'pending'},
      {'name': 'مسابقة حفظ', 'date': DateTime(2024, 5, 1), 'status': 'approved'},
    ];
    
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
        title: Text('الأنشطة المتاحة', style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
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
                        decoration: BoxDecoration(color: Colors.purple.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                        child: const Icon(Icons.event, color: Colors.purple, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(activity['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                            Text('${(activity['date'] as DateTime).day}/${(activity['date'] as DateTime).month}', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (activity['status'] == 'pending')
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم الموافقة على المشاركة'), backgroundColor: Colors.green)),
                            icon: const Icon(Icons.check, size: 18),
                            label: const Text('موافق'),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم رفض المشاركة'), backgroundColor: Colors.red)),
                            icon: const Icon(Icons.close, size: 18),
                            label: const Text('رفض'),
                            style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                          ),
                        ),
                      ],
                    )
                  else
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.check_circle, color: Colors.green, size: 18), SizedBox(width: 8), Text('تمت الموافقة', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))]),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMore(bool isDark) {
    return Scaffold(
      backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
        title: Text('المزيد', style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary, fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          _buildMenuItem(Icons.school, 'الدورات', () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('الدورات قيد الإعداد'), behavior: SnackBarBehavior.floating)), isDark),
          _buildMenuItem(Icons.card_giftcard, 'الشهادات', () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('شهادات أبنائك ستظهر هنا قريباً'), behavior: SnackBarBehavior.floating)), isDark),
          _buildMenuItem(Icons.payment, 'الرسوم', () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('الرسوم قيد الإعداد'), behavior: SnackBarBehavior.floating)), isDark),
          _buildMenuItem(Icons.beach_access, 'العطل', () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('العطل والإجازات'), behavior: SnackBarBehavior.floating)), isDark),
          _buildMenuItem(Icons.campaign, 'الإعلانات', () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('الإعلانات قيد الإعداد'), behavior: SnackBarBehavior.floating)), isDark),
          Divider(color: isDark ? Colors.grey[800] : Colors.grey[200]),
          _buildMenuItem(Icons.person, 'بيانات الحساب', () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('بيانات الحساب قيد الإعداد'), behavior: SnackBarBehavior.floating)), isDark),
          ListTile(
            leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.logout, color: Colors.red, size: 20)),
            title: const Text('تسجيل الخروج', style: TextStyle(color: Colors.red)),
            onTap: () async {
              await context.read<AuthProvider>().logout();
              if (mounted) context.go('/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, bool isDark) {
    return ListTile(
      leading: Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppTheme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: AppTheme.primaryColor, size: 20)),
      title: Text(title, style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
      onTap: onTap,
    );
  }
}
