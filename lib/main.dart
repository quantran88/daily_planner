import 'package:daily_planner/screens/Login_screens.dart';
import 'package:flutter/material.dart';
import 'theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: DailyPlannerApp(),
    ),
  );
}

class DailyPlannerApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Daily Planner',
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: WelcomeScreen(),
    );
  }
}


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/lovepik-plan-to-arrange-the-check-plan-icon-free-vector-png-image_401473706_wh1200.png'), // Thay bằng đường dẫn logo của bạn
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Đăng Nhập'),
            ),
          ],
        ),
      ),
    );
  }
}