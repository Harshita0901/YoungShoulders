import 'package:flutter/material.dart';

class BreathingScreen extends StatefulWidget {
  const BreathingScreen({Key? key}) : super(key: key);

  @override
  _BreathingScreenState createState() => _BreathingScreenState();
}

class _BreathingScreenState extends State<BreathingScreen>
    with SingleTickerProviderStateMixin {
  // Steps & exact timings for 4-7-8
  final List<String> _steps = ['Inhale', 'Hold', 'Exhale'];
  final int inhaleSeconds = 4;
  final int holdSeconds = 7;
  final int exhaleSeconds = 8;

  String _currentStep = 'Inhale';
  late final AnimationController _controller;
  bool _running = true;

  // Size range for the bubble
  final double _minSize = 140.0;
  final double _maxSize = 320.0;

  @override
  void initState() {
    super.initState();

    // Controller value 0.0 = smallest, 1.0 = largest
    _controller = AnimationController(vsync: this, value: 0.0);

    // Start the breathing cycle loop
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startBreathingLoop();
    });
  }

  // Async loop that enforces the 4-7-8 durations exactly
  Future<void> _startBreathingLoop() async {
    while (mounted && _running) {
      // 1) Inhale: animate controller from current -> 1.0 over inhaleSeconds
      setState(() => _currentStep = 'Inhale');
      try {
        await _controller.animateTo(
          1.0,
          duration: Duration(seconds: inhaleSeconds),
          curve: Curves.easeInOut,
        );
      } catch (_) {
        // animation canceled (e.g., disposed); break if not mounted
        if (!mounted) break;
      }

      if (!mounted || !_running) break;

      // 2) Hold: keep at 1.0 for holdSeconds
      setState(() => _currentStep = 'Hold');
      await Future.delayed(Duration(seconds: holdSeconds));
      if (!mounted || !_running) break;

      // 3) Exhale: animate controller from 1.0 -> 0.0 over exhaleSeconds
      setState(() => _currentStep = 'Exhale');
      try {
        await _controller.animateBack(
          0.0,
          duration: Duration(seconds: exhaleSeconds),
          curve: Curves.easeInOut,
        );
      } catch (_) {
        if (!mounted) break;
      }

      if (!mounted || !_running) break;

      // Loop continues
    }
  }

  @override
  void dispose() {
    _running = false;
    _controller.dispose();
    super.dispose();
  }

  Color _colorForStep() {
    switch (_currentStep) {
      case 'Inhale':
        return Colors.deepPurple.shade300;
      case 'Hold':
        return Colors.deepPurple.shade400;
      case 'Exhale':
        return Colors.deepPurple.shade700;
      default:
        return Colors.deepPurple;
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Colors.deepPurple;

    return Scaffold(
      backgroundColor: primary[50],
      appBar: AppBar(
        title: const Text('4-7-8 Breathing'),
        backgroundColor: primary,
        centerTitle: true,
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          // Interpolate size
          final double size =
              _minSize + (_maxSize - _minSize) * _controller.value;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Bubble
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        _colorForStep(),
                        primary.shade900.withOpacity(0.5),
                      ],
                      center: Alignment(-0.2, -0.2),
                      radius: 0.9,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _colorForStep().withOpacity(0.45),
                        blurRadius: 28,
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                  child: Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder:
                          (Widget child, Animation<double> anim) =>
                          FadeTransition(opacity: anim, child: child),
                      child: Text(
                        _currentStep,
                        key: ValueKey<String>(_currentStep),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 36),

                // Secondary guidance text + countdown visualization
                Text(
                  _stepInstructionText(),
                  style: TextStyle(
                    color: primary.shade700,
                    fontSize: 16.5,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 14),

                // Simple progress bar showing controller value (optional)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearProgressIndicator(
                    value: _controller.value,
                    minHeight: 8,
                    backgroundColor: primary.shade100,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(primary.shade400),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  String _stepInstructionText() {
    switch (_currentStep) {
      case 'Inhale':
        return 'Breathe in slowly for $inhaleSeconds seconds';
      case 'Hold':
        return 'Hold your breath for $holdSeconds seconds';
      case 'Exhale':
        return 'Exhale slowly for $exhaleSeconds seconds';
      default:
        return '';
    }
  }
}
