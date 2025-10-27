import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CareerCounselingScreen extends StatelessWidget {
  const CareerCounselingScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> careerResources = const [
    {
      'title': 'CareerOneStop',
      'subtitle': 'Explore careers, training, and job search tools',
      'url': 'https://www.careeronestop.org/',
      'icon': Icons.explore,
    },
    {
      'title': 'My Next Move',
      'subtitle': 'Find careers based on your interests and skills',
      'url': 'https://www.mynextmove.org/',
      'icon': Icons.psychology_alt,
    },
    {
      'title': 'Indeed Career Guide',
      'subtitle': 'Resume help, interview tips, and job listings',
      'url': 'https://www.indeed.com/career-advice',
      'icon': Icons.article,
    },
    {
      'title': 'LinkedIn Learning',
      'subtitle': 'Courses in tech, business, and creative fields',
      'url': 'https://www.linkedin.com/learning/',
      'icon': Icons.laptop_mac,
    },
    {
      'title': 'Pathful Explore',
      'subtitle': 'Career videos, planning tools, and mentorship',
      'url': 'https://explore.pathful.com/',
      'icon': Icons.movie_filter,
    },
    {
      'title': 'Apprenticeship.gov',
      'subtitle': 'Hands-on learning through apprenticeships',
      'url': 'https://www.apprenticeship.gov/',
      'icon': Icons.build,
    },
  ];

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
        title: const Text(
          '💼 Career & Job Training',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: careerResources.length,
        itemBuilder: (context, index) {
          final resource = careerResources[index];
          return GestureDetector(
            onTap: () => _launchURL(resource['url']),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.blueGrey[700],
                  child: Icon(resource['icon'], color: Colors.white, size: 28),
                ),
                title: Text(
                  resource['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  resource['subtitle'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
