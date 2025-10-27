import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SupporterFullMoodHistoryScreen extends StatelessWidget {
  const SupporterFullMoodHistoryScreen({Key? key}) : super(key: key);

  // Mock data for 30 days
  final List<Map<String, dynamic>> mockFullMoodData = const [
    {'date': 'Sep 18', 'mood': 3, 'note': 'Average day.'},
    {'date': 'Sep 19', 'mood': 2, 'note': 'Stressed about exams.'},
    {'date': 'Sep 20', 'mood': 3, 'note': 'Feeling better after lunch.'},
    {'date': 'Sep 21', 'mood': 4, 'note': 'Went out with friends.'},
    {'date': 'Sep 22', 'mood': 3, 'note': 'Normal day.'},
    {'date': 'Sep 23', 'mood': 5, 'note': 'Very happy!'},
    {'date': 'Sep 24', 'mood': 2, 'note': 'Anxious day.'},
    {'date': 'Sep 25', 'mood': 3, 'note': 'Mood steady.'},
    {'date': 'Sep 26', 'mood': 4, 'note': 'Good day.'},
    {'date': 'Sep 27', 'mood': 3, 'note': 'Average mood.'},
    {'date': 'Sep 28', 'mood': 2, 'note': 'Stress spike.'},
    {'date': 'Sep 29', 'mood': 4, 'note': 'Feeling calm.'},
    {'date': 'Sep 30', 'mood': 5, 'note': 'Had fun!'},
    {'date': 'Oct 1', 'mood': 3, 'note': 'Okay day.'},
    {'date': 'Oct 2', 'mood': 2, 'note': 'Low mood.'},
    {'date': 'Oct 3', 'mood': 3, 'note': 'Normal.'},
    {'date': 'Oct 4', 'mood': 3, 'note': 'Average day.'},
    {'date': 'Oct 5', 'mood': 4, 'note': 'Feeling productive.'},
    {'date': 'Oct 6', 'mood': 2, 'note': 'Rough day.'},
    {'date': 'Oct 7', 'mood': 3, 'note': 'Normal.'},
    {'date': 'Oct 8', 'mood': 5, 'note': 'Very happy!'},
    {'date': 'Oct 9', 'mood': 4, 'note': 'Calm.'},
    {'date': 'Oct 10', 'mood': 2, 'note': 'Stress spike.'},
    {'date': 'Oct 11', 'mood': 3, 'note': 'Average.'},
    {'date': 'Oct 12', 'mood': 4, 'note': 'Feeling relaxed.'},
    {'date': 'Oct 13', 'mood': 3, 'note': 'Normal.'},
    {'date': 'Oct 14', 'mood': 2, 'note': 'Anxious.'},
    {'date': 'Oct 15', 'mood': 4, 'note': 'Better after exercising.'},
    {'date': 'Oct 16', 'mood': 5, 'note': 'Very happy!'},
    {'date': 'Oct 17', 'mood': 3, 'note': 'Normal day.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Mood History'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Scrollable Chart
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: mockFullMoodData.length * 40.0, // scale width
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
                              if (index >= 0 && index < mockFullMoodData.length) {
                                return Text(
                                  mockFullMoodData[index]['date'],
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
                            mockFullMoodData.length,
                                (index) => FlSpot(index.toDouble(),
                                mockFullMoodData[index]['mood'].toDouble()),
                          ),
                          isCurved: true,
                          barWidth: 3,
                          color: Colors.deepPurple,
                          dotData: FlDotData(
                            show: true,
                            checkToShowDot: (spot, barData) => true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // List of Notes Below Chart
            Expanded(
              flex: 1,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView.separated(
                    itemCount: mockFullMoodData.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final day = mockFullMoodData[index];
                      return ListTile(
                        leading: Text(
                          day['mood'] == 1
                              ? '😢'
                              : day['mood'] == 2
                              ? '😟'
                              : day['mood'] == 3
                              ? '😐'
                              : day['mood'] == 4
                              ? '🙂'
                              : '😄',
                          style: const TextStyle(fontSize: 24),
                        ),
                        title: Text(day['date']),
                        subtitle: Text(day['note']),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
