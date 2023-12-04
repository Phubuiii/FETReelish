import 'package:flutter/material.dart';
import 'package:flutter_application/Screen/Lesson/lesson.dart';
import 'package:flutter_application/Screen/Profile/profile.dart';
import 'package:flutter_application/Screen/Home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CoursePage(), routes: {
      '/profile': (context) => UserProfilePage(),
      '/lesson': (context) => LessonPage(),
      '/course': (context) => CoursePage(),
      '/home': (context) => HomePage(),
    });
  }
}

class CoursePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF66FF66),
        title: Row(
          children: [
            CustomDropdownButton(),
            Text(
              'Khóa học',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
            onPressed: () {
              // Handle user icon press
              // You can implement navigation or other actions here
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {
              // Handle notification icon press
              // You can implement navigation or other actions here
            },
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFCCFFCC),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Add a smaller and rounded search bar
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey), // Add search icon
                      SizedBox(width: 8.0),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border:
                                InputBorder.none, // Remove the default border
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Use GridView for lesson buttons
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two items in each row
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 100, // Adjust the width as needed
                      height: 80, // Adjust the height as needed
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle button press
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors
                              .lightBlue, // Change the button color as needed
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons
                                .book), // Add an icon to the left of the text
                            SizedBox(width: 8.0),
                            Text(
                              'Lesson ${index + 1}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
          'Menu', // Added 'Menu' as the first item
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
              if (_selectedItem != 'Home') {
                // Navigate to the selected route
                Navigator.pushReplacementNamed(context, '/home');
              }
              if (_selectedItem != 'Course') {
                // Navigate to the selected route
                Navigator.pushReplacementNamed(context, '/course');
              }
              if (_selectedItem != 'Lesson') {
                // Navigate to the selected route
                Navigator.pushReplacementNamed(context, '/lesson');
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
