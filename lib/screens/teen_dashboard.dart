import 'package:flutter/material.dart';
import '../models/mood_data.dart';
import '../models/mood_entry.dart';
import 'quick_journal_screen.dart';
import 'upcoming_tasks_screen.dart';
import 'ai_chat_screen.dart';
import '../models/app_user.dart';

class TeenDashboard extends StatelessWidget {
  final AppUser user;

  const TeenDashboard({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'Welcome Back!',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.blue.shade700,
        elevation: 3,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGreetingCard(),
            const SizedBox(height: 30),
            // Buttons in a row for more visual interest
            Row(
              children: [
                Expanded(
                  child: _buildDashboardButton(
                    context,
                    icon: Icons.edit_note_rounded,
                    label: "Quick Journal",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuickJournalScreen(user: user),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildDashboardButton(
                    context,
                    icon: Icons.calendar_today_rounded,
                    label: "Upcoming Tasks",
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UpcomingTasksScreen(user: user),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            // AI Chat Card emphasized with larger size
            _buildAIChatCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, ${user.fullName} 👋",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "“${_getTodayAffirmation()}”",
              style: const TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.italic,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAIChatCard(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Card(
        color: Colors.blue.shade50,
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue.shade600,
            child: const Icon(Icons.smart_toy_rounded,
                color: Colors.white, size: 30),
          ),
          title: const Text(
            'AI Chat Companion',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          subtitle:
          const Text('Chat casually with your supportive AI buddy!'),
          trailing: Icon(Icons.arrow_forward_ios_rounded,
              color: Colors.blue.shade700),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => AIChatScreen(user: user),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDashboardButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required VoidCallback onTap,
      }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 26),
      label: Text(label, style: const TextStyle(fontSize: 16)),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 60),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        shadowColor: Colors.blue.shade200,
        elevation: 6,
      ),
    );
  }

  String _getTodayAffirmation() {
    final affirmations = [
      "You are doing your best and that’s enough.",
      "You’re not alone, even when it feels like it.",
      "You’ve gotten through tough days before—you will again.",
      "Every small step forward is still progress.",
    ];
    return affirmations[DateTime.now().day % affirmations.length];
  }
}

