import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SupporterMoodTrackerScreen extends StatelessWidget {
  const SupporterMoodTrackerScreen({Key? key}) : super(key: key);

  // Mock data for the last 14 days
  final List<Map<String, dynamic>> mockMoodData = const [
    {'date': 'Oct 4', 'mood': 3, 'note': 'A bit stressed about homework.'},
    {'date': 'Oct 5', 'mood': 4, 'note': 'Feeling better today!'},
    {'date': 'Oct 6', 'mood': 2, 'note': 'Rough day, very tired.'},
    {'date': 'Oct 7', 'mood': 3, 'note': 'Normal day.'},
    {'date': 'Oct 8', 'mood': 5, 'note': 'Had fun with friends!'},
    {'date': 'Oct 9', 'mood': 4, 'note': 'Feeling productive.'},
    {'date': 'Oct 10', 'mood': 2, 'note': 'Stress spike due to tests.'},
    {'date': 'Oct 11', 'mood': 3, 'note': 'Average day.'},
    {'date': 'Oct 12', 'mood': 4, 'note': 'Relaxed today.'},
    {'date': 'Oct 13', 'mood': 3, 'note': 'Mood steady.'},
    {'date': 'Oct 14', 'mood': 2, 'note': 'Feeling anxious.'},
    {'date': 'Oct 15', 'mood': 4, 'note': 'Better after exercising.'},
    {'date': 'Oct 16', 'mood': 5, 'note': 'Very happy and energetic!'},
    {'date': 'Oct 17', 'mood': 3, 'note': 'Normal day, okay mood.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood Progress'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Line Chart Section
            Expanded(
              flex: 2,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: LineChart(
                    LineChartData(
                      minY: 1,
                      maxY: 5,
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              switch (value.toInt()) {
                                case 1:
                                  return const Text('😢');
                                case 2:
                                  return const Text('😟');
                                case 3:
                                  return const Text('😐');
                                case 4:
                                  return const Text('🙂');
                                case 5:
                                  return const Text('😄');
                              }
                              return const Text('');
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              int index = value.toInt();
                              if (index >= 0 && index < mockMoodData.length) {
                                return Text(
                                  mockMoodData[index]['date'],
                                  style: const TextStyle(fontSize: 10),
                                );
                              }
                              return const Text('');
                            },
                          ),
                        ),
                      ),
                      gridData: FlGridData(show: true, drawHorizontalLine: true),
                      borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            left: BorderSide(),
                            bottom: BorderSide(),
                          )),
                      lineBarsData: [
                        LineChartBarData(
                          spots: List.generate(
                            mockMoodData.length,
                                (index) => FlSpot(index.toDouble(),
                                mockMoodData[index]['mood'].toDouble()),
                          ),
                          isCurved: true,
                          barWidth: 3,
                          color: Colors.deepPurple,
                          dotData: FlDotData(show: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Summary Section
            Expanded(
              flex: 1,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Mood Summary:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'The teen’s mood has been improving overall over the last two weeks. '
                            'Stress spikes were observed on Oct 6 and Oct 10. Weekends show higher happiness levels.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Navigation / Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to detailed mood history screen (future)
                  },
                  icon: const Icon(Icons.show_chart),
                  label: const Text('Full Mood History'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigate to teen notes screen (future)
                  },
                  icon: const Icon(Icons.note),
                  label: const Text('Teen Notes'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
