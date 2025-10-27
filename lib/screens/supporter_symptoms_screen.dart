import 'package:flutter/material.dart';
import 'supporter_symptom_result_screen.dart';

class SupporterSymptomsScreen extends StatefulWidget {
  const SupporterSymptomsScreen({Key? key}) : super(key: key);

  @override
  _SupporterSymptomsScreenState createState() => _SupporterSymptomsScreenState();
}

class _SupporterSymptomsScreenState extends State<SupporterSymptomsScreen> {
  final List<String> _symptoms = [
    'Anxiety',
    'Low Mood',
    'Irritability',
    'Trouble Sleeping',
    'Lack of Focus',
    'Loss of Interest'
  ];

  final Set<String> _selectedSymptoms = {};

  // Simple mapping of symptoms to possible conditions and suggested place types
  Map<String, Map<String, String>> symptomMapping = {
    'Anxiety': {
      'condition': 'Generalized Anxiety Disorder',
      'place': 'therapy center'
    },
    'Low Mood': {
      'condition': 'Depression',
      'place': 'counselor office'
    },
    'Irritability': {
      'condition': 'Stress-related Mood Disorder',
      'place': 'meditation center'
    },
    'Trouble Sleeping': {
      'condition': 'Insomnia',
      'place': 'sleep clinic'
    },
    'Lack of Focus': {
      'condition': 'Attention Deficit Disorder',
      'place': 'counseling center'
    },
    'Loss of Interest': {
      'condition': 'Depressive Episode',
      'place': 'therapy center'
    },
  };

  // Determine the first symptom’s mapped condition and place as a simple demo
  Map<String, String> _getResult() {
    if (_selectedSymptoms.isEmpty) return {'condition': 'Unknown', 'place': 'therapy center'};
    return symptomMapping[_selectedSymptoms.first]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Teen Symptoms'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Check all symptoms the teen is experiencing:',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: _symptoms.map((symptom) {
                  final isSelected = _selectedSymptoms.contains(symptom);
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: isSelected
                        ? Colors.deepPurple.shade100
                        : Colors.white,
                    child: ListTile(
                      title: Text(symptom),
                      trailing: isSelected
                          ? Icon(Icons.check_circle, color: Colors.deepPurple)
                          : Icon(Icons.circle_outlined),
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedSymptoms.remove(symptom);
                          } else {
                            _selectedSymptoms.add(symptom);
                          }
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _selectedSymptoms.isEmpty
                  ? null
                  : () {
                final result = _getResult();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SupporterSymptomResultScreen(
                      possibleCondition: result['condition']!,
                      suggestedPlaceType: result['place']!,
                    ),
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
              child: const Text(
                'Analyze Symptoms',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
