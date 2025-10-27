import 'package:flutter/material.dart';

class ReframeThoughtScreen extends StatefulWidget {
  @override
  _ReframeThoughtScreenState createState() => _ReframeThoughtScreenState();
}

class _ReframeThoughtScreenState extends State<ReframeThoughtScreen> {
  final TextEditingController negativeController = TextEditingController();
  final TextEditingController reframeController = TextEditingController();

  void _submitThought() {
    final original = negativeController.text.trim();
    final reframed = reframeController.text.trim();

    if (original.isEmpty || reframed.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please complete both fields.")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("🌿 Thought Reframed"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Negative Thought:",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.redAccent),
            ),
            Text(original),
            const SizedBox(height: 12),
            const Text(
              "Reframed Thought:",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            Text(reframed),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Done"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.deepPurple;

    return Scaffold(
      appBar: AppBar(
        title: const Text("🧠 Reframe Your Thoughts"),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Container(
        color: Colors.deepPurple[50],
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            // 🧩 Introduction to CBT
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What is Cognitive Behavioral Therapy (CBT)?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "CBT helps you notice unhelpful thinking patterns and replace them with balanced, realistic ones. "
                        "It teaches you that your thoughts influence how you feel and act — and by reframing them, you can change your emotional response.",
                    style: TextStyle(
                      fontSize: 15.5,
                      height: 1.4,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // 💭 Question 1
            Text(
              "1️⃣ What’s a negative thought on your mind?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              controller: negativeController,
              hint: "e.g., I'm not good enough...",
              icon: Icons.sentiment_dissatisfied_rounded,
            ),

            const SizedBox(height: 24),

            // 💬 Question 2
            Text(
              "2️⃣ What evidence supports or challenges this thought?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              hint: "e.g., I’ve done well on projects before; I’m learning every day.",
            ),

            const SizedBox(height: 24),

            // 💚 Question 3
            Text(
              "3️⃣ If a friend had this thought, what would you say to them?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            _buildTextField(
              controller: reframeController,
              hint: "e.g., Everyone makes mistakes — it doesn’t mean they’re a failure.",
              icon: Icons.volunteer_activism_rounded,
            ),

            const SizedBox(height: 36),

            // ✅ Button
            ElevatedButton.icon(
              onPressed: _submitThought,
              icon: const Icon(Icons.check_circle_outline, color: Colors.white),
              label: const Text(
                "Reframe My Thought",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    TextEditingController? controller,
    required String hint,
    IconData? icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.08),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: 3,
        decoration: InputDecoration(
          prefixIcon: icon != null
              ? Icon(icon, color: Colors.deepPurple)
              : const SizedBox.shrink(),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black45),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}
