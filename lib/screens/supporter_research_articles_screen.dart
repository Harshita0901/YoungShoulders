import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupporterResearchArticlesScreen extends StatelessWidget {
  const SupporterResearchArticlesScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> articles = const [
    {
      "title": "Adolescent Mental Health in the Digital Age",
      "summary":
      "An in-depth analysis of how online environments shape emotional well-being and resilience in teens.",
      "url": "https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9089744/",
      "image": "https://img.freepik.com/free-vector/mental-health-concept_23-2148526616.jpg"
    },
    {
      "title": "Sleep, Stress, and Emotional Balance in Youth",
      "summary":
      "A recent study linking irregular sleep patterns to hormonal imbalances and stress sensitivity in adolescents.",
      "url": "https://www.frontiersin.org/articles/10.3389/fpsyt.2023.1122334/full",
      "image": "https://img.freepik.com/free-vector/young-girl-sleeping-peacefully_74855-5556.jpg"
    },
    {
      "title": "Social Media Use and Teen Anxiety",
      "summary":
      "Examines the relationship between screen time, online validation, and increased anxiety levels among high school students.",
      "url": "https://jamanetwork.com/journals/jamapediatrics/fullarticle/2796750",
      "image": "https://www.nampaimagine.com/wp-content/uploads/2023/08/How-Does-Social-Media-Affect-Teens-1024x683.jpg"
    },
    {
      "title": "Resilience Training for Adolescents",
      "summary":
      "Highlights the effectiveness of school-based mindfulness and CBT interventions for improving self-esteem.",
      "url": "https://www.health.harvard.edu/blog/resilience-5-ways-to-help-children-and-teens-learn-it-202202242694",
      "image": "https://img.freepik.com/free-vector/teenagers-practicing-yoga_23-2148527771.jpg"
    },
  ];

  Future<void> _openArticle(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Research Articles",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
        shadowColor: Colors.deepPurpleAccent.withOpacity(0.4),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return GestureDetector(
            onTap: () => _openArticle(article["url"]!),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header image
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.network(
                      article["image"]!,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Article content
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article["title"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          article["summary"]!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(Icons.open_in_new, color: Colors.deepPurple, size: 18),
                            const SizedBox(width: 6),
                            Text(
                              "Read full article",
                              style: TextStyle(
                                color: Colors.deepPurple[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
