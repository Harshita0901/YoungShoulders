import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/mood_entry.dart';
import '../models/mood_data.dart';
import '../models/app_user.dart';
import '../models/user_storage.dart';

class ProgressScreen extends StatefulWidget {
  final AppUser user;
  const ProgressScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<MoodEntry> get moodEntries => MoodData().moodEntries;
  List<String> _journalHistory = [];
  final UserStorage _storage = UserStorage();

  @override
  void initState() {
    super.initState();
    _loadMoodData();
    _loadJournalHistory();
  }

  void _loadMoodData() async {
    await MoodData().loadData();
    setState(() {});
  }

  void _loadJournalHistory() async {
    final history = await _storage.getJournalHistory(user: widget.user);
    setState(() {
      _journalHistory = history;
    });
  }

  /// Build mood trend data for last 7 days
  List<FlSpot> _buildMoodTrend() {
    if (moodEntries.isEmpty) return [];
    Map<int, List<int>> dailyMoods = {};
    DateTime now = DateTime.now();

    for (var entry in moodEntries) {
      int dayDiff = now.difference(entry.dateTime).inDays;
      if (dayDiff < 7) {
        dailyMoods[6 - dayDiff] = (dailyMoods[6 - dayDiff] ?? [])..add(entry.moodLevel);
      }
    }

    return List.generate(7, (i) {
      if (dailyMoods[i] == null || dailyMoods[i]!.isEmpty) return FlSpot(i.toDouble(), 0);
      double avg = dailyMoods[i]!.reduce((a, b) => a + b) / dailyMoods[i]!.length;
      avg = avg < 0 ? 0 : avg; // clamp to 0 to prevent dips below zero
      return FlSpot(i.toDouble(), avg);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Your Emotional Trends',
            style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: 0.5)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: [
          _buildMoodLineChart(days),
          const SizedBox(height: 20),
          _buildMostCommonMoodPie(),
          const SizedBox(height: 20),
          _buildActivityCompletion(),
          const SizedBox(height: 20),
          _buildJournalPreview(),
        ],
      ),
    );
  }

  Widget _buildMoodLineChart(List<String> days) {
    final moodTrend = _buildMoodTrend();
    if (moodTrend.isEmpty) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text('No mood data available for this week.'),
        ),
      );
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Weekly Mood Overview",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 220,
              child: LineChart(
                LineChartData(
                  minX: 0,
                  maxX: 6,
                  minY: 0, // start y-axis at 0
                  maxY: 10,
                  clipData: FlClipData.all(), // prevent dips below zero
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    getDrawingHorizontalLine: (value) =>
                        FlLine(color: Colors.grey.shade300, strokeWidth: 1),
                    getDrawingVerticalLine: (value) =>
                        FlLine(color: Colors.grey.shade300, strokeWidth: 1),
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: (value, _) {
                          int index = value.toInt();
                          if (index < 0 || index >= days.length) return const Text('');
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(days[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12)),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 2,
                        getTitlesWidget: (value, _) => Text(
                          value.toInt().toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                      show: true, border: Border.all(color: Colors.grey.shade300)),
                  lineBarsData: [
                    LineChartBarData(
                      spots: moodTrend,
                      isCurved: true,
                      barWidth: 3,
                      color: Colors.deepPurple,
                      dotData: FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.deepPurple.withOpacity(0.2),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.deepPurple, Colors.purpleAccent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMostCommonMoodPie() {
    final moodCount = <String, int>{};
    for (var e in moodEntries) {
      moodCount[e.mood] = (moodCount[e.mood] ?? 0) + 1;
    }
    if (moodCount.isEmpty) return const SizedBox();

    final total = moodCount.values.reduce((a, b) => a + b);
    final sections = moodCount.entries.map((entry) {
      final percent = (entry.value / total) * 100;
      final color =
          Colors.primaries[entry.key.hashCode % Colors.primaries.length].shade400;
      return PieChartSectionData(
        value: percent,
        title: '${entry.key} ${(percent).toStringAsFixed(0)}%',
        color: color,
        radius: 60,
        titleStyle: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      );
    }).toList();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Mood Distribution",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            SizedBox(height: 200, child: PieChart(PieChartData(sections: sections))),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCompletion() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Activity Completion",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 8),
            Text("Calming games played this week: 4"),
            Text("Mood logging streak: 5 days"),
          ],
        ),
      ),
    );
  }

  Widget _buildJournalPreview() {
    if (_journalHistory.isEmpty) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: const Padding(
          padding: EdgeInsets.all(16),
          child: Text('No journal entries yet.'),
        ),
      );
    }
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Journal Preview",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ..._journalHistory.map((e) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text("- $e"),
            )),
          ],
        ),
      ),
    );
  }
}
