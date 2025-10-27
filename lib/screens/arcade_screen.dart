import 'package:flutter/material.dart';
import 'mood_game_screen.dart';
import 'joke_corner_screen.dart';
import 'breathing_screen.dart';
import 'reframe_thought_screen.dart';
import 'mood_songs_screen.dart';


class ArcadeScreen extends StatelessWidget {
  final String mood;

  ArcadeScreen({required this.mood});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coping for \"$mood\""),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildCard(
            context,
            title: "🎮 Game for this Mood",
            subtitle: "Tap to Smash Stress",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoodGameScreen(mood: mood),
                ),
              );
            },
          ),

          _buildCard(
            context,
            title: "🧘 Breathing Tool",
            subtitle: "Try 4-7-8 breathing",
            onTap: () {
              Navigator.pushNamed(context, '/breathing');
            },
          ),
          _buildCard(
            context,
            title: "😂 Joke Corner",
            subtitle: "Lighten up with jokes in your language",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => JokeCornerScreen(mood: mood),
                ),
              );
            },
          ),
          _buildCard(
            context,
            title: "🧠 Reframe This Thought",
            subtitle: "Challenge a negative thought",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReframeThoughtScreen(),
                ),
              );
            },
          ),
          _buildCard(
            context,
            title: "🎵 Mood Songs",
            subtitle: "Listen to songs for your mood",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MoodSongsScreen(mood: mood),
                ),
              );
            },
          ),
        ], // End of children list
      ),
    );
  }


  Widget _buildCard(BuildContext context,
      {required String title,
        required String subtitle,
        required VoidCallback onTap}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }
}
