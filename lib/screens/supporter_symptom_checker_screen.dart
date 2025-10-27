import 'package:flutter/material.dart';
import 'supporter_symptom_result_screen.dart';

class SupporterSymptomCheckerScreen extends StatefulWidget {
  const SupporterSymptomCheckerScreen({Key? key}) : super(key: key);

  @override
  State<SupporterSymptomCheckerScreen> createState() =>
      _SupporterSymptomCheckerScreenState();
}

class _SupporterSymptomCheckerScreenState
    extends State<SupporterSymptomCheckerScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isAnalyzing = false;

  void _analyzeSymptoms() async {
    if (_controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please describe your observations.")),
      );
      return;
    }

    setState(() => _isAnalyzing = true);

    // Mock AI delay
    await Future.delayed(const Duration(seconds: 2));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SupporterSymptomResultScreen(
          possibleCondition: 'Insomnia',
          suggestedPlaceType: 'sleep clinics or insomnia specialists',
        ),
      ),
    );

    setState(() => _isAnalyzing = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade400, Colors.teal.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔙 Back Button Added
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),

                const SizedBox(height: 8),

                const Text(
                  "What are you observing?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),

                // Card-like text input
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: TextField(
                      controller: _controller,
                      maxLines: null,
                      expands: true,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: const InputDecoration(
                        hintText:
                        "Type symptoms, behaviors, or observations here...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Analyze button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton.icon(
                    onPressed: _isAnalyzing ? null : _analyzeSymptoms,
                    icon: _isAnalyzing
                        ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                        : const Icon(Icons.psychology_alt_outlined),
                    label: Text(
                      _isAnalyzing ? "Analyzing..." : "Analyze Observations",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
