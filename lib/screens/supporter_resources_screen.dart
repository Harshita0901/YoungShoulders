import 'package:flutter/material.dart';
import 'supporter_disorders_screen.dart';
import 'supporter_support_techniques_screen.dart';
import 'supporter_helplines_screen.dart';
import 'supporter_multimedia_screen.dart';
import 'supporter_research_articles_screen.dart';

class SupporterResourcesScreen extends StatelessWidget {
  const SupporterResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources Hub'),
        backgroundColor: Colors.deepPurple,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text(
                'Explore resources to support teens:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
              ),
              const SizedBox(height: 20),

              // Disorder Library
              ResourceCard(
                title: 'Disorder Library 🧠',
                description:
                'Learn about depression, anxiety, PTSD, bipolar, ADHD, and more.',
                icon: Icons.psychology,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SupporterDisorderLibraryScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Support Techniques
              ResourceCard(
                title: 'Support Techniques ❤️',
                description:
                'Practical guides on conversations, crisis handling, and boundaries.',
                icon: Icons.volunteer_activism,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SupporterTechniquesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Helplines & Emergency Contacts
              ResourceCard(
                title: 'Helplines & Contacts ☎️',
                description:
                'Quick access to national & local teen helplines and emergency numbers.',
                icon: Icons.phone,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SupporterHelplinesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Multimedia Hub
              ResourceCard(
                title: 'Multimedia Hub 🎥',
                description:
                'Videos, podcasts, and articles to understand teen mental health.',
                icon: Icons.video_library,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SupporterMultimediaScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),

              // Research Articles
              ResourceCard(
                title: 'Research Articles 📖',
                description: 'Simplified summaries of teen mental health studies.',
                icon: Icons.article,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SupporterResearchArticlesScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

// Generic Resource Card Widget
class ResourceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const ResourceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(12),
              child: Icon(icon, size: 36, color: Colors.deepPurple),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
          ],
        ),
      ),
    );
  }
}
