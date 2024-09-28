import 'package:daily_planner/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class TaskStatisticsScreen extends StatelessWidget {
  final int completedTasks;
  final int inProgressTasks;
  final int newTasks;

  TaskStatisticsScreen({
    required this.completedTasks,
    required this.inProgressTasks,
    required this.newTasks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Statistics',
        style: TextStyle(fontSize: Provider.of<ThemeProvider>(context).fontSize),),
      ),
      backgroundColor: Provider.of<ThemeProvider>(context).themeColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Công việc đã hoàn thành: $completedTasks',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Công việc đang thực hiện: $inProgressTasks',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Công việc mới tạo: $newTasks',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),  // Thêm khoảng cách trước biểu đồ
            Expanded(  // Sử dụng Expanded để chiếm hết không gian còn lại
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: completedTasks.toDouble(),
                      title: 'Completed',
                      color: Colors.green,
                    ),
                    PieChartSectionData(
                      value: inProgressTasks.toDouble(),
                      title: 'In Progress',
                      color: Colors.orange,
                    ),
                    PieChartSectionData(
                      value: newTasks.toDouble(),
                      title: 'New',
                      color: Colors.blue,
                    ),
                  ],
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: 40,  // Điều chỉnh kích thước không gian ở giữa
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
