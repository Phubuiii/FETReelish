import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_application/Screen/Profile/profile.dart';
import 'package:flutter_application/Screen/Course/course.dart';
import 'package:flutter_application/Screen/Home/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/profile': (context) => UserProfilePage(),
        '/lesson': (context) => LessonPage(),
        '/course': (context) => CoursePage(),
        '/home': (context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Color(0xFF66FF66),
        colorScheme: ColorScheme.light(
          primary: Color(0xFF66FF66),
          secondary: Colors.yellow, // Accent color
        ),
        textTheme: TextTheme(
            // Define your text styles as needed
            ),
      ),
      home: LessonPage(),
    );
  }
}

class LessonPage extends StatefulWidget {
  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  late VideoPlayerController _controller;
  double _userRating = 0.0;
  TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/test_video.mp4')
      ..initialize().then((_) {
        setState(() {});
      })
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    double percentageWatched = _controller.value.position.inMilliseconds /
        _controller.value.duration.inMilliseconds;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CustomDropdownButton(),
            Text(
              'Bài Học',
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFCCFFCC), Colors.white],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: _controller.value.isInitialized
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          VideoPlayer(_controller),
                          CircularProgressIndicator(
                            value: percentageWatched,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                            backgroundColor: Colors.transparent,
                            strokeWidth: 6.0,
                          ),
                        ],
                      ),
                    )
                  : CircularProgressIndicator(),
            ),
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.replay_10, color: Colors.black),
                      onPressed: () {
                        _controller.seekTo(
                          _controller.value.position - Duration(seconds: 10),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.forward_10, color: Colors.black),
                      onPressed: () {
                        _controller.seekTo(
                          _controller.value.position + Duration(seconds: 10),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.fullscreen, color: Colors.black),
                      onPressed: () {
                        // Implement full-screen functionality here
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle going to the previous lesson
                    // Implement your logic here
                  },
                  child: Text('Previous Lesson'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle going to the next lesson
                    // Implement your logic here
                  },
                  child: Text('Next Lesson'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: _userRating,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _userRating = rating;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20.0),
            // Comment Box
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Leave a Comment:',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: _commentController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Type your comment here...',
                    ),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle submitting the comment
                      // You can access the comment using _commentController.text
                      print('User Comment: ${_commentController.text}');
                    },
                    child: Text('Submit Comment'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
