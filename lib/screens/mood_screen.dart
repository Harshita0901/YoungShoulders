import 'package:flutter/material.dart';
import 'arcade_screen.dart';
import '../models/mood_entry.dart';
import '../models/mood_data.dart';
import '../models/app_user.dart';

class MoodScreen extends StatefulWidget {
  final AppUser user;

  const MoodScreen({Key? key, required this.user}) : super(key: key);

  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  final List<Map<String, String>> moods = [
    {'label': 'Overwhelmed', 'emoji': '😣'},
    {'label': 'Hopeful', 'emoji': '🌤️'},
    {'label': 'Angry', 'emoji': '😡'},
    {'label': 'Content', 'emoji': '😊'},
    {'label': 'Tired', 'emoji': '😴'},
    {'label': 'Guilty', 'emoji': '😔'},
    {'label': 'Proud', 'emoji': '🏅'},
    {'label': 'Anxious', 'emoji': '😰'},
    {'label': 'Empty', 'emoji': '😶'},
    {'label': 'Peaceful', 'emoji': '🕊️'},
  ];

  final List<String> triggers = ['School', 'Family', 'Chores', 'Friends', 'Health'];

  String? selectedMood;
  String journalText = '';
  List<String> selectedTriggers = [];

  void _toggleTrigger(String trigger) {
    setState(() {
      if (selectedTriggers.contains(trigger)) {
        selectedTriggers.remove(trigger);
      } else {
        selectedTriggers.add(trigger);
      }
    });
  }

  void _saveMood() {
    if (selectedMood == null || journalText.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please choose a mood and fill the journal.')),
      );
      return;
    }

    // Map each mood to a numeric level
    int moodLevel;
    switch (selectedMood) {
      case 'Overwhelmed':
        moodLevel = 3;
        break;
      case 'Hopeful':
        moodLevel = 8;
        break;
      case 'Angry':
        moodLevel = 2;
        break;
      case 'Content':
        moodLevel = 7;
        break;
      case 'Tired':
        moodLevel = 4;
        break;
      case 'Guilty':
        moodLevel = 3;
        break;
      case 'Proud':
        moodLevel = 9;
        break;
      case 'Anxious':
        moodLevel = 4;
        break;
      case 'Empty':
        moodLevel = 2;
        break;
      case 'Peaceful':
        moodLevel = 8;
        break;
      default:
        moodLevel = 5;
    }

    final newMood = MoodEntry(
      mood: selectedMood!,
      moodLevel: moodLevel, // ✅ added this line
      dateTime: DateTime.now(),
      triggers: selectedTriggers,
      journal: journalText,
    );

    MoodData().addMood(newMood);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Mood saved! Redirecting to Arcade...')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArcadeScreen(mood: selectedMood!),
      ),
    );
  }


  String _getAffirmation() {
    final affirmations = [
      "Take a deep breath. You’re exactly where you need to be.",
      "You are doing your best, and that’s enough. 🌱",
      "Emotions come and go — you’re still in control.",
    ];
    return affirmations[DateTime.now().day % affirmations.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        title: Text(
          "How are you feeling? 🌈",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Affirmation Card
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                "“${_getAffirmation()}”",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),

          const SizedBox(height: 25),

          // Mood Selection
          const Text(
            "How are you feeling today?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),

          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: moods.map((m) {
              final isSelected = selectedMood == m['label'];
              return AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                child: ChoiceChip(
                  avatar: Text(m['emoji']!, style: const TextStyle(fontSize: 18)),
                  label: Text(m['label']!),
                  selected: isSelected,
                  onSelected: (_) => setState(() => selectedMood = m['label']),
                  backgroundColor: Colors.white,
                  selectedColor: Colors.deepPurple.shade400,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                  elevation: isSelected ? 6 : 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 30),

          // Journal Input
          const Text(
            "What’s on your mind?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: TextField(
              maxLines: 5,
              onChanged: (val) => journalText = val,
              decoration: const InputDecoration(
                hintText: "Write your thoughts here...",
                contentPadding: EdgeInsets.all(16),
                border: InputBorder.none,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Triggers Section
          const Text(
            "Any triggers you’d like to tag?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: triggers.map((trigger) {
              final isSelected = selectedTriggers.contains(trigger);
              return FilterChip(
                label: Text(trigger),
                selected: isSelected,
                onSelected: (_) => _toggleTrigger(trigger),
                backgroundColor: Colors.white,
                selectedColor: Colors.deepPurple.shade400,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                ),
                elevation: isSelected ? 5 : 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 40),

          // Save Button
          ElevatedButton.icon(
            onPressed: _saveMood,
            icon: const Icon(Icons.check_circle_outline, color: Colors.white),
            label: const Text(
              "Save & Continue",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 5,
            ),
          ),
        ],
      ),
    );
  }
}
