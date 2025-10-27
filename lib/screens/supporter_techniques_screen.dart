import 'package:flutter/material.dart';

class SupporterTechniquesScreen extends StatelessWidget {
  const SupporterTechniquesScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> techniques = const [
    {
      "title": "Talking to a Withdrawn Teen",
      "description": "Learn how to approach teens who shut down, with empathy and patience."
    },
    {
      "title": "Setting Boundaries",
      "description": "Practical tips on respecting your teen's privacy while staying supportive."
    },
    {
      "title": "Handling Crisis Situations",
      "description": "Steps to respond effectively during high-stress or emergency moments."
    },
    {
      "title": "Active Listening Skills",
      "description": "Techniques to make your teen feel heard without judgment."
    },
    {
      "title": "Encouraging Positive Habits",
      "description": "Guidance on fostering healthy routines and coping strategies."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support Techniques"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: techniques.length,
        itemBuilder: (context, index) {
          final technique = techniques[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ListTile(
              leading: const Icon(Icons.handshake, color: Colors.teal, size: 40),
              title: Text(
                technique["title"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              subtitle: Text(
                technique["description"]!,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
              onTap: () {
                // Placeholder: Could open detailed guide page later
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on "${technique["title"]!}"')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
