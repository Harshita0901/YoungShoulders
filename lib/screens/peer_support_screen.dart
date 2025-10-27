import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PeerSupportScreen extends StatelessWidget {
  const PeerSupportScreen({Key? key}) : super(key: key);

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
      // Subtle background gradient for warmth
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F2F1), Color(0xFFB2DFDB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.teal,
              floating: true,
              pinned: true,
              expandedHeight: 160,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: const EdgeInsets.only(left: 16, bottom: 12),
                title: const Text(
                  "Peer Support Groups",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF009688), Color(0xFF00796B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "You’re not alone. Connect, share, and grow with others who understand. 💚",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                              offset: Offset(1, 1),
                              blurRadius: 4,
                              color: Colors.black26,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Main content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle("👥 Peer-Led Support Communities"),
                    _buildTile(
                      label: "7 Cups Teen Community",
                      subtitle: "Chat with trained teen listeners anonymously",
                      icon: Icons.forum,
                      onTap: () => _launch("https://www.7cups.com/?utm_source=chatgpt"),
                    ),
                    _buildTile(
                      label: "Supportiv (Anonymous Group Chats)",
                      subtitle: "Vent, get support, or chat by topic",
                      icon: Icons.group,
                      onTap: () => _launch("https://www.supportiv.com/?utm_source=chatgpt"),
                    ),
                    _buildTile(
                      label: "TeenMentalHealth.org Forum",
                      subtitle: "Join conversations with other teens",
                      icon: Icons.forum_outlined,
                      onTap: () => _launch("https://teenmentalhealth.org/?utm_source=chatgpt"),
                    ),
                    const SizedBox(height: 28),

                    _buildSectionTitle("🏫 School & Local Peer Groups"),
                    _buildTile(
                      label: "Peer Listening Club",
                      subtitle: "Check if your school has peer mentoring clubs",
                      icon: Icons.school,
                      onTap: () {},
                    ),
                    _buildTile(
                      label: "Teen-to-Teen Hotline (Lines for Life)",
                      subtitle: "Teens helping teens: 877-968-8491 or text TEEN to 839863",
                      icon: Icons.phone,
                      onTap: () => _launch("tel:8779688491"),
                    ),
                    const SizedBox(height: 28),

                    _buildSectionTitle("💬 Safe Online Teen Spaces"),
                    _buildTile(
                      label: "Reddit: r/teenagers",
                      subtitle: "Huge teen-led community (be mindful of internet safety)",
                      icon: Icons.reddit,
                      onTap: () => _launch("https://www.reddit.com/r/teenagers/?utm_source=chatgpt"),
                    ),
                    _buildTile(
                      label: "Discord Servers for Teens",
                      subtitle: "Mental health-focused verified teen-only spaces",
                      icon: Icons.discord,
                      onTap: () => _launch("https://discord.com/?utm_source=chatgpt"),
                    ),
                    _buildTile(
                      label: "NotOK App (Peer Alert Tool)",
                      subtitle: "Tap to alert a support buddy when you’re not okay",
                      icon: Icons.warning_amber,
                      onTap: () => _launch("https://www.notokapp.com/?utm_source=chatgpt"),
                    ),
                    const SizedBox(height: 24),

                    // Gentle footer
                    Center(
                      child: Text(
                        "✨ Remember: Reaching out is strength, not weakness.",
                        style: TextStyle(
                          color: Colors.teal[800],
                          fontWeight: FontWeight.w600,
                          fontSize: 14.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section Header Widget
  Widget _buildSectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF004D40),
        ),
      ),
    );
  }

  // Modernized card design
  Widget _buildTile({
    required String label,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.teal[100],
            child: Icon(icon, color: Colors.teal[800]),
          ),
          title: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(fontSize: 13.5, color: Colors.black87),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.teal),
        ),
      ),
    );
  }
}
