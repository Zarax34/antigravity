import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';

class MessagingScreen extends StatelessWidget {
  const MessagingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: isDark ? AppTheme.darkSurface : Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_forward,
              color: isDark ? Colors.white : AppTheme.textPrimary,
            ),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'المراسلات',
            style: TextStyle(
              color: isDark ? Colors.white : AppTheme.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.mail_outline_rounded,
                    size: 64,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Title
                Text(
                  'نظام المراسلات',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 16),
                
                // Description
                Text(
                  'نعمل على تطوير نظام مراسلات متكامل للتواصل مع المراكز والمعلمين وأولياء الأمور',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Coming soon badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.orange.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.construction,
                        color: Colors.orange,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'قريباً إن شاء الله',
                        style: TextStyle(
                          color: Colors.orange.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                
                // Features list
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? AppTheme.darkSurface : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'الميزات القادمة:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppTheme.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildFeatureItem(
                        icon: Icons.message,
                        text: 'إرسال رسائل للمراكز',
                        isDark: isDark,
                      ),
                      _buildFeatureItem(
                        icon: Icons.notifications,
                        text: 'إشعارات فورية',
                        isDark: isDark,
                      ),
                      _buildFeatureItem(
                        icon: Icons.group,
                        text: 'مجموعات المراسلة',
                        isDark: isDark,
                      ),
                      _buildFeatureItem(
                        icon: Icons.history,
                        text: 'سجل المراسلات',
                        isDark: isDark,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem({
    required IconData icon,
    required String text,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: AppTheme.primaryColor,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: isDark ? Colors.grey[300] : AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
