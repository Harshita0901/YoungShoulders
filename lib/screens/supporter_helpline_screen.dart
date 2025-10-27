import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupporterHelplinesScreen extends StatelessWidget {
  const SupporterHelplinesScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> helplines = const [
    {
      "name": "National Suicide Prevention Lifeline (US)",
      "contact": "1-800-273-8255",
      "url": "tel:18002738255"
    },
    {
      "name": "Crisis Text Line (US)",
      "contact": "Text HOME to 741741",
      "url": "sms:741741"
    },
    {
      "name": "Samaritans (UK)",
      "contact": "116 123",
      "url": "tel:116123"
    },
    {
      "name": "Lifeline Australia",
      "contact": "13 11 14",
      "url": "tel:131114"
    },
    {
      "name": "Teen Line (US)",
      "contact": "310-855-4673",
      "url": "tel:3108554673"
    },
  ];

  Future<void> _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Helplines & Emergency Contacts"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: helplines.length,
        itemBuilder: (context, index) {
          final helpline = helplines[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ListTile(
              title: Text(
                helpline["name"]!,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
              ),
              subtitle: Text(helpline["contact"]!),
              trailing: IconButton(
                icon: const Icon(Icons.phone, color: Colors.teal),
                onPressed: () => _launchURL(helpline["url"]!),
              ),
              onTap: () => _launchURL(helpline["url"]!),
            ),
          );
        },
      ),
    );
  }
}
