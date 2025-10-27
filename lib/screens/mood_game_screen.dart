import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:vibration/vibration.dart';

class MoodGameScreen extends StatefulWidget {
  final String mood;

  MoodGameScreen({required this.mood});

  @override
  _MoodGameScreenState createState() => _MoodGameScreenState();
}

class _MoodGameScreenState extends State<MoodGameScreen> {
  int score = 0;
  Offset boxPosition = Offset(100, 200);
  final Random random = Random();
  late Timer timer;
  int timeLeft = 30;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  Color _getColorForMood() {
    switch (widget.mood) {
      case 'angry':
        return Colors.redAccent;
      case 'anxious':
        return Colors.blueGrey;
      case 'overwhelmed':
        return Colors.deepPurple;
      case 'tired':
        return Colors.teal;
      default:
        return Colors.deepPurpleAccent;
    }
  }

  IconData _getIconForMood() {
    switch (widget.mood) {
      case 'angry':
        return Icons.whatshot; // fire
      case 'anxious':
        return Icons.cloud; // cloud
      case 'overwhelmed':
        return Icons.waves; // waves
      case 'tired':
        return Icons.bedtime; // moon
      default:
        return Icons.bolt;
    }
  }

  void _startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        t.cancel();
        setState(() {
          gameOver = true;
        });
        _showFinalScoreDialog();
      }
    });
  }


  void _moveBox() {
    if (gameOver) return;

    final double newX = random.nextDouble() * (MediaQuery.of(context).size.width - 100);
    final double newY = random.nextDouble() * (MediaQuery.of(context).size.height - 300);

    setState(() {
      boxPosition = Offset(newX, newY);
      score++;
    });
    Vibration.hasVibrator().then((hasVibrator) {
      if (hasVibrator ?? false) {
        Vibration.vibrate(duration: 50);
      }
    });
  }

  void _showFinalScoreDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: Text('Time’s Up!'),
        content: Text('You smashed $score stress icons!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to Arcade
            },
            child: Text('Back to Arcade'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final moodColor = _getColorForMood();
    final moodIcon = _getIconForMood();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Smash the Stress (${widget.mood})"),
        backgroundColor: moodColor,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                "⏱️ $timeLeft s",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Positioned(
            top: boxPosition.dy,
            left: boxPosition.dx,
            child: GestureDetector(
              onTap: _moveBox,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: moodColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5)],
                ),
                child: Center(
                  child: Icon(moodIcon, color: Colors.white, size: 40),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child: Text(
              "Score: $score",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: moodColor),
            ),
          )
        ],
      ),
    );
  }
}
