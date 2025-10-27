class MoodEntry {
  final String mood; // e.g. "Happy"
  final int moodLevel; // e.g. 8
  final DateTime dateTime;
  final List<String> triggers;
  final String journal;

  MoodEntry({
    required this.mood,
    required this.moodLevel, // <-- new field
    DateTime? dateTime,
    this.triggers = const [],
    this.journal = '',
  }) : dateTime = dateTime ?? DateTime.now();
}
