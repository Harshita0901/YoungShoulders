import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'mood_entry.dart';

class MoodData {
  static final MoodData _instance = MoodData._internal();
  factory MoodData() => _instance;
  MoodData._internal();

  List<MoodEntry> moodEntries = [];

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('mood_entries');

    if (stored != null && stored.isNotEmpty) {
      moodEntries = stored.map((e) {
        final data = jsonDecode(e);
        return MoodEntry(
          mood: data['mood'],
          moodLevel: data['moodLevel'],
          dateTime: DateTime.parse(data['dateTime']),
          triggers: List<String>.from(data['triggers']),
          journal: data['journal'],
        );
      }).toList();
    } else {
      // Add fake sample data if no stored data exists
      moodEntries = _generateFakeData();
      await saveData();
    }
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = moodEntries.map((e) => jsonEncode({
      'mood': e.mood,
      'moodLevel': e.moodLevel,
      'dateTime': e.dateTime.toIso8601String(),
      'triggers': e.triggers,
      'journal': e.journal,
    })).toList();
    await prefs.setStringList('mood_entries', encoded);
  }

  void addMood(MoodEntry entry) async {
    moodEntries.add(entry);
    await saveData();
  }

  List<MoodEntry> _generateFakeData() {
    final now = DateTime.now();
    return [
      MoodEntry(mood: 'Peaceful', moodLevel: 8, dateTime: now.subtract(const Duration(days: 6)), triggers: ['Family'], journal: 'Had a relaxing morning.'),
      MoodEntry(mood: 'Hopeful', moodLevel: 7, dateTime: now.subtract(const Duration(days: 5)), triggers: ['Friends'], journal: 'Excited for the weekend!'),
      MoodEntry(mood: 'Anxious', moodLevel: 4, dateTime: now.subtract(const Duration(days: 4)), triggers: ['School'], journal: 'Had a stressful test.'),
      MoodEntry(mood: 'Content', moodLevel: 7, dateTime: now.subtract(const Duration(days: 3)), triggers: ['Health'], journal: 'Felt proud after my workout.'),
      MoodEntry(mood: 'Tired', moodLevel: 5, dateTime: now.subtract(const Duration(days: 2)), triggers: ['Chores'], journal: 'Did a lot of cleaning today.'),
      MoodEntry(mood: 'Proud', moodLevel: 9, dateTime: now.subtract(const Duration(days: 1)), triggers: ['School'], journal: 'Finished my project early!'),
      MoodEntry(mood: 'Peaceful', moodLevel: 8, dateTime: now, triggers: ['Family'], journal: 'Watched a movie and relaxed.'),
    ];
  }
}
