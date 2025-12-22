import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/announcement_provider.dart';
import '../../providers/auth_provider.dart';
import '../../../data/models/announcement.dart';

class AnnouncementsScreen extends StatefulWidget {
  const AnnouncementsScreen({super.key});

  @override
  State<AnnouncementsScreen> createState() => _AnnouncementsScreenState();
}

class _AnnouncementsScreenState extends State<AnnouncementsScreen> {
  String _selectedFilter = 'all';
  final List<String> _filters = ['الكل', 'منشورة', 'مسودات'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        body: Consumer<AnnouncementProvider>(
          builder: (context, provider, child) {
            final announcements = provider.announcements;
            
            return Column(
              children: [
                _buildHeader(isDark, provider),
                Expanded(
                  child: announcements.isEmpty
                      ? _buildEmptyState(isDark)
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: announcements.length,
                          itemBuilder: (context, index) => _buildAnnouncementCard(announcements[index], isDark, provider),
                        ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showAddAnnouncementDialog(isDark),
          backgroundColor: AppTheme.primaryColor,
          icon: const Icon(Icons.add, color: Colors.white),
          label: const Text('إعلان جديد', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.campaign_outlined, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('لا توجد إعلانات', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isDark, AnnouncementProvider provider) {
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
                  Expanded(child: Text('إدارة الإعلانات', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary))),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppTheme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: Text('${provider.announcements.length} إعلان', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                children: [
                  _buildStatCard(Icons.campaign, '${provider.publishedCount}', 'منشور', AppTheme.primaryColor, isDark),
                  const SizedBox(width: 12),
                  _buildStatCard(Icons.drafts, '${provider.draftsCount}', 'مسودة', Colors.orange, isDark),
                ],
              ),
            ),
            SizedBox(
              height: 40,
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
                      onSelected: (_) {
                        setState(() => _selectedFilter = index == 0 ? 'all' : filter);
                        provider.setStatusFilter(index == 0 ? null : filter);
                      },
                      backgroundColor: isDark ? Colors.grey[800] : Colors.white,
                      selectedColor: AppTheme.primaryColor,
                      labelStyle: TextStyle(color: isSelected ? Colors.white : (isDark ? Colors.grey[200] : AppTheme.textPrimary), fontSize: 13),
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

  Widget _buildStatCard(IconData icon, String value, String label, Color color, bool isDark) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
            Text(label, style: TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
          ],
        ),
      ),
    );
  }

  Widget _buildAnnouncementCard(Announcement announcement, bool isDark, AnnouncementProvider provider) {
    final isDraft = !announcement.isActive;

    return Opacity(
      opacity: isDraft ? 0.7 : 1.0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isDraft ? Colors.orange.withOpacity(0.5) : (isDark ? Colors.grey[800]! : Colors.grey[100]!)),
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
                        decoration: BoxDecoration(color: isDraft ? Colors.orange.withOpacity(0.1) : AppTheme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                        child: Icon(isDraft ? Icons.drafts : Icons.campaign, color: isDraft ? Colors.orange : AppTheme.primaryColor, size: 24),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(announcement.title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                            const SizedBox(height: 4),
                            Row(children: [Icon(Icons.access_time, size: 12, color: AppTheme.textSecondary), const SizedBox(width: 4), Text(_formatDate(announcement.createdAt), style: TextStyle(fontSize: 12, color: AppTheme.textSecondary))]),
                          ],
                        ),
                      ),
                      if (isDraft)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(color: Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                          child: const Text('مسودة', style: TextStyle(fontSize: 11, color: Colors.orange, fontWeight: FontWeight.bold)),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(announcement.content, maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 14, color: isDark ? Colors.grey[300] : AppTheme.textSecondary)),
                  const SizedBox(height: 12),
                  Row(children: [
                    Icon(Icons.group, size: 14, color: AppTheme.textSecondary), const SizedBox(width: 4),
                    Text(provider.getScopeName(announcement.scope), style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                  ]),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(border: Border(top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!))),
              child: Row(
                children: [
                  Expanded(child: _buildActionButton(Icons.edit_outlined, 'تعديل', AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.1), () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تعديل "${announcement.title}"'), behavior: SnackBarBehavior.floating)))),
                  const SizedBox(width: 8),
                  Expanded(child: _buildActionButton(isDraft ? Icons.publish : Icons.visibility_off, isDraft ? 'نشر' : 'إخفاء', isDraft ? Colors.green : Colors.orange, (isDraft ? Colors.green : Colors.orange).withOpacity(0.1), () async {
                    await provider.togglePublish(announcement.id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(announcement.isActive ? 'تم إخفاء الإعلان' : 'تم نشر الإعلان'), backgroundColor: announcement.isActive ? Colors.orange : Colors.green, behavior: SnackBarBehavior.floating));
                  })),
                  const SizedBox(width: 8),
                  Expanded(child: _buildActionButton(Icons.delete_outline, 'حذف', Colors.red, Colors.red.withOpacity(0.1), () => _deleteAnnouncement(announcement, provider))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inHours < 1) return 'منذ ${diff.inMinutes} دقيقة';
    if (diff.inDays < 1) return 'منذ ${diff.inHours} ساعة';
    if (diff.inDays < 7) return 'منذ ${diff.inDays} أيام';
    return '${date.day}/${date.month}/${date.year}';
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

  void _deleteAnnouncement(Announcement announcement, AnnouncementProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف الإعلان'),
        content: Text('هل أنت متأكد من حذف "${announcement.title}"؟'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () async {
              await provider.deleteAnnouncement(announcement.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم حذف "${announcement.title}" بنجاح'), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }

  void _showAddAnnouncementDialog(bool isDark) {
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(color: isDark ? AppTheme.darkSurface : Colors.white, borderRadius: const BorderRadius.vertical(top: Radius.circular(24))),
          child: Column(
            children: [
              Container(margin: const EdgeInsets.symmetric(vertical: 12), width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () => Navigator.pop(context), child: Text('إلغاء', style: TextStyle(color: AppTheme.textSecondary))),
                    Text('إعلان جديد', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                    TextButton(
                      onPressed: () async {
                        if (titleController.text.isNotEmpty) {
                          final authProvider = context.read<AuthProvider>();
                          final currentUser = authProvider.currentUser;
                          
                          if (currentUser == null) {
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('خطأ: المستخدم غير مسجل الدخول')));
                            return;
                          }

                          final success = await context.read<AnnouncementProvider>().addAnnouncement(
                            title: titleController.text,
                            content: contentController.text,
                            centerId: currentUser.centerId ?? '',
                            createdBy: currentUser.id,
                          );
                          
                          if (success) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تم إضافة الإعلان كمسودة'), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
                          } else {
                            final error = context.read<AnnouncementProvider>().error;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error ?? 'حدث خطأ أثناء الإضافة'), backgroundColor: Colors.red, behavior: SnackBarBehavior.floating));
                          }
                        }
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
                      _buildFormField('عنوان الإعلان', titleController, 'أدخل عنوان الإعلان', isDark),
                      const SizedBox(height: 16),
                      _buildFormField('محتوى الإعلان', contentController, 'أدخل محتوى الإعلان...', isDark, maxLines: 5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, String hint, bool isDark, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: isDark ? Colors.grey[200] : AppTheme.textPrimary)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller, maxLines: maxLines,
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
