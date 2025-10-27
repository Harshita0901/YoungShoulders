import 'package:flutter/material.dart';

class ReflectBotScreen extends StatefulWidget {
  @override
  _ReflectBotScreenState createState() => _ReflectBotScreenState();
}

class _ReflectBotScreenState extends State<ReflectBotScreen> {
  final List<String> prompts = [
    "What made you smile today?",
    "What's something you're grateful for?",
    "What’s been weighing on your mind lately?",
  ];

  String? selectedPrompt;
  final TextEditingController responseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ReflectBot"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose a prompt:", style: TextStyle(fontSize: 18)),
            SizedBox(height: 12),
            DropdownButton<String>(
              hint: Text("Select a reflection prompt"),
              value: selectedPrompt,
              isExpanded: true,
              items: prompts.map((prompt) {
                return DropdownMenuItem<String>(
                  value: prompt,
                  child: Text(prompt),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPrompt = value;
                  responseController.clear();
                });
              },
            ),
            SizedBox(height: 24),
            if (selectedPrompt != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your response:", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 10),
                  TextField(
                    controller: responseController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Write here...",
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    icon: Icon(Icons.send),
                    label: Text("Save Response"),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Reflection saved!"),
                        backgroundColor: Colors.deepPurple,
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      minimumSize: Size(double.infinity, 48),
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
