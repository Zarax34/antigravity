import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth_provider.dart';
import '../../providers/halqa_provider.dart';
import '../../providers/student_provider.dart';
import '../../providers/report_provider.dart';
import '../../providers/center_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final user = authProvider.currentUser;
    
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: _buildFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody() {
    final authProvider = context.watch<AuthProvider>();
    final isSystemAdmin = authProvider.currentUser?.role == UserRole.systemAdmin;
    
    switch (_currentIndex) {
      case 0:
        return _buildDashboard();
      case 1:
        return _buildQuickActions();
      case 2:
        // مسؤول النظام: المراسلة، مسؤول المركز: التقارير
        return isSystemAdmin ? _buildMessagingTab() : _buildReportsTab();
      case 3:
        return _buildMoreTab();
      default:
        return _buildDashboard();
    }
  }
  
  Widget _buildMessagingTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mail_outline_rounded,
                size: 48,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'نظام المراسلات',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'نعمل على تطوير نظام مراسلات متكامل\nقريباً إن شاء الله',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.construction, color: Colors.orange, size: 18),
                  SizedBox(width: 8),
                  Text(
                    'قيد التطوير',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboard() {
    return CustomScrollView(
      slivers: [
        // App Bar
        SliverAppBar(
          expandedHeight: 180,
          floating: false,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('لوحة التحكم'),
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [AppTheme.primaryColor, AppTheme.primaryDark],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -50,
                    top: -50,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () => context.go('/admin/announcements'),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await context.read<AuthProvider>().logout();
                if (mounted) context.go('/login');
              },
            ),
          ],
        ),
        
        // Statistics Cards
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'إحصائيات النظام',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildStatisticsGrid(),
              ],
            ),
          ),
        ),
        
        // Center Progress Statistics (for System Admin)
        if (context.watch<AuthProvider>().currentUser?.role == UserRole.systemAdmin)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'تقدم المراكز',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildCentersProgressList(),
                ],
              ),
            ),
          )
        else
          // Recent Reports (for Center Manager only)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'آخر التقارير',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.go('/admin/reports'),
                        child: const Text('عرض الكل'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  _buildRecentReportsList(),
                ],
              ),
            ),
          ),
        
        // Quick Links
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'اختصارات سريعة',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                _buildQuickLinksGrid(),
              ],
            ),
          ),
        ),
        
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }

  Widget _buildStatisticsGrid() {
    final authProvider = context.watch<AuthProvider>();
    final isSystemAdmin = authProvider.currentUser?.role == UserRole.systemAdmin;
    
    return Consumer3<StudentProvider, HalqaProvider, CenterProvider>(
      builder: (context, studentProvider, halqaProvider, centerProvider, _) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'الطلاب',
                    value: '${studentProvider.allStudents.length}',
                    icon: Icons.people,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    title: 'الحلقات',
                    value: '${halqaProvider.halqat.length}',
                    icon: Icons.groups,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            if (isSystemAdmin) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      title: 'المراكز',
                      value: '${centerProvider.activeCentersCount}',
                      icon: Icons.mosque,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      title: 'المعلمين',
                      value: '0', // TODO: Add teachers count
                      icon: Icons.school,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ],
        );
      },
    );
  }
  
  Widget _buildCentersProgressList() {
    return Consumer<CenterProvider>(
      builder: (context, centerProvider, _) {
        final centers = centerProvider.activeCenters;
        
        if (centers.isEmpty) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.mosque_outlined,
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'لا توجد مراكز مسجلة',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: centers.length > 3 ? 3 : centers.length,
          itemBuilder: (context, index) {
            final center = centers[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: center.logo != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            center.logo!,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Icon(
                              Icons.mosque_rounded,
                              color: AppTheme.primaryColor,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.mosque_rounded,
                          color: AppTheme.primaryColor,
                        ),
                ),
                title: Text(center.name),
                subtitle: Text(center.address ?? 'لا يوجد عنوان'),
                trailing: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: center.isActive ? Colors.green.shade100 : Colors.red.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    center.isActive ? 'نشط' : 'معطل',
                    style: TextStyle(
                      fontSize: 12,
                      color: center.isActive ? Colors.green.shade700 : Colors.red.shade700,
                    ),
                  ),
                ),
                onTap: () => context.go('/admin/centers'),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: color, size: 28),
              Text(
                value,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentReportsList() {
    return Consumer<ReportProvider>(
      builder: (context, reportProvider, _) {
        final reports = reportProvider.getRecentReports(limit: 3);
        
        if (reports.isEmpty) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.description_outlined,
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'لا توجد تقارير حتى الآن',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppTheme.primaryLight.withOpacity(0.2),
                  child: const Icon(
                    Icons.description,
                    color: AppTheme.primaryColor,
                  ),
                ),
                title: Text('تقرير ${report.date.day}/${report.date.month}'),
                subtitle: Text('${report.studentReports.length} طالب'),
                trailing: Chip(
                  label: Text(
                    report.presentCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  backgroundColor: Colors.green,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildQuickLinksGrid() {
    final authProvider = context.watch<AuthProvider>();
    final isSystemAdmin = authProvider.currentUser?.role == UserRole.systemAdmin;
    
    // اختصارات مسؤول النظام - فقط الحلقات والطلاب والمراكز
    final systemAdminLinks = [
      {'icon': Icons.groups, 'title': 'الحلقات', 'route': '/admin/halqat'},
      {'icon': Icons.person_add, 'title': 'الطلاب', 'route': '/admin/students'},
      {'icon': Icons.mosque, 'title': 'المراكز', 'route': '/admin/centers'},
      {'icon': Icons.people, 'title': 'المستخدمون', 'route': '/admin/users'},
    ];
    
    // اختصارات مسؤول المركز - جميع الميزات
    final centerManagerLinks = [
      {'icon': Icons.groups, 'title': 'الحلقات', 'route': '/admin/halqat'},
      {'icon': Icons.person_add, 'title': 'الطلاب', 'route': '/admin/students'},
      {'icon': Icons.school, 'title': 'الدورات', 'route': '/admin/courses-management'},
      {'icon': Icons.event, 'title': 'الأنشطة', 'route': '/admin/activities-list'},
      {'icon': Icons.payment, 'title': 'الرسوم', 'route': '/admin/fees'},
      {'icon': Icons.beach_access, 'title': 'العطل', 'route': '/admin/holidays'},
    ];
    
    final links = isSystemAdmin ? systemAdminLinks : centerManagerLinks;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemCount: links.length,
      itemBuilder: (context, index) {
        final link = links[index];
        return InkWell(
          onTap: () => context.go(link['route'] as String),
          borderRadius: BorderRadius.circular(16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  link['icon'] as IconData,
                  color: AppTheme.primaryColor,
                  size: 32,
                ),
                const SizedBox(height: 8),
                Text(
                  link['title'] as String,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQuickActions() {
    final authProvider = context.watch<AuthProvider>();
    final isSystemAdmin = authProvider.currentUser?.role == UserRole.systemAdmin;
    
    // إجراءات مسؤول النظام
    if (isSystemAdmin) {
      return Scaffold(
        appBar: AppBar(title: const Text('إجراءات سريعة')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _buildActionCard(
              icon: Icons.mosque,
              title: 'إضافة مركز جديد',
              subtitle: 'إضافة مركز تحفيظ جديد للنظام',
              onTap: () => context.go('/admin/add-center'),
            ),
            _buildActionCard(
              icon: Icons.person_add,
              title: 'إضافة مستخدم',
              subtitle: 'إضافة مسؤول مركز أو معلم',
              onTap: () => context.go('/admin/add-user'),
            ),
            _buildActionCard(
              icon: Icons.campaign,
              title: 'إعلان جديد',
              subtitle: 'إرسال إعلان لجميع المراكز',
              onTap: () => context.go('/admin/announcements'),
            ),
          ],
        ),
      );
    }
    
    // إجراءات مسؤول المركز
    return Scaffold(
      appBar: AppBar(title: const Text('إجراءات سريعة')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildActionCard(
            icon: Icons.add_circle,
            title: 'إضافة تقرير جماعي',
            subtitle: 'إضافة تقرير حضور لجميع طلاب الحلقة',
            onTap: () => context.go('/admin/add-report'),
          ),
          _buildActionCard(
            icon: Icons.person_add,
            title: 'إضافة طالب',
            subtitle: 'إضافة طالب جديد للمركز',
            onTap: () => context.go('/admin/add-student'),
          ),
          _buildActionCard(
            icon: Icons.upload_file,
            title: 'استيراد من Excel',
            subtitle: 'إضافة طلاب من ملف Excel',
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('ميزة استيراد Excel قيد التطوير'), behavior: SnackBarBehavior.floating),
            ),
          ),
          _buildActionCard(
            icon: Icons.campaign,
            title: 'إعلان جديد',
            subtitle: 'إرسال إعلان لجميع المستخدمين',
            onTap: () => context.go('/admin/announcements'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.primaryLight.withOpacity(0.2),
          child: Icon(icon, color: AppTheme.primaryColor),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

  Widget _buildReportsTab() {
    return Scaffold(
      appBar: AppBar(title: const Text('التقارير')),
      body: Consumer<ReportProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (provider.reports.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.description_outlined,
                    size: 80,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'لا توجد تقارير',
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
            itemCount: provider.reports.length,
            itemBuilder: (context, index) {
              final report = provider.reports[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('تقرير ${report.date.day}/${report.date.month}/${report.date.year}'),
                  subtitle: Text('${report.studentReports.length} طالب'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Chip(
                        label: Text('${report.presentCount}'),
                        backgroundColor: Colors.green.shade100,
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text('${report.absentCount}'),
                        backgroundColor: Colors.red.shade100,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildMoreTab() {
    final authProvider = context.watch<AuthProvider>();
    final isSystemAdmin = authProvider.currentUser?.role == UserRole.systemAdmin;
    
    return Scaffold(
      appBar: AppBar(title: const Text('المزيد')),
      body: ListView(
        children: [
          // إدارة المراكز - تظهر فقط لمسؤول النظام
          if (isSystemAdmin)
            _buildMenuTile(
              icon: Icons.mosque,
              title: 'إدارة المراكز',
              onTap: () => context.go('/admin/centers'),
            ),
          _buildMenuTile(
            icon: Icons.people,
            title: 'المستخدمون',
            onTap: () => context.go('/admin/users'),
          ),
          _buildMenuTile(
            icon: Icons.family_restroom,
            title: 'أولياء الأمور',
            onTap: () => context.go('/admin/users'),
          ),
          _buildMenuTile(
            icon: Icons.campaign,
            title: 'الإعلانات',
            onTap: () => context.go('/admin/announcements'),
          ),
          _buildMenuTile(
            icon: Icons.settings,
            title: 'الإعدادات',
            onTap: () => context.go('/admin/settings'),
          ),
          const Divider(),
          _buildMenuTile(
            icon: Icons.logout,
            title: 'تسجيل الخروج',
            color: Colors.red,
            onTap: () async {
              await context.read<AuthProvider>().logout();
              if (mounted) context.go('/login');
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildBottomNavBar() {
    final authProvider = context.watch<AuthProvider>();
    final isSystemAdmin = authProvider.currentUser?.role == UserRole.systemAdmin;
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.dashboard, 'الرئيسية'),
              _buildNavItem(1, Icons.add_box, 'إجراءات'),
              const SizedBox(width: 50), // Space for FAB
              // مسؤول النظام: المراسلة بدلاً من التقارير
              if (isSystemAdmin)
                _buildNavItem(2, Icons.mail, 'المراسلة')
              else
                _buildNavItem(2, Icons.description, 'التقارير'),
              _buildNavItem(3, Icons.more_horiz, 'المزيد'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppTheme.primaryColor : Colors.grey,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppTheme.primaryColor : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAB() {
    return FloatingActionButton(
      onPressed: () => context.go('/admin/add-report'),
      backgroundColor: AppTheme.primaryColor,
      child: const Icon(Icons.add),
    );
  }
}
