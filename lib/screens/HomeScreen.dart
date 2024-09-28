

import 'package:daily_planner/screens/setting_screen.dart';
import 'package:daily_planner/screens/CalendarView.dart';
import 'package:daily_planner/screens/TakeStaticscreen.dart';
import 'package:daily_planner/screens/TaskList_screens.dart';
import 'package:flutter/material.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _currentIndex = 0;

  List<Task> taskList = [
    Task(title: 'Task 1', description: 'Nấu cơm 1', isCompleted: true),
    Task(title: 'Task 2', description: 'Nấu cơm 2', isInProgress: true),
    Task(title: 'Task 3', description: 'Nấu cơm 3', isNew: true),
    Task(title: 'Task 4', description: 'Nấu cơm 4', isCompleted: true),
  ];

  @override
  Widget build(BuildContext context) {
    int completedTasks = taskList.where((task) => task.isCompleted).length;
    int inProgressTasks = taskList.where((task) => task.isInProgress).length;
    int newTasks = taskList.where((task) => task.isNew).length;

    final List<Widget> _screens = [
      TaskListScreen(taskList: taskList),
      CalendarView(),
      TaskStatisticsScreen(
        completedTasks: completedTasks,
        inProgressTasks: inProgressTasks,
        newTasks: newTasks,
      ),
      SettingsScreen(), // Màn hình cài đặt
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.grey, // Màu cho item được chọn
        unselectedItemColor: Colors.grey, // Màu cho các item không được chọn
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Công việc'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Lịch'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Thống kê'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Cài đặt'),
        ],
      ),
    );
  }
}
