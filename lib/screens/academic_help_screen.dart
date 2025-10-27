import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AcademicHelpScreen extends StatelessWidget {
  const AcademicHelpScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> academicResources = const [
    {
      'title': 'Khan Academy',
      'subtitle': 'Free lessons & practice for all subjects',
      'url': 'https://www.khanacademy.org/',
      'icon': Icons.school,
      'color': Colors.blue
    },
    {
      'title': 'Quizlet',
      'subtitle': 'Flashcards & study guides',
      'url': 'https://quizlet.com/',
      'icon': Icons.flash_on,
      'color': Colors.orange
    },
    {
      'title': 'Local Library Tutoring',
      'subtitle': 'Search for free local tutoring near you',
      'url': 'https://www.publiclibraries.com/',
      'icon': Icons.location_city,
      'color': Colors.green
    },
    {
      'title': 'CollegeVine',
      'subtitle': 'Free peer tutoring and college prep',
      'url': 'https://www.collegevine.com/',
      'icon': Icons.groups,
      'color': Colors.purple
    },
    {
      'title': 'Brainscape',
      'subtitle': 'Smart flashcards for fast learning',
      'url': 'https://www.brainscape.com/',
      'icon': Icons.lightbulb,
      'color': Colors.teal
    },
    {
      'title': 'Duolingo',
      'subtitle': 'Language learning made fun',
      'url': 'https://www.duolingo.com/',
      'icon': Icons.translate,
      'color': Colors.red
    },
  ];

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('📚 Academic Help'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F7FA), Color(0xFFB2EBF2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            itemCount: academicResources.length,
            itemBuilder: (context, index) {
              final resource = academicResources[index];

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: InkWell(
                  onTap: () => _launchURL(resource['url']),
                  borderRadius: BorderRadius.circular(20),
                  splashColor: Colors.white.withOpacity(0.3),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          (resource['color'] as Color).withOpacity(0.8),
                          (resource['color'] as Color).withOpacity(0.6)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: Icon(
                          resource['icon'],
                          color: resource['color'],
                          size: 28,
                        ),
                      ),
                      title: Text(
                        resource['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        resource['subtitle'],
                        style: const TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white70, size: 18),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
