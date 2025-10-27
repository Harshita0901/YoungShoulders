import 'package:flutter/material.dart';
import 'supporter_mood_progress_screen.dart';
import 'supporter_ai_chat_screen.dart';
import 'supporter_map_screen.dart';
import 'supporter_symptom_checker_screen.dart';

class SupporterDashboardTab extends StatelessWidget {
  const SupporterDashboardTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.teal.shade300, Colors.deepPurple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome back, Supporter',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'Your teen’s well-being matters.',
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Analyze Teen Symptoms Card
          DashboardCard(
            icon: Icons.psychology,
            title: 'Analyze Teen Symptoms',
            description: 'Get insights into possible patterns or risks in your teen’s behavior.',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SupporterSymptomCheckerScreen()),
              );
            },
          ),
          const SizedBox(height: 16),

          // Mood Tracking Card
          DashboardCard(
            icon: Icons.show_chart,
            title: 'Mood Tracking',
            description: '5 mood updates this week. Track your teen’s emotional progress.',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SupporterMoodProgressScreen()),
              );
            },
          ),
          const SizedBox(height: 16),

          // AI Chat Support Card
          DashboardCard(
            icon: Icons.chat_bubble,
            title: 'AI Chat Support',
            description: 'Ask questions about supporting your teen...',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SupporterAIChatScreen()),
              );
            },
          ),
          const SizedBox(height: 16),

          // Suggested Places Card
          DashboardCard(
            icon: Icons.place,
            title: 'Suggested Places (Map)',
            description: 'Find nearby therapy centers or safe spaces.',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SupporterMapScreen()),
                  url: "https://www.google.com/maps/search/therapy+center+near+me",
              );
            },
          ),
          const SizedBox(height: 16),

          // Quick Stats / Insights Card
          DashboardCard(
            icon: Icons.insights,
            title: 'Quick Stats / Insights',
            description: 'You’ve logged 5 mood updates this week. 2 new resources added. “Stay calm and breathe.”',
            onPressed: () {
              // Can be a placeholder page for stats
            },
          ),
        ],
      ),
    );
  }
}

// Reusable Dashboard Card Widget
class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onPressed;

  const DashboardCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 36, color: Colors.deepPurple),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Open'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
