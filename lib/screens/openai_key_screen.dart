// lib/screens/openai_key_screen.dart
import 'package:flutter/material.dart';
import '../services/openai_service.dart';

class OpenAIKeyScreen extends StatefulWidget {
  @override
  State<OpenAIKeyScreen> createState() => _OpenAIKeyScreenState();
}

class _OpenAIKeyScreenState extends State<OpenAIKeyScreen> {
  final TextEditingController _controller = TextEditingController();
  final OpenAIService _service = OpenAIService();
  bool _loading = false;
  String? _savedKeyPreview;

  @override
  void initState() {
    super.initState();
    _loadKey();
  }

  Future<void> _loadKey() async {
    final k = await _service.getApiKey();
    setState(() => _savedKeyPreview = k == null ? null : '${k.substring(0, 6)}...${k.substring(k.length - 4)}');
  }

  Future<void> _save() async {
    final v = _controller.text.trim();
    if (v.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please paste your OpenAI API key')));
      return;
    }
    setState(() => _loading = true);
    await _service.saveApiKey(v);
    setState(() {
      _loading = false;
      _controller.clear();
      _savedKeyPreview = '${v.substring(0,6)}...${v.substring(v.length - 4)}';
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('API key saved securely')));
  }

  Future<void> _clear() async {
    await _service.deleteApiKey();
    setState(() => _savedKeyPreview = null);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('API key removed')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OpenAI API Key'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (_savedKeyPreview != null) ...[
              Text('Saved key: $_savedKeyPreview', style: TextStyle(fontSize: 14)),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: _clear,
                icon: const Icon(Icons.delete_outline),
                label: const Text('Remove saved key'),
              ),
              const Divider(height: 32),
            ],
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Paste OpenAI API key',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _loading ? null : _save,
              style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48), backgroundColor: Colors.deepPurple),
              child: _loading ? const CircularProgressIndicator(color: Colors.white) : const Text('Save key'),
            ),
            const SizedBox(height: 16),
            const Text('Note: do not commit your API key to source control.'),
          ],
        ),
      ),
    );
  }
}
