import 'package:daily_planner/screens/HomeScreen.dart';
import 'package:daily_planner/screens/TaskList_screens.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Đăng Nhập')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Mật Khẩu'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for login authentication
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomeScreen()),
                );
                // Thực hiện đăng nhập
              },
              child: Text('Đăng Nhập'),
            ),
            TextButton(
              onPressed: () {
                // Đăng nhập bằng SSO
              },
              child: Text('Đăng Nhập với SSO'),
            ),
          ],
        ),
      ),
    );
  }
}
