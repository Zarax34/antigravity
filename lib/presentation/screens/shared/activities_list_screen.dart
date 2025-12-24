import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class ActivitiesListScreen extends StatefulWidget {
  final bool isParent;
  
  const ActivitiesListScreen({
    super.key,
    this.isParent = true,
  });

  @override
  State<ActivitiesListScreen> createState() => _ActivitiesListScreenState();
}

class _ActivitiesListScreenState extends State<ActivitiesListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  final List<Map<String, dynamic>> _pendingActivities = [
    {
      'id': '1',
      'title': 'رحلة إلى المدينة المنورة',
      'description': 'رحلة تعليمية للأماكن المقدسة',
      'date': '25 ديسمبر 2024',
      'time': '06:00 صباحاً',
      'location': 'نقطة انطلاق: المركز',
      'price': '150 ريال',
      'status': 'pending',
      'student': 'أحمد محمد',
    },
    {
      'id': '2',
      'title': 'مسابقة الحفظ السنوية',
      'description': 'مسابقة في حفظ القرآن الكريم',
      'date': '30 ديسمبر 2024',
      'time': '09:00 صباحاً',
      'location': 'قاعة المحاضرات - المركز',
      'price': 'مجاناً',
      'status': 'pending',
      'student': 'أحمد محمد',
    },
  ];
  
  final List<Map<String, dynamic>> _upcomingActivities = [
    {
      'id': '3',
      'title': 'حفل تكريم الطلاب',
      'description': 'حفل تكريم لطلاب الختمة',
      'date': '15 يناير 2025',
      'time': '05:00 مساءً',
      'location': 'قاعة المناسبات الكبرى',
      'status': 'approved',
      'student': 'أحمد محمد',
    },
  ];
  
  final List<Map<String, dynamic>> _pastActivities = [
    {
      'id': '4',
      'title': 'دورة التجويد المكثفة',
      'description': 'دورة في أحكام التجويد',
      'date': '01 ديسمبر 2024',
      'time': '04:00 مساءً',
      'location': 'المركز',
      'status': 'completed',
      'student': 'أحمد محمد',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildActivityList(_pendingActivities, isDark, showActions: widget.isParent),
                  _buildActivityList(_upcomingActivities, isDark),
                  _buildActivityList(_pastActivities, isDark),
                ],
              ),
            ),
          ],
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
            // Title
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: Icon(
                      Icons.arrow_forward,
                      color: isDark ? Colors.white : AppTheme.textPrimary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'الأنشطة والفعاليات',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : AppTheme.textPrimary,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: isDark ? Colors.white : AppTheme.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
            
            // Tab bar
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkBackground : Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: isDark ? Colors.grey[400] : AppTheme.textSecondary,
                labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                tabs: [
                  _buildTabWithBadge('انتظار الموافقة', _pendingActivities.length),
                  const Tab(text: 'القادمة'),
                  const Tab(text: 'السابقة'),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTabWithBadge(String text, int count) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          if (count > 0) ...[
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActivityList(List<Map<String, dynamic>> activities, bool isDark, {bool showActions = false}) {
    if (activities.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'لا توجد أنشطة',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
          ],
        ),
      );
    }
    
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: activities.length,
      itemBuilder: (context, index) => _buildActivityCard(activities[index], isDark, showActions: showActions),
    );
  }

  Widget _buildActivityCard(Map<String, dynamic> activity, bool isDark, {bool showActions = false}) {
    final status = activity['status'] as String;
    
    Color statusColor;
    IconData statusIcon;
    switch (status) {
      case 'pending':
        statusColor = Colors.orange;
        statusIcon = Icons.schedule;
        break;
      case 'approved':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'completed':
        statusColor = Colors.blue;
        statusIcon = Icons.done_all;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help_outline;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  statusColor.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(Icons.event, color: statusColor, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        activity['title'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        activity['description'],
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(statusIcon, color: statusColor, size: 20),
                ),
              ],
            ),
          ),
          
          // Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildDetailRow(Icons.calendar_today, activity['date'], isDark),
                _buildDetailRow(Icons.access_time, activity['time'], isDark),
                _buildDetailRow(Icons.location_on_outlined, activity['location'], isDark),
                if (activity['price'] != null)
                  _buildDetailRow(Icons.local_offer_outlined, activity['price'], isDark),
                _buildDetailRow(Icons.person_outline, 'للطالب: ${activity['student']}', isDark),
              ],
            ),
          ),
          
          // Action buttons (for parent)
          if (showActions && status == 'pending') ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => _handleActivityResponse(activity, true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      icon: const Icon(Icons.check, size: 20),
                      label: const Text(
                        'موافقة',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _handleActivityResponse(activity, false),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      icon: const Icon(Icons.close, size: 20),
                      label: const Text(
                        'رفض',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ] else ...[
            const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 16, color: AppTheme.textSecondary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.grey[300] : AppTheme.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleActivityResponse(Map<String, dynamic> activity, bool approved) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(approved ? 'تأكيد الموافقة' : 'تأكيد الرفض'),
        content: Text(
          approved
              ? 'هل تؤكد موافقتك على مشاركة ${activity['student']} في "${activity['title']}"؟'
              : 'هل تؤكد رفض مشاركة ${activity['student']} في "${activity['title']}"؟',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(approved ? 'تمت الموافقة بنجاح' : 'تم الرفض'),
                  backgroundColor: approved ? Colors.green : Colors.red,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: approved ? Colors.green : Colors.red,
            ),
            child: Text(approved ? 'موافقة' : 'رفض'),
          ),
        ],
      ),
    );
  }
}
