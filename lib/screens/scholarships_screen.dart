import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScholarshipsScreen extends StatelessWidget {
  const ScholarshipsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> scholarshipResources = const [
    {
      'title': 'Fastweb',
      'subtitle': 'Personalized scholarship matches and college tips',
      'url': 'https://www.fastweb.com/',
      'icon': Icons.school,
    },
    {
      'title': 'Scholarships.com',
      'subtitle': 'Search over 3.7 million scholarships and grants',
      'url': 'https://www.scholarships.com/',
      'icon': Icons.search,
    },
    {
      'title': 'College Board: BigFuture',
      'subtitle': 'Scholarships and college planning all in one place',
      'url': 'https://bigfuture.collegeboard.org/scholarship-search',
      'icon': Icons.account_balance,
    },
    {
      'title': 'Going Merry',
      'subtitle': 'Bundled applications for scholarships and aid',
      'url': 'https://www.goingmerry.com/',
      'icon': Icons.attach_money,
    },
    {
      'title': 'Niche Scholarships',
      'subtitle': 'Browse awards by major, interest, and school',
      'url': 'https://www.niche.com/colleges/scholarships/',
      'icon': Icons.auto_stories,
    },
    {
      'title': 'Federal Student Aid (FAFSA)',
      'subtitle': 'Apply for federal financial aid for college',
      'url': 'https://studentaid.gov/',
      'icon': Icons.gavel,
    },
    {
      'title': 'UNIGO',
      'subtitle': 'Scholarships, college reviews, and financial tips',
      'url': 'https://www.unigo.com/',
      'icon': Icons.star_rate,
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
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '🎓 Scholarships & Financial Aid',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: scholarshipResources.length,
        itemBuilder: (context, index) {
          final resource = scholarshipResources[index];
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
                  backgroundColor: Colors.indigo[700],
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
                  color: Colors.indigo,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
