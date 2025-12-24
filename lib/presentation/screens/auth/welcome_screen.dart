import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../providers/center_provider.dart';
import '../../providers/auth_provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String? _selectedCenterId;

  @override
  void initState() {
    super.initState();
    // Load centers from database
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CenterProvider>().loadCenters();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: isDark ? AppTheme.darkBackground : AppTheme.backgroundColor,
        body: Stack(
          children: [
            // Background decorations
            _buildBackgroundDecorations(isDark),
            
            // Main content
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const Spacer(flex: 1),
                    
                    // Logo and title
                    _buildLogoSection(isDark),
                    
                    const Spacer(flex: 1),
                    
                    // Center selection
                    _buildCenterSelection(isDark),
                    
                    const SizedBox(height: 24),
                    
                    // Continue button
                    _buildContinueButton(),
                    
                    const SizedBox(height: 32),
                    
                    // Footer
                    _buildFooter(isDark),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundDecorations(bool isDark) {
    return Stack(
      children: [
        Positioned(
          top: -50,
          left: -50,
          child: Container(
            width: 200,
            height: 150,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.05),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.4,
          right: -50,
          child: Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Positioned(
          bottom: -50,
          left: MediaQuery.of(context).size.width * 0.2,
          child: Container(
            width: 240,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogoSection(bool isDark) {
    return Column(
      children: [
        // Logo container with animation effect
        Container(
          width: 128,
          height: 128,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[800] : Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.2),
                blurRadius: 30,
                spreadRadius: 5,
              ),
            ],
            border: Border.all(
              color: isDark ? Colors.grey[700]! : Colors.grey[100]!,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.menu_book_rounded,
              size: 64,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        
        const SizedBox(height: 32),
        
        // Title
        Text(
          'أهلاً بك',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : AppTheme.textPrimary,
          ),
        ),
        
        const SizedBox(height: 8),
        
        // Subtitle
        Text(
          'رفيقك في رحلة الحفظ والتعلم',
          style: TextStyle(
            fontSize: 18,
            color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildCenterSelection(bool isDark) {
    return Consumer<CenterProvider>(
      builder: (context, centerProvider, child) {
        final centers = centerProvider.activeCenters;
        final isLoading = centerProvider.isLoading;
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 4, bottom: 8),
              child: Text(
                'اختر مركز التحفيظ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.grey[300] : AppTheme.textSecondary,
                ),
              ),
            ),
            
            Container(
              decoration: BoxDecoration(
                color: isDark ? Colors.grey[800] : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : centers.isEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              Icon(Icons.info_outline, color: Colors.orange),
                              const SizedBox(width: 12),
                              Text(
                                'لا توجد مراكز متاحة حالياً',
                                style: TextStyle(
                                  color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        )
                      : DropdownButtonFormField<String>(
                          value: _selectedCenterId,
                          hint: Row(
                            children: [
                              Icon(
                                Icons.mosque_rounded,
                                color: AppTheme.primaryColor,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                'يرجى اختيار المركز من القائمة...',
                                style: TextStyle(
                                  color: isDark ? Colors.grey[500] : AppTheme.textHint,
                                ),
                              ),
                            ],
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                          ),
                          dropdownColor: isDark ? Colors.grey[800] : Colors.white,
                          items: centers.map((center) {
                            return DropdownMenuItem<String>(
                              value: center.id,
                              child: Text(
                                center.name,
                                style: TextStyle(
                                  color: isDark ? Colors.white : AppTheme.textPrimary,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedCenterId = value;
                            });
                            if (value != null) {
                              final center = centerProvider.getCenterById(value);
                              if (center != null) {
                                centerProvider.setSelectedCenter(center);
                              }
                            }
                          },
                        ),
            ),
            
            const SizedBox(height: 8),
            
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Text(
                '* سيتم تحميل بياناتك بناءً على المركز المختار',
                style: TextStyle(
                  fontSize: 12,
                  color: isDark ? Colors.grey[600] : Colors.grey[400],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _selectedCenterId != null
            ? () => context.go('/login')
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.primaryColor,
          disabledBackgroundColor: AppTheme.primaryColor.withOpacity(0.5),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          shadowColor: AppTheme.primaryColor.withOpacity(0.3),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'متابعة',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_back, size: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(bool isDark) {
    return Column(
      children: [
        TextButton(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('للمساعدة تواصل مع الدعم الفني: support@quran-center.com'), behavior: SnackBarBehavior.floating),
          ),
          child: Text(
            'المساعدة والدعم',
            style: TextStyle(
              color: isDark ? Colors.grey[400] : AppTheme.textSecondary,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'الإصدار 1.0.2',
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.grey[600] : Colors.grey[400],
          ),
        ),
      ],
    );
  }
}

