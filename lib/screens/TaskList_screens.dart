

import 'package:daily_planner/screens/AddNewTasklist.dart';
import 'package:daily_planner/screens/TaskDetailScreen.dart';
import 'package:daily_planner/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class TaskListScreen extends StatefulWidget {
  final List<Task> taskList;
   const TaskListScreen({Key? key, required this.taskList}) : super(key: key);
  
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
} 
class Task {
  String title;
  String description;
  bool isCompleted;
  bool isInProgress;
  bool isNew;

  Task({
    required this.title,
    required this.description,
    this.isCompleted = false,
    this.isInProgress = false,
    this.isNew = true,
  });
}
List<Task> taskList = [
  Task(title: 'Task 1', description: 'Nau Com 1', isCompleted: true),
  Task(title: 'Task 2', description: 'Nau Com 2', isInProgress: true),
  Task(title: 'Task 3', description: 'Nau Com 3', isNew: true),
  Task(title: 'Task 4', description: 'Nau Com 4', isCompleted: true),
];


class _TaskListScreenState extends State<TaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List',style: TextStyle(fontSize: Provider.of<ThemeProvider>(context).fontSize),
        ),
        backgroundColor: Provider.of<ThemeProvider>(context).themeColor,
        actions: [ 
          IconButton(
            icon: Icon(
              Provider.of<ThemeProvider>(context).isDarkMode
                  ? Icons.wb_sunny
                  : Icons.nights_stay,
            ),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ), 
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddNewTaskScreen()),
              ).then((newTask) {
                if (newTask != null) {
                  setState(() {
                    // Thêm công việc mới với tiêu đề và mô tả
                    widget.taskList.add(Task(
                      title: newTask['title']!,
                      description: newTask['description']!,  // Lấy description từ newTask
                      isNew: true,
                      isInProgress: false,
                      isCompleted: false,
                    ));
                  });
                }
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.taskList.length,  // Hiển thị task từ widget.taskList
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.taskList[index].title),  // Hiển thị tiêu đề công việc
            subtitle: Text(widget.taskList[index].description),  // Hiển thị mô tả công việc
            onTap: () {
              // Điều hướng đến màn hình chi tiết công việc
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailScreen(
                    taskTitle: widget.taskList[index].title,
                    taskDescription: widget.taskList[index].description,  // Truyền mô tả công việc
                  ),
                ),
              );
            },         
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.taskList.removeAt(index);  // Xóa task từ widget.taskList
                });
              },
            ),
          );
        },
      ),
    );
  }
}