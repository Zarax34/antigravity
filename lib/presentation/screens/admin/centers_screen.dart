import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/center_provider.dart';
import '../../../data/models/center.dart' as models;

class CentersScreen extends StatefulWidget {
  const CentersScreen({super.key});

  @override
  State<CentersScreen> createState() => _CentersScreenState();
}

class _CentersScreenState extends State<CentersScreen> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<CenterProvider>().setSearchQuery(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        body: Consumer<CenterProvider>(
          builder: (context, provider, child) {
            final centers = provider.centers;
            
            return Column(
              children: [
                _buildHeader(isDark, provider),
                Expanded(
                  child: centers.isEmpty
                      ? _buildEmptyState(isDark)
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildStatsRow(isDark, provider),
                              const SizedBox(height: 20),
                              _buildSectionHeader(isDark, centers.length),
                              const SizedBox(height: 12),
                              ...centers.map((center) => _buildCenterCard(center, isDark, provider)),
                              const SizedBox(height: 80),
                            ],
                          ),
                        ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push('/admin/add-center'),
          backgroundColor: AppTheme.primaryColor,
          elevation: 8,
          child: const Icon(Icons.add, size: 28, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildEmptyState(bool isDark) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('لا توجد نتائج', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
          const SizedBox(height: 8),
          Text('جرب البحث بكلمات مختلفة', style: TextStyle(color: Colors.grey[500])),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isDark, CenterProvider provider) {
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
                  Expanded(child: Text('إدارة مراكز التحفيظ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary))),
                  _buildNotificationButton(isDark),
                  const SizedBox(width: 12),
                  _buildProfileButton(isDark),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: _buildSearchBar(isDark),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationButton(bool isDark) {
    return Stack(
      children: [
        Container(
          width: 40, height: 40,
          decoration: BoxDecoration(color: isDark ? Colors.grey[800] : Colors.grey[100], shape: BoxShape.circle),
          child: Icon(Icons.notifications_outlined, color: isDark ? Colors.white : AppTheme.textPrimary),
        ),
        Positioned(top: 8, right: 8, child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle))),
      ],
    );
  }

  Widget _buildProfileButton(bool isDark) {
    return Container(
      width: 40, height: 40,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1), shape: BoxShape.circle,
        border: Border.all(color: isDark ? Colors.grey[700]! : Colors.grey[200]!),
      ),
      child: Center(child: Text('م', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.bold))),
    );
  }

  Widget _buildSearchBar(bool isDark) {
    return Container(
      height: 48,
      decoration: BoxDecoration(color: isDark ? Colors.grey[800] : Colors.grey[50], borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: _searchController,
        style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
        decoration: InputDecoration(
          hintText: 'بحث عن مركز...', hintStyle: TextStyle(color: AppTheme.textSecondary),
          prefixIcon: Icon(Icons.search, color: AppTheme.textSecondary),
          suffixIcon: _searchController.text.isNotEmpty ? IconButton(icon: Icon(Icons.clear, color: AppTheme.textSecondary), onPressed: () => _searchController.clear()) : null,
          border: InputBorder.none, contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildStatsRow(bool isDark, CenterProvider provider) {
    return Row(
      children: [
        _buildStatCard(Icons.mosque_rounded, AppTheme.primaryColor, Colors.blue.withOpacity(0.1), '${provider.activeCentersCount}', 'مراكز نشطة', isDark),
        const SizedBox(width: 12),
        _buildStatCard(Icons.groups_rounded, Colors.green, Colors.green.withOpacity(0.1), '${provider.allCenters.length}', 'إجمالي المراكز', isDark),
      ],
    );
  }

  Widget _buildStatCard(IconData icon, Color iconColor, Color iconBgColor, String value, String label, bool isDark) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: isDark ? AppTheme.darkSurface : Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!)),
        child: Column(
          children: [
            Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: iconBgColor, shape: BoxShape.circle), child: Icon(icon, color: iconColor, size: 24)),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
            Text(label, style: TextStyle(fontSize: 12, color: AppTheme.textSecondary), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(bool isDark, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('قائمة المراكز ($count)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
        TextButton(
          onPressed: () => _searchController.clear(),
          child: Text('إعادة ضبط', style: TextStyle(color: AppTheme.primaryColor, fontSize: 14)),
        ),
      ],
    );
  }

  Widget _buildCenterCard(models.Center center, bool isDark, CenterProvider provider) {
    final isClosed = !center.isActive;
    Color statusColor = center.isActive ? Colors.green : Colors.red;
    String statusText = center.isActive ? 'نشط' : 'مغلق';

    return Opacity(
      opacity: isClosed ? 0.6 : 1.0,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(color: isDark ? AppTheme.darkSurface : Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: isDark ? Colors.grey[800]! : Colors.grey[100]!)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64, height: 64,
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [AppTheme.primaryColor.withOpacity(0.3), AppTheme.primaryColor.withOpacity(0.1)]), borderRadius: BorderRadius.circular(12)),
                    child: Icon(isClosed ? Icons.domain_disabled : Icons.mosque_rounded, color: isClosed ? Colors.grey : AppTheme.primaryColor, size: 32),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(center.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isClosed ? Colors.grey : (isDark ? Colors.white : AppTheme.textPrimary)), maxLines: 1, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Row(children: [
                          Icon(Icons.location_on_outlined, size: 14, color: AppTheme.textSecondary),
                          const SizedBox(width: 4),
                          Expanded(child: Text(center.address ?? 'لا يوجد عنوان', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary), maxLines: 1, overflow: TextOverflow.ellipsis)),
                        ]),
                        const SizedBox(height: 12),
                        Row(children: [
                          Container(width: 6, height: 6, decoration: BoxDecoration(color: statusColor, shape: BoxShape.circle)),
                          const SizedBox(width: 4),
                          Text(statusText, style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              decoration: BoxDecoration(border: Border(top: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[100]!))),
              child: Row(
                children: [
                  Expanded(child: _buildActionButton(Icons.edit_outlined, 'تعديل', AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.1), () => context.push('/admin/add-center'))),
                  const SizedBox(width: 8),
                  Expanded(child: _buildActionButton(Icons.block_outlined, center.isActive ? 'تعطيل' : 'تفعيل', Colors.amber[700]!, Colors.amber.withOpacity(0.1), () async {
                    await provider.toggleCenterStatus(center.id);
                    if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(center.isActive ? 'تم تعطيل المركز' : 'تم تفعيل المركز'), backgroundColor: Colors.blue, behavior: SnackBarBehavior.floating));
                  })),
                  const SizedBox(width: 8),
                  Expanded(child: _buildActionButton(Icons.delete_outline, 'حذف', Colors.red, Colors.red.withOpacity(0.1), () => _deleteCenter(center, provider))),
                ],
              ),
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

  void _deleteCenter(models.Center center, CenterProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف المركز'),
        content: Text('هل أنت متأكد من حذف "${center.name}"؟\n\nسيتم حذف جميع البيانات المرتبطة بهذا المركز.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () async {
              await provider.deleteCenter(center.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم حذف "${center.name}" بنجاح'), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
