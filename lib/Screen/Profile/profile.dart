import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_application/Screen/Lesson/lesson.dart';
import 'package:flutter_application/Screen/Course/course.dart';
import 'package:flutter_application/Screen/Home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UserProfilePage(), routes: {
      '/Profile': (context) => UserProfilePage(),
      '/Lesson': (context) => LessonPage(),
      '/Course': (context) => CoursePage(),
      '/Home': (context) => HomePage(),
    });
  }
}

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _organizationController = TextEditingController();
  String? _selectedImagePath;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      _selectedImagePath = pickedFile?.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF66FF66),
        title: Row(
          children: [
            CustomDropdownButton(),
            Text(
              'Edit Profile',
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
      backgroundColor: Color(0xFFCCFFCC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _selectedImagePath != null
                    ? FileImage(File(_selectedImagePath!))
                    : null,
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _dobController,
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _idController,
              decoration: InputDecoration(labelText: 'ID'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _organizationController,
              decoration: InputDecoration(labelText: 'Đơn vị (Organization)'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Handle the form submission or profile update logic
                String newName = _nameController.text;
                String newDob = _dobController.text;
                String newId = _idController.text;
                String newOrganization = _organizationController.text;

                // Perform actions with the updated profile information
                print('Updated Name: $newName');
                print('Updated Date of Birth: $newDob');
                print('Updated ID: $newId');
                print('Updated Organization: $newOrganization');
                print('Selected Image Path: $_selectedImagePath');

                // You can add further logic to update the user's profile data
              },
              child: Text('Update Profile'),
            ),
          ],
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
