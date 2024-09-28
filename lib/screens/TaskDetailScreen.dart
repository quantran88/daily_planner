import 'package:daily_planner/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskDetailScreen extends StatelessWidget {
  final String taskTitle;
  final String taskDescription;

  // Sử dụng named parameters và required để đảm bảo nhận dữ liệu đúng
  const TaskDetailScreen({
    Key? key, // Thêm key để cải thiện hiệu suất của widget
    required this.taskTitle,
    required this.taskDescription,
  }) : super(key: key); // Gọi đến constructor của superclass

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết công việc',
        style: TextStyle(fontSize: Provider.of<ThemeProvider>(context).fontSize),),
      ),
      backgroundColor: Provider.of<ThemeProvider>(context).themeColor,    
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              taskDescription,
              style: TextStyle(fontSize: 16),
            ),
            // Thêm thông tin chi tiết khác nếu cần
          ],
        ),
      ),
    );
  }
}
