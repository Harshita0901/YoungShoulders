// lib/services/openai_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OpenAIService {
  static const _storageKey = 'OPENAI_API_KEY';
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Save API key to secure storage (call from a simple "Paste API key" screen)
  Future<void> saveApiKey(String key) async {
    await _secureStorage.write(key: _storageKey, value: key);
  }

  Future<String?> getApiKey() async {
    return await _secureStorage.read(key: _storageKey);
  }

  Future<void> deleteApiKey() async {
    await _secureStorage.delete(key: _storageKey);
  }

  // send chat messages to OpenAI Chat Completions
  // messages: List of maps like [{'role':'system','content':...}, {'role':'user','content':...}, ...]
  Future<String> sendChat({
    required List<Map<String, String>> messages,
    String model = 'gpt-4o-mini', // change if you prefer a different model
    double temperature = 0.8,
    int maxTokens = 700,
  }) async {
    final apiKey = await getApiKey();
    if (apiKey == null || apiKey.trim().isEmpty) {
      throw Exception('OpenAI API key not found. Please enter it in Settings → OpenAI Key.');
    }

    final url = Uri.parse('https://api.openai.com/v1/chat/completions');

    final payload = {
      'model': model,
      'messages': messages,
      'temperature': temperature,
      'max_tokens': maxTokens,
      // you can add 'top_p', 'presence_penalty', etc.
    };

    final resp = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode(payload),
    );

    if (resp.statusCode != 200) {
      throw Exception('OpenAI error (${resp.statusCode}): ${resp.body}');
    }

    final Map<String, dynamic> json = jsonDecode(resp.body);
    final choice = json['choices']?[0];
    final message = choice?['message']?['content'] as String?;
    if (message == null) throw Exception('No message in response: ${resp.body}');
    return message.trim();
  }
}
