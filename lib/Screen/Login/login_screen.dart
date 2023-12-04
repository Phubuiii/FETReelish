import 'package:flutter/material.dart';
import 'package:flutter_application/Screen/Home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => HomePage(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.black, // Set the text color to black
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true; // Initially password is obscured

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MỘC ÂM'),
        backgroundColor: Color(0xFF66FF66),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Handle user icon press (e.g., navigate to user profile)
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFCCFFCC),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Login text
            Align(
              alignment: Alignment.center,
              child: Text(
                'Đăng Nhập',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Username TextField
            Container(
              color: Color(0xFFD9D9D9),
              child: TextField(
                controller: _usernameController,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Tên đăng nhập',
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: _usernameController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _usernameController.clear();
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Password TextField with visibility toggle
            Container(
              color: Color(0xFFD9D9D9),
              child: TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Handle login logic here
                String username = _usernameController.text;
                String password = _passwordController.text;
                // Perform login validation and navigate to the next screen if successful
                // For simplicity, let's just print the credentials for now
                Navigator.pushNamed(context, '/home');
                print('Username: $username\nPassword: $password');
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFF0F05E),
              ),
              child: Text(
                'Đăng nhập',
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 16.0),
            // Image
            Image.asset(
              'assets/login.png', // Replace with the actual file path
              height: 100.0, // Adjust the height as needed
            ),
          ],
        ),
      ),
    );
  }
}
