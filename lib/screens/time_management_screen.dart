import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TimeManagementScreen extends StatelessWidget {
  const TimeManagementScreen({Key? key}) : super(key: key);

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "⏰ Time Mastery",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFE0B2), Color(0xFFFFF3E0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 24),
          children: [
            // 🌈 Motivational Quote Banner
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orangeAccent.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.orange.withOpacity(0.4),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                "“Don’t watch the clock; do what it does — keep going.” 🕒",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),

            _buildSectionHeader("🎯 Master Your Time"),
            _buildTile(
              title: "Pomodoro Technique",
              subtitle: "Stay sharp with 25-minute focus blocks",
              icon: Icons.timer_outlined,
              color: Colors.redAccent,
              onTap: () => _launch("https://todoist.com/productivity-methods/pomodoro-technique"),
            ),
            _buildTile(
              title: "Eisenhower Matrix",
              subtitle: "Decide what truly deserves your energy",
              icon: Icons.dashboard_customize_outlined,
              color: Colors.deepPurpleAccent,
              onTap: () => _launch("https://www.eisenhower.me/eisenhower-matrix/"),
            ),
            _buildTile(
              title: "Time Blocking",
              subtitle: "Plan your day — every hour counts",
              icon: Icons.calendar_today_outlined,
              color: Colors.teal,
              onTap: () => _launch("https://clockify.me/time-blocking"),
            ),

            const SizedBox(height: 25),
            _buildSectionHeader("📚 Organize Your Study Life"),
            _buildTile(
              title: "Google Calendar Tips",
              subtitle: "Visualize your goals daily",
              icon: Icons.event_available,
              color: Colors.blueAccent,
              onTap: () => _launch("https://support.google.com/calendar/answer/2465776?hl=en"),
            ),
            _buildTile(
              title: "Notion for Students",
              subtitle: "Plan. Journal. Reflect.",
              icon: Icons.school_outlined,
              color: Colors.deepOrangeAccent,
              onTap: () => _launch("https://www.notion.so/students"),
            ),
            _buildTile(
              title: "MyStudyLife App",
              subtitle: "Track your exams and tasks with ease",
              icon: Icons.task_alt_outlined,
              color: Colors.green,
              onTap: () => _launch("https://www.mystudylife.com/"),
            ),

            const SizedBox(height: 25),
            _buildSectionHeader("🧘 Healthy Balance & Focus"),
            _buildTile(
              title: "Avoid Burnout",
              subtitle: "Small breaks = big progress",
              icon: Icons.self_improvement_outlined,
              color: Colors.pinkAccent,
              onTap: () => _launch("https://www.skillsyouneed.com/ps/stress-tips.html"),
            ),
            _buildTile(
              title: "Digital Detox Tips",
              subtitle: "Reclaim your focus & free time",
              icon: Icons.phone_android_outlined,
              color: Colors.indigoAccent,
              onTap: () => _launch("https://www.psychologytoday.com/us/blog/tech-happy-life/202001/8-ways-take-digital-detox"),
            ),
            _buildTile(
              title: "Sleep & Productivity",
              subtitle: "Rest smarter, not longer 😴",
              icon: Icons.nightlight_round,
              color: Colors.deepPurple,
              onTap: () => _launch("https://www.sleepfoundation.org/how-sleep-works/sleep-and-productivity"),
            ),

            const SizedBox(height: 40),
            Center(
              child: Text(
                "✨ You’ve got this — small habits build big futures!",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.orange[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildTile({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 26),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.black54)),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
        onTap: onTap,
      ),
    );
  }
}
