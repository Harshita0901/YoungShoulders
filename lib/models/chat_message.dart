// lib/models/chat_message.dart
class ChatMessage {
  final String role; // 'user' or 'assistant'
  final String text;
  ChatMessage({required this.role, required this.text});
}
