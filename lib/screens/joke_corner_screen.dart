import 'dart:math';
import 'package:flutter/material.dart';

class JokeCornerScreen extends StatefulWidget {
  final String mood;

  const JokeCornerScreen({Key? key, required this.mood}) : super(key: key);

  @override
  _JokeCornerScreenState createState() => _JokeCornerScreenState();
}

class _JokeCornerScreenState extends State<JokeCornerScreen>
    with SingleTickerProviderStateMixin {
  final Map<String, List<Map<String, dynamic>>> _jokesByLanguage = {
    'English': [
      {
        'text': "Why did the web developer go broke? Because they used up all their cache!",
        'moods': ['neutral', 'tired', 'overwhelmed'],
      },
      {
        'text': "Why do cows wear bells? Because their horns don’t work!",
        'moods': ['neutral', 'happy'],
      },
      {
        'text': "Parallel lines have so much in common. It’s a shame they’ll never meet.",
        'moods': ['neutral', 'anxious'],
      },
      {
        'text': "I asked the librarian if the library had books on paranoia. She whispered, 'They’re right behind you…'",
        'moods': ['anxious', 'neutral'],
      },
      {
        'text': "My friend said onions are the only food that makes you cry. So I threw a coconut at him.",
        'moods': ['angry', 'overwhelmed'],
      },
      {
        'text': "I told my computer I needed a break. It froze.",
        'moods': ['tired', 'neutral'],
      },
      {
        'text': "Why don’t skeletons fight each other? They don’t have the guts.",
        'moods': ['neutral', 'tired'],
      },
      {
        'text': "Did you hear about the claustrophobic astronaut? He just needed a little space.",
        'moods': ['anxious', 'neutral'],
      },
      {
        'text': "Why was the math book sad? Too many problems.",
        'moods': ['anxious', 'neutral'],
      },
      {
        'text': "I told my boss three companies were after me, and I needed a raise. Truth is, Amazon, Netflix, and Spotify all wanted me to renew my subscription.",
        'moods': ['happy', 'neutral'],
      },
    ],
    'Spanish': [
      {
        'text': "¿Por qué el libro de matemáticas está triste? Porque tiene muchos problemas.",
        'moods': ['anxious', 'tired'],
      },
      {
        'text': "¿Qué le dijo un jaguar a otro? Jaguar you!",
        'moods': ['neutral', 'happy'],
      },
      {
        'text': "¿Cómo se llama un perro sin patas? No importa, no va a venir.",
        'moods': ['neutral'],
      },
      {
        'text': "Estoy leyendo un libro sobre gravedad, pero no puedo dejarlo.",
        'moods': ['tired', 'neutral'],
      },
      {
        'text': "¿Qué hace una abeja en el gimnasio? ¡Zum-ba!",
        'moods': ['happy', 'neutral'],
      },
    ],
    'French': [
      {
        'text': "Pourquoi les plongeurs plongent-ils toujours en arrière et jamais en avant? Parce que sinon ils tombent dans le bateau.",
        'moods': ['neutral'],
      },
      {
        'text': "Quel est le comble pour un électricien? De ne pas être au courant.",
        'moods': ['neutral', 'happy'],
      },
      {
        'text': "Pourquoi les poissons détestent l'ordinateur? Parce qu'ils ont peur du net.",
        'moods': ['neutral', 'anxious'],
      },
      {
        'text': "Qu'est-ce qui est jaune et qui attend? Jonathan.",
        'moods': ['neutral'],
      },
      {
        'text': "Pourquoi les mathématiciens sont-ils mauvais en drague? Parce qu'ils cherchent toujours la racine carrée.",
        'moods': ['neutral', 'anxious'],
      },
    ],
    'Chinese': [
      {
        'text': "为什么程序员不喜欢大自然？因为它有太多的bug。",
        'moods': ['angry', 'anxious'],
      },
      {
        'text': "你听说过那个关于时间旅行的笑话吗？不？那我先不说。",
        'moods': ['neutral', 'tired'],
      },
      {
        'text': "为什么电脑很累？因为它有很多‘窗口’。",
        'moods': ['tired'],
      },
      {
        'text': "为什么数学书总是很忧郁？因为它充满了问题。",
        'moods': ['anxious', 'neutral'],
      },
      {
        'text': "什么动物最会编程？代码狮。",
        'moods': ['neutral', 'happy'],
      },
    ],
    'Hindi': [
      {
        'text': "कंप्यूटर की बीमारी क्या होती है? वायरस!",
        'moods': ['angry', 'anxious'],
      },
      {
        'text': "टीचर: बताओ पानी क्यूं गिरता है? स्टूडेंट: क्योंकि वो लुढ़कता है!",
        'moods': ['neutral', 'happy'],
      },
      {
        'text': "मैंने अपने लैपटॉप को कहा ‘ब्रेक चाहिए’, उसने ‘स्लीप’ मोड में चला गया।",
        'moods': ['tired', 'neutral'],
      },
      {
        'text': "अगर दो कॉम्प्यूटर शादी करें, तो उनका बच्चा क्या होगा? बिट-बिट!",
        'moods': ['neutral', 'happy'],
      },
      {
        'text': "मेरी कॉफी मुझे सुबह-शाम jokes सुनाती है, लेकिन वो मेरे जैसा मज़ेदार नहीं।",
        'moods': ['neutral', 'tired'],
      },
    ],
    'Russian': [
      {
        'text': "Почему программисты путают Хэллоуин и Рождество? Потому что Oct 31 == Dec 25.",
        'moods': ['neutral', 'anxious'],
      },
      {
        'text': "Что говорит компьютер, когда ему жарко? Мне нужно охлаждение!",
        'moods': ['tired', 'neutral'],
      },
      {
        'text': "Почему математики плохие шутники? Они всегда вычисляют всё заранее.",
        'moods': ['anxious', 'neutral'],
      },
      {
        'text': "Почему рыбы не любят интернет? Потому что там много сетей.",
        'moods': ['neutral'],
      },
      {
        'text': "Мой компьютер съел мой домашний проект. Он наверно хотел перекусить.",
        'moods': ['neutral', 'happy'],
      },
    ],
    'Japanese': [
      {
        'text': "プログラマーが自然を嫌う理由は？バグが多すぎるから。",
        'moods': ['angry', 'anxious'],
      },
      {
        'text': "なぜ数学の本は悲しいの？問題が多いから。",
        'moods': ['anxious', 'neutral'],
      },
      {
        'text': "コンピュータが疲れている理由は？たくさんのウィンドウがあるから。",
        'moods': ['tired', 'neutral'],
      },
      {
        'text': "鳥がプログラムを書くと何になる？コードリ。",
        'moods': ['neutral', 'happy'],
      },
      {
        'text': "時間旅行のジョークは知ってる？今は言わないよ。",
        'moods': ['neutral'],
      },
    ],
    'Korean': [
      {
        'text': "왜 프로그래머는 자연을 싫어할까? 버그가 너무 많아서.",
        'moods': ['angry', 'anxious'],
      },
      {
        'text': "컴퓨터가 쉬고 싶을 때 하는 말은? 잠시만요, 절전 모드로 갑니다.",
        'moods': ['tired', 'neutral'],
      },
      {
        'text': "수학책이 슬픈 이유는? 문제가 너무 많아서.",
        'moods': ['anxious', 'neutral'],
      },
      {
        'text': "왜 물고기는 인터넷을 싫어할까? 너무 많은 그물이 있어서.",
        'moods': ['neutral'],
      },
      {
        'text': "프로그램 짜는 새는 뭘까? 코드새.",
        'moods': ['neutral', 'happy'],
      },
    ],
    'German': [
      {
        'text': "Warum können Geister so schlecht lügen? Weil man durch sie hindurchsehen kann.",
        'moods': ['neutral', 'anxious'],
      },
      {
        'text': "Ich habe gestern ein Buch über Schwerkraft gelesen. Ich konnte es nicht aus der Hand legen.",
        'moods': ['tired', 'neutral'],
      },
      {
        'text': "Warum sind Programmierer schlechte Tänzer? Sie können keine Bugs vermeiden.",
        'moods': ['neutral', 'angry'],
      },
      {
        'text': "Was macht ein Pirat am Computer? Er drückt die Enter-Taste.",
        'moods': ['neutral', 'happy'],
      },
      {
        'text': "Warum ging der Pilz auf die Party? Weil er ein Champignon war.",
        'moods': ['neutral'],
      },
    ],
  };

  String _selectedLanguage = 'English';
  List<String> _displayedJokes = [];
  final Random _random = Random();

  late AnimationController _buttonController;
  late Animation<double> _buttonAnimation;
  int _laughCount = 0;

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.9,
      upperBound: 1.0,
      value: 1.0,
    );
    _buttonAnimation = CurvedAnimation(parent: _buttonController, curve: Curves.easeOut);
    _generateJokes();
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  void _generateJokes() {
    final allJokes = _jokesByLanguage[_selectedLanguage] ?? [];
    final mood = widget.mood.toLowerCase();

    final filteredJokes = allJokes.where((joke) {
      final moods = List<String>.from(joke['moods']);
      return moods.contains(mood) || moods.contains('neutral');
    }).toList();

    if (filteredJokes.isEmpty) {
      setState(() {
        _displayedJokes = ["No jokes available for your mood/language 😢"];
      });
      return;
    }

    final jokeSet = <String>{};
    while (jokeSet.length < 3 && jokeSet.length < filteredJokes.length) {
      jokeSet.add(filteredJokes[_random.nextInt(filteredJokes.length)]['text']);
    }

    setState(() {
      _displayedJokes = jokeSet.toList();
      _laughCount++;
    });
  }

  Future<void> _onRefreshPressed() async {
    await _buttonController.reverse();
    await _buttonController.forward();
    _generateJokes();
  }

  @override
  Widget build(BuildContext context) {
    final Color moodColor = Colors.deepPurple;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke Corner 😂'),
        backgroundColor: moodColor,
        centerTitle: true,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade50, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            // Language Picker Row
            Row(
              children: [
                Icon(Icons.language_rounded, color: moodColor),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedLanguage,
                    dropdownColor: Colors.deepPurple[100],
                    style: TextStyle(
                      color: moodColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    underline: Container(height: 2, color: moodColor),
                    onChanged: (newLang) {
                      if (newLang != null && newLang != _selectedLanguage) {
                        setState(() {
                          _selectedLanguage = newLang;
                          _generateJokes();
                        });
                      }
                    },
                    items: _jokesByLanguage.keys.map((lang) {
                      return DropdownMenuItem(value: lang, child: Text(lang));
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 10),
                Chip(
                  backgroundColor: moodColor.withOpacity(0.1),
                  label: Text(
                    "Mood: ${widget.mood[0].toUpperCase()}${widget.mood.substring(1)}",
                    style: TextStyle(color: moodColor, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Refresh Button
            ScaleTransition(
              scale: _buttonAnimation,
              child: ElevatedButton.icon(
                onPressed: _onRefreshPressed,
                icon: const Icon(Icons.refresh, color: Colors.white),
                label: const Text(
                  "Show me new jokes",
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: moodColor,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  elevation: 6,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Laugh Counter
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, anim) =>
                  ScaleTransition(scale: anim, child: child),
              child: Text(
                "🤣 Laughs generated: $_laughCount",
                key: ValueKey<int>(_laughCount),
                style: TextStyle(
                  color: Colors.deepPurple.shade400,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Jokes List
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: ListView.separated(
                  key: ValueKey<List<String>>(_displayedJokes),
                  itemCount: _displayedJokes.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final joke = _displayedJokes[index];
                    return Card(
                      elevation: 6,
                      shadowColor: Colors.deepPurple.withOpacity(0.3),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple.shade100.withOpacity(0.7),
                              Colors.white,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          joke,
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}