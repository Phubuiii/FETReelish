import 'package:flutter/material.dart';
import 'package:flutter_application/Screen/Lesson/lesson.dart';
import 'package:flutter_application/Screen/Course/course.dart';
import 'package:flutter_application/Screen/Profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), routes: {
      '/Profile': (context) => UserProfilePage(),
      '/Lesson': (context) => LessonPage(),
      '/Course': (context) => CoursePage(),
      '/Home': (context) => HomePage(),
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF66FF66),
        title: Row(
          children: [
            CustomDropdownButton(),
            Text(
              'TRANG CHỦ',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Handle user icon press
              // Example: Navigate to the user profile screen
              Navigator.pushNamed(context, '/Profile');

              print('User icon pressed');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Handle notification icon press
              // Example: Show a notification screen
              print('Notification icon pressed');
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFCCFFCC), // Background color of the screen
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Xin chào bạn đến với MỘC ÂM!!',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Color(0xFFCCFFCC),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm kiếm',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.0), // Increased spacing above the buttons
          _buildVerticalButton('KHÓA HỌC', Icons.book, Color(0xFFF0F05E)),
          SizedBox(height: 32.0), // Increased spacing between buttons
          _buildVerticalButton('LUYỆN TẬP', Icons.brush, Color(0xFFF0F05E)),
          SizedBox(height: 32.0), // Increased spacing between buttons
          _buildVerticalButton(
              'LUYỆN NGỮ PHÁP', Icons.record_voice_over, Color(0xFFF0F05E)),
          SizedBox(height: 32.0), // Increased spacing below the last button
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF66FF66),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Email: support@gmail.com',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              Text(
                'Phone: 1234567890',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalButton(String text, IconData icon, Color color) {
    return Container(
      width: 301.0,
      height: 78.0,
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle button press
          print('Button pressed: $text');
        },
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(
              vertical: 20.0, horizontal: 8.0), // Adjusted button padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        icon: Icon(icon, color: Colors.black),
        label: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0, // Adjusted text font size
          ),
        ),
      ),
    );
  }
}

class CustomDropdownButton extends StatefulWidget {
  @override
  _CustomDropdownButtonState createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String _selectedItem = 'Menu';

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: _selectedItem,
        items: [
          'Menu',
          'Home',
          'Course',
          'Lesson',
          'Quiz',
          'Practice',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedItem = newValue;
              if (_selectedItem != 'Menu') {
                // Navigate to the selected route
                Navigator.pushReplacementNamed(context, '/$_selectedItem');
              }
            });
          }
        },
        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
