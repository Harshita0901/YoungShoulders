import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/app_user.dart';

class AIChatScreen extends StatefulWidget {
  final AppUser user;
  const AIChatScreen({Key? key, required this.user}) : super(key: key);

  @override
  _AIChatScreenState createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isLoading = false;

  final Map<String, String> _scriptedResponses = {
    "hello": "Hello! I'm doing great 😄 How about you?",
    "rough_genz": "Ayy, I feel you bro 😅 Sometimes everything just hits all at once, and your brain’s like, “nah, I’m clocking out.” 💀 Try vibin’ with some good music — like actually throw on your favorite playlist, close your eyes, and just let it carry you for a sec. Or go take a walk, touch some grass, get that fresh air reset y’know? Even just chillin’ for a bit, zoning out, or doing something small that makes you feel human again can help. You got this fr, just breathe and take it one step at a time 🙌",
    "rough_formal": "I understand — it can be quite challenging to manage moments like this, especially when everything feels overwhelming or mentally draining. Try taking a few minutes to focus on your breathing; slow, intentional deep breaths can help calm your nervous system and bring your attention back to the present. Journaling your thoughts is another helpful practice — sometimes simply putting your feelings into words allows you to process them more clearly and release some of the weight you’re carrying. You might also consider stepping away from your current task for a short break, even just five or ten minutes, to stretch, walk around, or sip some water. These small pauses can make a meaningful difference in helping you regain composure and clarity. Remember, it’s completely okay to prioritize your well-being — taking care of yourself isn’t a sign of weakness, but an important part of staying strong and balanced."
  };

  Future<void> _sendMessage() async {
    final userMessage = _controller.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': userMessage});
      _controller.clear();
      _isLoading = true;
    });


    final randomDelay = Duration(milliseconds: 500 + Random().nextInt(1000));
    await Future.delayed(randomDelay);

    String lowerText = userMessage.toLowerCase();
    String aiReply;

    if (lowerText.contains("hello") || lowerText.contains("how are you")) {
      aiReply = _scriptedResponses["hello"]!;
    } else if (lowerText.contains("bro") && lowerText.contains("rough")) {
      aiReply = _scriptedResponses["rough_genz"]!;
    } else if (lowerText.contains("well") && lowerText.contains("rough")) {
      aiReply = _scriptedResponses["rough_formal"]!;
    } else {
      aiReply = "Hmm… I'm having trouble generating a response. Check your wi-fi connection and get back."; // Default AI fallback
    }

    setState(() {
      _messages.add({'sender': 'bot', 'text': aiReply});
      _isLoading = false;
    });
  }

  Widget _buildTypingIndicator() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        SizedBox(
          width: 6,
          height: 6,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
          ),
        ),
        SizedBox(width: 4),
        SizedBox(
          width: 6,
          height: 6,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
          ),
        ),
        SizedBox(width: 4),
        SizedBox(
          width: 6,
          height: 6,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.deepPurple, shape: BoxShape.circle),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe0c3fc), Color(0xFF8ec5fc)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar with Back Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: Row(
                  children: [
                    // 🔙 Back Button
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "AI Chat Companion",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 48), // Keeps title centered
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // Chat messages
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    final isUser = message['sender'] == 'user';
                    return Align(
                      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.deepPurple.shade400 : Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isUser ? 16 : 0),
                            topRight: Radius.circular(isUser ? 0 : 16),
                            bottomLeft: const Radius.circular(16),
                            bottomRight: const Radius.circular(16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          message['text']!,
                          style: TextStyle(
                            color: isUser ? Colors.white : Colors.black87,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Typing Indicator
              if (_isLoading)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: _buildTypingIndicator(),
                ),

              // Input Box
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: "Type a message...",
                          border: InputBorder.none,
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send, color: Colors.deepPurple),
                      onPressed: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
