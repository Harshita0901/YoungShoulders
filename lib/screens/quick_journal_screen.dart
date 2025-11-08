import 'package:flutter/material.dart';
import '../models/user_storage.dart';
import '../models/app_user.dart';

class QuickJournalScreen extends StatefulWidget {
  final AppUser user;

  const QuickJournalScreen({required this.user, Key? key}) : super(key: key);

  @override
  _QuickJournalScreenState createState() => _QuickJournalScreenState();
}

class _QuickJournalScreenState extends State<QuickJournalScreen> {
  final TextEditingController _question1Controller = TextEditingController();
  final TextEditingController _question2Controller = TextEditingController();

  void _submitJournal() async {
    final q1 = _question1Controller.text.trim();
    final q2 = _question2Controller.text.trim();

    if (q1.isEmpty || q2.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please answer both questions.")),
      );
      return;
    }

    final entry = "$q1\n$q2";

    await UserStorage().saveJournalEntry(entry, user: widget.user);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Journal saved!")),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _question1Controller.dispose();
    _question2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradientColors = [
      Colors.blue.shade400,
      Colors.blue.shade100,
    ];

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: const Text(
          "Quick Journal ✍️",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            // Inspiration Card
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: [Colors.blue.shade300, Colors.blue.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.25),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(18),
              child: const Text(
                "“Journaling is like whispering to yourself and listening at the same time.” 💭",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                ),
              ),
            ),

            // Journal Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "🧠 What’s on your mind today?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  _buildJournalBox(
                    controller: _question1Controller,
                    hint: "Write freely about your thoughts or emotions...",
                    maxLines: 5,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "🎯 What’s one thing you want to focus on today?",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  _buildJournalBox(
                    controller: _question2Controller,
                    hint: "Your main focus, goal, or mindset for the day...",
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),

            // Save Button
            ElevatedButton.icon(
              onPressed: _submitJournal,
              icon: const Icon(Icons.check_circle_outline, color: Colors.white),
              label: const Text(
                "Save Journal",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade400,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJournalBox({
    required TextEditingController controller,
    required String hint,
    required int maxLines,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
