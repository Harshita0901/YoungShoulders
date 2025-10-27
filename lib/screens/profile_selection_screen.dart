import 'package:flutter/material.dart';
import '../models/app_user.dart';  // import your AppUser model
import 'teen_home_screen.dart';
import 'supporter_dashboard.dart';
import 'supporter_home_screen.dart';

class ProfileSelectionScreen extends StatelessWidget {
  final AppUser user;

  const ProfileSelectionScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Who’s using the app?'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileCard(
              title: 'Teen',
              subtitle: 'Enter the healing space',
              icon: Icons.person,
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeenHomeScreen(user: user),
                  ),
                );
              },
            ),
            SizedBox(height: 24),
            ProfileCard(
              title: 'Supporter',
              subtitle: 'Parent, counselor, or sibling',
              icon: Icons.volunteer_activism,
              onTap: () {
                // Navigate to SupporterHomeScreen (create this if doesn't exist)
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupporterHomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: EdgeInsets.all(24),
          width: double.infinity,
          child: Row(
            children: [
              Icon(icon, size: 48, color: Colors.deepPurple),
              SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(subtitle,
                      style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
