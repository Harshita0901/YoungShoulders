import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HealthcareScreen extends StatelessWidget {
  const HealthcareScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> healthcareResources = const [
    {
      'title': 'Planned Parenthood',
      'subtitle': 'Reproductive & sexual health',
      'website': 'https://www.plannedparenthood.org/',
      'phone': '1-800-230-7526',
      'icon': Icons.favorite,
      'color': Colors.pink
    },
    {
      'title': 'Teen Health Clinic Finder',
      'subtitle': 'Find a clinic near you',
      'website': 'https://findahealthcenter.hrsa.gov/',
      'phone': '',
      'icon': Icons.location_on,
      'color': Colors.blue
    },
    {
      'title': '988 Suicide & Crisis Lifeline',
      'subtitle': 'Mental health emergencies (24/7)',
      'website': 'https://988lifeline.org/',
      'phone': '988',
      'icon': Icons.support,
      'color': Colors.deepPurple
    },
    {
      'title': 'CDC Teen Health',
      'subtitle': 'Reliable health info for teens',
      'website': 'https://www.cdc.gov/teenhealth/index.htm',
      'phone': '',
      'icon': Icons.health_and_safety,
      'color': Colors.green
    },
    {
      'title': 'Local Health Department',
      'subtitle': 'Vaccines, screenings, resources',
      'website': 'https://www.naccho.org/membership/lhd-directory',
      'phone': '',
      'icon': Icons.local_hospital,
      'color': Colors.orange
    },
  ];

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch $url');
    }
  }

  void _launchPhone(String phone) async {
    final uri = Uri.parse('tel:$phone');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      debugPrint('Could not launch phone number $phone');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('🏥 Access to Healthcare'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFEBEE), Color(0xFFFFCDD2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: healthcareResources.length,
            itemBuilder: (context, index) {
              final resource = healthcareResources[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                shadowColor: resource['color'].withOpacity(0.4),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: resource['color'].withOpacity(0.8),
                    child: Icon(resource['icon'], color: Colors.white),
                  ),
                  title: Text(
                    resource['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(resource['subtitle']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if ((resource['phone'] as String).isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.phone, color: Colors.green),
                          onPressed: () => _launchPhone(resource['phone']),
                        ),
                      if ((resource['website'] as String).isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.launch, color: Colors.blue),
                          onPressed: () => _launchURL(resource['website']),
                        ),
                    ],
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
