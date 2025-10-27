import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SupporterMapScreen extends StatefulWidget {
  final String url;

  const SupporterMapScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<SupporterMapScreen> createState() => _SupporterMapScreenState();
}

class _SupporterMapScreenState extends State<SupporterMapScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the WebView controller
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Centers Near You'),
        backgroundColor: Colors.deepPurple,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
