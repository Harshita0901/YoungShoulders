import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // for Clipboard
import 'package:url_launcher/url_launcher.dart';

class SupporterHelplinesScreen extends StatelessWidget {
  const SupporterHelplinesScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> helplines = const [
    {
      "name": "National Suicide Prevention Lifeline (US)",
      "number": "988",
      "description": "Call or text for confidential support 24/7."
    },
    {
      "name": "Crisis Text Line",
      "number": "741741",
      "description": "Text from anywhere in the US to connect with a trained counselor."
    },
    {
      "name": "Samaritans (UK & ROI)",
      "number": "116123",
      "description": "Call for confidential support."
    },
    {
      "name": "Teen Line",
      "number": "310-855-4673",
      "description": "Peer support for teens, call or text."
    },
    {
      "name": "Child Helpline International",
      "number": "+31 70 305 00 00",
      "description": "Global helpline directory for child & teen support."
    },
  ];

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
              leading: const Icon(Icons.phone_in_talk, color: Colors.teal, size: 40),
              title: Text(
                helpline["name"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              subtitle: Text(
                "${helpline["number"]!}\n${helpline["description"]!}",
                style: const TextStyle(color: Colors.grey),
              ),
              isThreeLine: true,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.call, color: Colors.teal),
                    onPressed: () async {
                      final url = "tel:${helpline["number"]}";
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url));
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.copy, color: Colors.deepPurple),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: helpline["number"]!));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('${helpline["number"]} copied to clipboard')),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
