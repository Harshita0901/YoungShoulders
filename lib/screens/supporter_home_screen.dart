import 'package:flutter/material.dart';
import 'supporter_dashboard.dart';
import 'supporter_map_screen.dart';
import 'supporter_resources_screen.dart';
import 'supporter_settings_screen.dart';

class SupporterHomeScreen extends StatefulWidget {
  const SupporterHomeScreen({Key? key}) : super(key: key);

  @override
  _SupporterHomeScreenState createState() => _SupporterHomeScreenState();
}

class _SupporterHomeScreenState extends State<SupporterHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    SupporterDashboard(), // your polished dashboard with all components
    SupporterMapScreen(url: 'https://www.google.com/maps/search/therapy+center+near+me',), // map of suggested safe places
    SupporterResourcesScreen(), // your existing resources hub
    SupporterSettingsScreen(), // settings tab
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
