import 'package:flutter/material.dart';
import 'supporter_map_screen.dart';

class SupporterSymptomResultScreen extends StatelessWidget {
  final String possibleCondition;
  final String suggestedPlaceType;

  const SupporterSymptomResultScreen({
    Key? key,
    required this.possibleCondition,
    required this.suggestedPlaceType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Map search URL (for mocked Insomnia)
    final String mapUrl =
        "https://www.google.com/maps/search/${Uri.encodeComponent('sleep clinics or insomnia specialists')}+near+me";

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Symptom Analysis Result'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Condition name
            Text(
              'Insomnia',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 20),

            // Description paragraph
            const Text(
              "Insomnia is a sleep disorder that makes it difficult to fall asleep, stay asleep, "
                  "or get good-quality rest. Teens experiencing insomnia may feel tired during the day, "
                  "have trouble focusing in school, or experience mood changes such as irritability or anxiety. "
                  "Lifestyle habits, stress, and screen time can often worsen sleep difficulties. "
                  "Building a consistent bedtime routine, limiting caffeine, and avoiding screens before bed can help.",
              style: TextStyle(fontSize: 16, height: 1.5),
              textAlign: TextAlign.justify,
            ),

            const SizedBox(height: 24),

            // Severity / healthline info
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.deepPurple.shade100),
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.deepPurple),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "This condition is generally not an emergency. However, if symptoms persist for more than two weeks "
                          "or begin to affect daily life, consider contacting a healthcare professional.\n\n"
                          "📞 For immediate support or guidance: Call the National Sleep Foundation Helpline at 1-800-642-6434.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.deepPurple.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 36),

            // Map redirect button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SupporterMapScreen(url: mapUrl),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.map_outlined, color: Colors.white),
              label: const Text(
                "Find Nearby Sleep Clinics",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
