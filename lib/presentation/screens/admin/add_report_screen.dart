import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

import '../../providers/halqa_provider.dart';
import '../../providers/student_provider.dart';
import '../../providers/report_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/quran_constants.dart';
import '../../../data/models/report.dart';
import '../../../data/models/student.dart';
import '../../../data/models/halqa.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key});

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  String? _selectedHalqaId;
  DateTime _selectedDate = DateTime.now();
  final Map<String, StudentReportData> _studentReports = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة تقرير جماعي'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/admin'),
        ),
      ),
      body: Column(
        children: [
          // Header with selections
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Column(
              children: [
                // Halqa selector
                Consumer<HalqaProvider>(
                  builder: (context, provider, _) {
                    return DropdownButtonFormField<String>(
                      value: _selectedHalqaId,
                      decoration: const InputDecoration(
                        labelText: 'اختر الحلقة',
                        prefixIcon: Icon(Icons.groups),
                      ),
                      items: provider.halqat.map((h) {
                        return DropdownMenuItem(value: h.id, child: Text(h.name));
                      }).toList(),
                      onChanged: (v) {
                        setState(() {
                          _selectedHalqaId = v;
                          _studentReports.clear();
                          _initStudentReports();
                        });
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                
                // Date selector
                InkWell(
                  onTap: _selectDate,
                  child: InputDecorator(
                    decoration: const InputDecoration(
                      labelText: 'التاريخ',
                      prefixIcon: Icon(Icons.calendar_today),
                    ),
                    child: Text(
                      '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Students list
          Expanded(
            child: _selectedHalqaId == null
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.groups_outlined, size: 64, color: Colors.grey.shade300),
                        const SizedBox(height: 16),
                        Text('اختر حلقة لعرض الطلاب', style: TextStyle(color: Colors.grey.shade600)),
                      ],
                    ),
                  )
                : Consumer<StudentProvider>(
                    builder: (context, provider, _) {
                      final students = provider.getStudentsByHalqa(_selectedHalqaId!);
                      
                      if (students.isEmpty) {
                        return Center(
                          child: Text('لا يوجد طلاب في هذه الحلقة', 
                            style: TextStyle(color: Colors.grey.shade600)),
                        );
                      }

                      return ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];
                          return _buildStudentReportCard(student);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: _selectedHalqaId != null
          ? SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: _submitReport,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('رفع التقرير', style: TextStyle(fontSize: 18)),
                ),
              ),
            )
          : null,
    );
  }

  void _initStudentReports() {
    if (_selectedHalqaId == null) return;
    
    final students = context.read<StudentProvider>().getStudentsByHalqa(_selectedHalqaId!);
    for (final student in students) {
      _studentReports[student.id] = StudentReportData(
        studentId: student.id,
        studentName: student.fullName,
      );
    }
  }

  Widget _buildStudentReportCard(Student student) {
    final reportData = _studentReports[student.id] ?? StudentReportData(
      studentId: student.id,
      studentName: student.fullName,
    );

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Student name
            Text(
              student.fullName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            // Attendance status
            Wrap(
              spacing: 8,
              children: AttendanceStatus.values.map((status) {
                final isSelected = reportData.attendanceStatus == status;
                return ChoiceChip(
                  label: Text(status.arabicName),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _studentReports[student.id] = reportData.copyWith(
                        attendanceStatus: status,
                      );
                    });
                  },
                  selectedColor: _getStatusColor(status),
                );
              }).toList(),
            ),
            
            // Recitation section (only if present)
            if (reportData.attendanceStatus == AttendanceStatus.present) ...[
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              
              // Recitations list
              ...reportData.recitations.asMap().entries.map((entry) {
                return _buildRecitationRow(student.id, entry.key, entry.value);
              }),
              
              // Add recitation button
              TextButton.icon(
                onPressed: () => _addRecitation(student.id),
                icon: const Icon(Icons.add),
                label: const Text('إضافة تسميع'),
              ),
            ],
            
            // Daily notes field (shown for all statuses)
            const SizedBox(height: 12),
            TextFormField(
              initialValue: reportData.notes,
              decoration: InputDecoration(
                labelText: 'ملاحظات يومية',
                hintText: 'ملاحظات تظهر لولي الأمر...',
                prefixIcon: const Icon(Icons.note_alt_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                isDense: true,
              ),
              maxLines: 2,
              onChanged: (value) {
                _studentReports[student.id] = reportData.copyWith(notes: value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecitationRow(String studentId, int index, RecitationData recitation) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<RecitationType>(
                  value: recitation.type,
                  decoration: const InputDecoration(
                    labelText: 'نوع التسميع',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: RecitationType.values.map((t) {
                    return DropdownMenuItem(value: t, child: Text(t.arabicName));
                  }).toList(),
                  onChanged: (v) => _updateRecitation(studentId, index, type: v),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeRecitation(studentId, index),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<int>(
                  value: recitation.surahNumber,
                  decoration: const InputDecoration(
                    labelText: 'السورة',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  items: QuranConstants.surahs.map((s) {
                    return DropdownMenuItem(value: s.number, child: Text(s.arabicName));
                  }).toList(),
                  onChanged: (v) => _updateRecitation(studentId, index, surahNumber: v),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: recitation.fromVerse.toString(),
                  decoration: const InputDecoration(
                    labelText: 'من آية',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => _updateRecitation(studentId, index, fromVerse: int.tryParse(v)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  initialValue: recitation.toVerse.toString(),
                  decoration: const InputDecoration(
                    labelText: 'إلى آية',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (v) => _updateRecitation(studentId, index, toVerse: int.tryParse(v)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addRecitation(String studentId) {
    setState(() {
      final data = _studentReports[studentId]!;
      data.recitations.add(RecitationData());
    });
  }

  void _removeRecitation(String studentId, int index) {
    setState(() {
      _studentReports[studentId]!.recitations.removeAt(index);
    });
  }

  void _updateRecitation(
    String studentId,
    int index, {
    RecitationType? type,
    int? surahNumber,
    int? fromVerse,
    int? toVerse,
  }) {
    setState(() {
      final recitation = _studentReports[studentId]!.recitations[index];
      if (type != null) recitation.type = type;
      if (surahNumber != null) recitation.surahNumber = surahNumber;
      if (fromVerse != null) recitation.fromVerse = fromVerse;
      if (toVerse != null) recitation.toVerse = toVerse;
    });
  }

  Color _getStatusColor(AttendanceStatus status) {
    switch (status) {
      case AttendanceStatus.present:
        return Colors.green.shade200;
      case AttendanceStatus.absent:
        return Colors.red.shade200;
      case AttendanceStatus.escaped:
        return Colors.orange.shade200;
      case AttendanceStatus.didNotRecite:
        return Colors.blue.shade200;
      case AttendanceStatus.excusedAbsence:
        return Colors.purple.shade200;
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _submitReport() async {
    const uuid = Uuid();
    
    final studentReports = _studentReports.values.map((data) {
      return StudentReport(
        id: uuid.v4(),
        reportId: '',
        studentId: data.studentId,
        studentName: data.studentName,
        attendanceStatus: data.attendanceStatus,
        recitations: data.recitations.map((r) {
          final surah = QuranConstants.getSurahByNumber(r.surahNumber);
          return Recitation(
            id: uuid.v4(),
            studentReportId: '',
            type: r.type,
            surahNumber: r.surahNumber,
            surahName: surah.arabicName,
            fromVerse: r.fromVerse,
            toVerse: r.toVerse,
          );
        }).toList(),
      );
    }).toList();

    final success = await context.read<ReportProvider>().createReport(
      halqaId: _selectedHalqaId!,
      date: _selectedDate,
      studentReports: studentReports,
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم رفع التقرير بنجاح')),
      );
      context.go('/admin');
    }
  }
}

// Helper classes for managing form state
class StudentReportData {
  final String studentId;
  final String studentName;
  AttendanceStatus attendanceStatus;
  List<RecitationData> recitations;
  String? notes;

  StudentReportData({
    required this.studentId,
    required this.studentName,
    this.attendanceStatus = AttendanceStatus.present,
    List<RecitationData>? recitations,
    this.notes,
  }) : recitations = recitations ?? [];

  StudentReportData copyWith({
    AttendanceStatus? attendanceStatus,
    String? notes,
  }) {
    return StudentReportData(
      studentId: studentId,
      studentName: studentName,
      attendanceStatus: attendanceStatus ?? this.attendanceStatus,
      recitations: recitations,
      notes: notes ?? this.notes,
    );
  }
}

class RecitationData {
  RecitationType type;
  int surahNumber;
  int fromVerse;
  int toVerse;

  RecitationData({
    this.type = RecitationType.memorization,
    this.surahNumber = 1,
    this.fromVerse = 1,
    this.toVerse = 1,
  });
}

