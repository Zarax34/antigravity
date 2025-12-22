import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../providers/user_provider.dart';
import '../../providers/auth_provider.dart';
import '../../../data/models/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  String _selectedFilter = 'all';
  final _searchController = TextEditingController();
  
  final List<String> _filters = ['الكل', 'مسؤولين', 'معلمين', 'أولياء أمور', 'طلاب'];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
    
    // تمرير معلومات المستخدم الحالي للفلترة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = context.read<AuthProvider>();
      final currentUser = authProvider.currentUser;
      if (currentUser != null) {
        context.read<UserProvider>().setCurrentUserInfo(
          currentUser.centerId,
          currentUser.role,
        );
      }
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    context.read<UserProvider>().setSearchQuery(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        body: Consumer<UserProvider>(
          builder: (context, provider, child) {
            final users = provider.users;
            
            return Column(
              children: [
                _buildHeader(isDark, provider, users.length),
                Expanded(
                  child: users.isEmpty
                      ? _buildEmptyState(isDark)
                      : ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: users.length,
                          itemBuilder: (context, index) => _buildUserCard(users[index], isDark, provider),
                        ),
                ),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.push('/admin/add-user'),
          backgroundColor: AppTheme.primaryColor,
          child: const Icon(Icons.person_add, color: Colors.white),
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

  Widget _buildHeader(bool isDark, UserProvider provider, int count) {
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
                  Expanded(child: Text('إدارة المستخدمين', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary))),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(color: AppTheme.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(20)),
                    child: Text('$count مستخدم', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 48,
                decoration: BoxDecoration(color: isDark ? AppTheme.darkBackground : Colors.grey[50], borderRadius: BorderRadius.circular(12)),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: isDark ? Colors.white : AppTheme.textPrimary),
                  decoration: InputDecoration(
                    hintText: 'بحث بالاسم أو البريد أو الهاتف...', hintStyle: TextStyle(color: AppTheme.textSecondary),
                    prefixIcon: Icon(Icons.search, color: AppTheme.textSecondary),
                    suffixIcon: _searchController.text.isNotEmpty ? IconButton(icon: Icon(Icons.clear, color: AppTheme.textSecondary), onPressed: () => _searchController.clear()) : null,
                    border: InputBorder.none, contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
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
                        provider.setRoleFilter(index == 0 ? null : filter);
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

  Widget _buildUserCard(User user, bool isDark, UserProvider provider) {
    String roleName;
    Color roleColor;
    IconData roleIcon;
    
    switch (user.role) {
      case UserRole.systemAdmin:
        roleName = 'مسؤول النظام';
        roleColor = Colors.red;
        roleIcon = Icons.admin_panel_settings;
        break;
      case UserRole.centerManager:
        roleName = 'مسؤول مركز';
        roleColor = Colors.purple;
        roleIcon = Icons.manage_accounts;
        break;
      case UserRole.teacher:
        roleName = 'معلم';
        roleColor = Colors.blue;
        roleIcon = Icons.school;
        break;
      case UserRole.parent:
        roleName = 'ولي أمر';
        roleColor = Colors.green;
        roleIcon = Icons.family_restroom;
        break;
      case UserRole.student:
        roleName = 'طالب';
        roleColor = Colors.orange;
        roleIcon = Icons.person;
        break;
      default:
        roleName = 'غير محدد';
        roleColor = Colors.grey;
        roleIcon = Icons.person;
    }

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
            Stack(
              children: [
                Container(
                  width: 56, height: 56,
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [roleColor.withOpacity(0.3), roleColor.withOpacity(0.1)]), shape: BoxShape.circle),
                  child: Center(child: Text(user.fullName.isNotEmpty ? user.fullName.substring(0, 1) : '?', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: roleColor))),
                ),
                if (user.isActive)
                  Positioned(
                    bottom: 2, right: 2,
                    child: Container(width: 12, height: 12, decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle, border: Border.all(color: isDark ? AppTheme.darkSurface : Colors.white, width: 2))),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.fullName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: isDark ? Colors.white : AppTheme.textPrimary)),
                  const SizedBox(height: 4),
                  Row(children: [Icon(Icons.email_outlined, size: 12, color: AppTheme.textSecondary), const SizedBox(width: 4), Expanded(child: Text(user.email ?? 'لا يوجد بريد', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary), overflow: TextOverflow.ellipsis))]),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: roleColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(roleIcon, size: 14, color: roleColor), const SizedBox(width: 4), Text(roleName, style: TextStyle(fontSize: 11, color: roleColor, fontWeight: FontWeight.w500))]),
                      ),
                      const SizedBox(width: 8),
                      Row(children: [
                        Container(width: 6, height: 6, decoration: BoxDecoration(color: user.isActive ? Colors.green : Colors.grey, shape: BoxShape.circle)),
                        const SizedBox(width: 4),
                        Text(user.isActive ? 'نشط' : 'غير نشط', style: TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: Icon(Icons.more_vert, color: AppTheme.textSecondary),
              onSelected: (value) async {
                switch (value) {
                  case 'view':
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('عرض تفاصيل ${user.fullName}'), behavior: SnackBarBehavior.floating));
                    break;
                  case 'edit':
                    context.push('/admin/add-user');
                    break;
                  case 'toggle':
                    await provider.toggleUserStatus(user.id);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(user.isActive ? 'تم تعطيل المستخدم' : 'تم تفعيل المستخدم'), backgroundColor: Colors.blue, behavior: SnackBarBehavior.floating));
                    break;
                  case 'delete':
                    _deleteUser(user, provider);
                    break;
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(value: 'view', child: Row(children: [Icon(Icons.visibility_outlined, size: 20), SizedBox(width: 8), Text('عرض')])),
                const PopupMenuItem(value: 'edit', child: Row(children: [Icon(Icons.edit_outlined, size: 20), SizedBox(width: 8), Text('تعديل')])),
                PopupMenuItem(value: 'toggle', child: Row(children: [Icon(user.isActive ? Icons.block : Icons.check_circle_outline, size: 20), const SizedBox(width: 8), Text(user.isActive ? 'تعطيل' : 'تفعيل')])),
                const PopupMenuItem(value: 'delete', child: Row(children: [Icon(Icons.delete_outline, size: 20, color: Colors.red), SizedBox(width: 8), Text('حذف', style: TextStyle(color: Colors.red))])),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _deleteUser(User user, UserProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('حذف المستخدم'),
        content: Text('هل أنت متأكد من حذف "${user.fullName}"؟'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () async {
              await provider.deleteUser(user.id);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم حذف "${user.fullName}" بنجاح'), backgroundColor: Colors.green, behavior: SnackBarBehavior.floating));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }
}
