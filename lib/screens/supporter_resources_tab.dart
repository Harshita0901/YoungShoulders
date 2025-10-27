import 'package:flutter/material.dart';
import 'supporter_disorders_screen.dart';
import 'supporter_support_techniques_screen.dart';
import 'supporter_helplines_screen.dart';
import 'supporter_multimedia_screen.dart';

class SupporterResourcesTab extends StatelessWidget {
  const SupporterResourcesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources Hub'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            ResourceCard(
              title: "Disorder Library 🧠",
              description: "Detailed info on Depression, Anxiety, PTSD, Bipolar, and more.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupporterDisordersScreen(),
                  ),
                );
              },
            ),
            ResourceCard(
              title: "Support Techniques ❤️",
              description: "Guides for conversations, crisis handling, and setting boundaries.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupporterTechniquesScreen(),
                  ),
                );
              },
            ),
            ResourceCard(
              title: "Helplines & Emergency Contacts ☎️",
              description: "Global and local hotlines, text helplines, chat links.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupporterHelplinesScreen(),
                  ),
                );
              },
            ),
            ResourceCard(
              title: "Multimedia Hub 🎥",
              description: "Curated videos, podcasts, and research articles for supporters.",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SupporterMultimediaScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ResourceCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const ResourceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
