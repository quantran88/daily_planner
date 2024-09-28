import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daily_planner/theme_provider.dart'; // Import theme provider

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color _selectedColor = Colors.blue; // Mặc định màu
  double _fontSize = 16.0; // Mặc định kích thước font

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tùy chọn màu sắc
            Text(
              'Chọn màu sắc:',
              style: TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = Colors.red;
                    });
                  },
                  child: CircleAvatar(backgroundColor: Colors.red),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = Colors.green;
                    });
                  },
                  child: CircleAvatar(backgroundColor: Colors.green),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = Colors.blue;
                    });
                  },
                  child: CircleAvatar(backgroundColor: Colors.blue),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Tùy chọn kích thước font
            Text(
              'Chọn kích thước font:',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: _fontSize,
              min: 10,
              max: 30,
              divisions: 20,
              label: _fontSize.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Lưu cài đặt
                Provider.of<ThemeProvider>(context, listen: false).setThemeColor(_selectedColor);
                Provider.of<ThemeProvider>(context, listen: false).setFontSize(_fontSize);
                Navigator.pop(context);
              },
              child: Text('Lưu cài đặt'),
            ),
          ],
        ),
      ),
    );
  }
}
