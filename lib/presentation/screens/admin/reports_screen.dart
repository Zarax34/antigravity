import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../providers/report_provider.dart';
import '../../../core/theme/app_theme.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التقارير اليومية'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/admin'),
        ),
      ),
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
                  Icon(Icons.description_outlined, size: 80, color: Colors.grey.shade300),
                  const SizedBox(height: 16),
                  Text('لا توجد تقارير', style: TextStyle(fontSize: 18, color: Colors.grey.shade600)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () => context.go('/admin/add-report'),
                    icon: const Icon(Icons.add),
                    label: const Text('إضافة تقرير'),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.reports.length,
            itemBuilder: (context, index) {
              final report = provider.reports[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: AppTheme.primaryLight.withOpacity(0.2),
                    child: const Icon(Icons.description, color: AppTheme.primaryColor),
                  ),
                  title: Text('تقرير ${report.date.day}/${report.date.month}/${report.date.year}'),
                  subtitle: Text('${report.studentReports.length} طالب'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildChip('${report.presentCount}', Colors.green),
                      const SizedBox(width: 4),
                      _buildChip('${report.absentCount}', Colors.red),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/admin/add-report'),
        icon: const Icon(Icons.add),
        label: const Text('إضافة تقرير'),
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
    );
  }
}
