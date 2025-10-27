import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CounselingScreen extends StatelessWidget {
  const CounselingScreen({Key? key}) : super(key: key);

  // Launch phone number or web URL
  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: const Text(
          'Counseling & Mental Health 💜',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
        children: [
          // Header
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "“It’s okay to ask for help — you’re not alone.”",
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Here are trusted counseling and mental health resources for you 💫",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),
          _sectionTitle("🧠 Public Support & Counselors"),
          _buildTile(
            label: "School Counselor Hotline",
            subtitle: "Reach out at your school if you’re comfortable",
            icon: Icons.school_rounded,
            color: Colors.purpleAccent,
            onTap: () {},
          ),
          _buildTile(
            label: "Boys Town National Hotline",
            subtitle: "24/7 teen & parent support",
            icon: Icons.phone_in_talk_rounded,
            color: Colors.greenAccent,
            onTap: () => _launch("tel:8004483000"),
          ),

          const SizedBox(height: 24),
          _sectionTitle("📞 Crisis & Specialized Help Lines"),
          _buildTile(
            label: "988 Suicide & Crisis Lifeline",
            subtitle: "Call or text 988 (available 24/7)",
            icon: Icons.sentiment_dissatisfied_rounded,
            color: Colors.redAccent,
            onTap: () => _launch("tel:988"),
          ),
          _buildTile(
            label: "Teen Line (peer support)",
            subtitle: "Call 800-852-8336 or text “TEEN” to 839863 (6–10pm PST)",
            icon: Icons.chat_rounded,
            color: Colors.blueAccent,
            onTap: () => _launch("tel:8008528336"),
          ),
          _buildTile(
            label: "NAMI Teen & Young Adult HelpLine",
            subtitle: "Text “NAMI” to 62640 or call 1-800-950-6264",
            icon: Icons.support_agent_rounded,
            color: Colors.tealAccent,
            onTap: () => _launch("tel:8009506264"),
          ),
          _buildTile(
            label: "Crisis Text Line",
            subtitle: "Text HOME to 741741 → chat with a counselor",
            icon: Icons.message_rounded,
            color: Colors.orangeAccent,
            onTap: () {},
          ),

          const SizedBox(height: 24),
          _sectionTitle("📚 Additional Community Resources"),
          _buildTile(
            label: "SAMHSA National Helpline",
            subtitle: "1-800-662-HELP (4357) for referrals and treatment info",
            icon: Icons.info_rounded,
            color: Colors.pinkAccent,
            onTap: () => _launch("tel:18006624357"),
          ),
          _buildTile(
            label: "National Eating Disorders Association",
            subtitle: "Helpline: 1-800-931-2237",
            icon: Icons.restaurant_rounded,
            color: Colors.lightBlueAccent,
            onTap: () => _launch("tel:18009312237"),
          ),
          _buildTile(
            label: "Runaway Safe-line",
            subtitle: "1-800-786-2929 (RUNAWAY)",
            icon: Icons.home_rounded,
            color: Colors.amberAccent,
            onTap: () => _launch("tel:18007862929"),
          ),
        ],
      ),
    );
  }

  Widget _buildTile({
    required String label,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.deepPurple.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 13.5,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded, color: Colors.deepPurple, size: 18),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
