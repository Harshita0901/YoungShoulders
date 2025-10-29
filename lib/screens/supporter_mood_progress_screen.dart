import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SupporterMoodProgressScreen extends StatefulWidget {
  const SupporterMoodProgressScreen({Key? key}) : super(key: key);

  @override
  _SupporterMoodProgressScreenState createState() =>
      _SupporterMoodProgressScreenState();
}

class _SupporterMoodProgressScreenState
    extends State<SupporterMoodProgressScreen> {
  /// Mock mood data for the last 7 days
  List<FlSpot> _getMoodTrend() {
    return [
      FlSpot(0, 5),
      FlSpot(1, 6),
      FlSpot(2, 4),
      FlSpot(3, 7),
      FlSpot(4, 6),
      FlSpot(5, 8),
      FlSpot(6, 7),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final moodTrend = _getMoodTrend();
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Teen Mood Progress"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Weekly Mood Overview",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 6,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 10,
                      clipData: FlClipData.all(),
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
                              if (index < 0 || index >= days.length)
                                return const Text('');
                              return Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  days[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
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
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
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
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Summary: Harshita's mood fluctuated through the week but improved toward the weekend. Keep encouraging healthy habits!",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 12),
            Chip(
              backgroundColor: Colors.deepPurple.shade50,
              avatar: const Icon(Icons.mood, color: Colors.deepPurple),
              label: const Text(
                "Tip: Celebrate small wins and positive habits!",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
