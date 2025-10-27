import 'package:flutter/material.dart';
import 'supporter_dashboard_tab.dart';
import 'supporter_map_screen.dart';
import 'supporter_resources_tab.dart';
import 'supporter_settings_screen.dart';

class SupporterMainScreen extends StatefulWidget {
  const SupporterMainScreen({Key? key}) : super(key: key);

  @override
  _SupporterMainScreenState createState() => _SupporterMainScreenState();
}

class _SupporterMainScreenState extends State<SupporterMainScreen> {
  int _currentIndex = 0;

  // List of tabs
  final List<Widget> _tabs = const [
    SupporterDashboardTab(),
    SupporterMapScreen(),
    SupporterResourcesTab(),
    SupporterSettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
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
            icon: Icon(Icons.menu_book),
            label: 'Resources',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
