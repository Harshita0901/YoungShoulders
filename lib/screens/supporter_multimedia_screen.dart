import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupporterMultimediaScreen extends StatelessWidget {
  const SupporterMultimediaScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> multimediaItems = const [
    {
      "title": "Empathy vs. Sympathy",
      "type": "Video",
      "url": "https://www.youtube.com/watch?v=cByRM-xQ_oc"
    },
    {
      "title": "The Science of Burnout",
      "type": "Podcast",
      "url": "https://www.example.com/podcast1"
    },
    {
      "title": "Helping Teens Handle Stress",
      "type": "Video",
      "url": "https://www.youtube.com/watch?v=CONWTRDILN0"
    },
    {
      "title": "Mindfulness Techniques for Supporters",
      "type": "Podcast",
      "url": "https://www.example.com/podcast2"
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
        title: const Text("Multimedia Hub"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: multimediaItems.length,
        itemBuilder: (context, index) {
          final item = multimediaItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            child: ListTile(
              leading: Icon(
                item["type"] == "Video" ? Icons.play_circle_fill : Icons.podcasts,
                color: Colors.teal,
                size: 40,
              ),
              title: Text(
                item["title"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              subtitle: Text(item["type"]!),
              trailing: const Icon(Icons.open_in_new, color: Colors.deepPurple),
              onTap: () => _launchURL(item["url"]!),
            ),
          );
        },
      ),
    );
  }
}
