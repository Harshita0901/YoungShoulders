import 'package:flutter/material.dart';

class SupporterTechniquesScreen extends StatelessWidget {
  const SupporterTechniquesScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> techniques = const [
    {
      "title": "Active Listening",
      "description":
      "Active listening means being fully present when a teen is sharing their thoughts or emotions. Instead of focusing on how to respond, focus on truly hearing what they are saying — both verbally and nonverbally. Maintain eye contact, nod gently, and let them know you are paying attention. This helps them feel valued and understood, which builds trust and encourages open communication.",
      "example":
      "Example: When a teen says, 'I feel like no one understands me,' respond with empathy rather than advice. You might say, 'It sounds like you’re feeling really alone right now. That must be hard.' Avoid interrupting or rushing to fix the problem — sometimes, your presence and understanding are enough."
    },
    {
      "title": "Crisis Handling",
      "description":
      "Crisis handling involves recognizing warning signs that a teen may be in emotional or physical danger — such as sudden withdrawal, talk of hopelessness, or risky behavior — and knowing how to respond calmly and effectively. The key is to stay grounded, offer reassurance, and seek help from professionals when necessary. Creating a sense of safety can make a huge difference during overwhelming moments.",
      "example":
      "Example: If a teen expresses thoughts of self-harm, stay with them, speak calmly, and say something like, 'I’m really glad you told me this. You’re not alone — let’s reach out for help together.' Avoid minimizing their feelings or showing panic. Contact a trusted adult, counselor, or crisis line if immediate support is needed."
    },
    {
      "title": "Setting Boundaries",
      "description":
      "Setting boundaries is about finding a healthy balance between being supportive and allowing the teen to grow independently. Supporters should respect personal space and emotional privacy while making sure communication lines remain open. Healthy boundaries teach responsibility, trust, and respect on both sides, helping the relationship stay positive and sustainable.",
      "example":
      "Example: You can say, 'I’m always here to listen, but I also respect that you might need some time alone to think things through.' Avoid becoming overly controlling or trying to solve every problem for them. Offer guidance when asked and show that you trust them to make choices — even if they make mistakes along the way."
    },
    {
      "title": "Encouraging Expression",
      "description":
      "Many teens struggle to put their feelings into words, especially when dealing with stress or emotional pain. Encouraging self-expression through conversation, art, writing, or physical activity helps them process emotions in healthy ways. Create a safe environment where they can express themselves without fear of judgment or dismissal.",
      "example":
      "Example: You might say, 'If it’s hard to talk about it, maybe you could write or draw how you feel — sometimes that helps.' Offer them outlets like journaling, painting, or listening to music. Avoid telling them how they should feel; instead, validate their emotions and let them know it’s okay to express them freely."
    },
    {
      "title": "Positive Reinforcement",
      "description":
      "Positive reinforcement focuses on acknowledging a teen’s strengths, growth, and healthy coping efforts. Instead of only addressing mistakes, notice the small wins and the times they show courage or self-awareness. Genuine praise can build confidence and resilience, reminding them that progress — not perfection — is what matters most.",
      "example":
      "Example: Say something like, 'I’m proud of how you talked about your feelings instead of keeping them bottled up — that took courage.' Recognize effort, not just outcomes. Avoid generic compliments like 'Good job'; instead, be specific and sincere about what you appreciate in their behavior or attitude."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Support Techniques"),
        backgroundColor: Colors.deepPurple,
        elevation: 2,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: techniques.length,
        itemBuilder: (context, index) {
          final tech = techniques[index];
          return TechniqueCard(
            title: tech["title"]!,
            description: tech["description"]!,
            example: tech["example"]!,
          );
        },
      ),
    );
  }
}

class TechniqueCard extends StatelessWidget {
  final String title;
  final String description;
  final String example;

  const TechniqueCard({
    Key? key,
    required this.title,
    required this.description,
    required this.example,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 5,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        iconColor: Colors.teal[700],
        collapsedIconColor: Colors.teal[700],
        title: Row(
          children: [
            Icon(Icons.psychology, color: Colors.deepPurple),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal[700])),
                const SizedBox(height: 4),
                Text(description, style: const TextStyle(fontSize: 15, height: 1.4)),
                const SizedBox(height: 12),
                Text("Example Tips:",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.teal[700])),
                const SizedBox(height: 4),
                Text(example, style: const TextStyle(fontSize: 15, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
