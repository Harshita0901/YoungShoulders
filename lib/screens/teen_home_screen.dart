import 'package:flutter/material.dart';
import '../models/app_user.dart';
import 'mood_screen.dart';
import 'teen_dashboard.dart';
import 'resources_screen.dart';
import 'progress_screen.dart';
import 'teen_settings_screen.dart';
import 'ai_chat_screen.dart';


class TeenHomeScreen extends StatefulWidget {
  final AppUser user;

  const TeenHomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<TeenHomeScreen> createState() => _TeenHomeScreenState();
}

class _TeenHomeScreenState extends State<TeenHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      TeenDashboard(user: widget.user),  // pass full user object
      MoodScreen(user: widget.user),     // pass full user object
      ResourcesScreen(),
      ProgressScreen(user: widget.user),
      TeenSettingsScreen(user: widget.user),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Hi, ${widget.user.firstName} 👋"),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_emotions), label: 'Mood'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Resources'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
