import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login_screen.dart';
import 'screens/teen_home_screen.dart';
import 'screens/mood_screen.dart';
import 'screens/arcade_screen.dart';
import 'screens/breathing_screen.dart';
import 'screens/reframe_thought_screen.dart';
import 'screens/resources_screen.dart';
import 'models/app_user.dart';
import 'theme_provider.dart'; // import provider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: YoungShouldersApp(),
    ),
  );
}

class YoungShouldersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Young Shoulders',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: LoginScreen(),
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/teen-home':
                final args = settings.arguments as Map<String, dynamic>;
                final user = args['user'] as AppUser;
                return MaterialPageRoute(
                  builder: (_) => TeenHomeScreen(user: user),
                );

              case '/mood':
                final args = settings.arguments as Map<String, dynamic>;
                final user = args['user'] as AppUser;
                return MaterialPageRoute(
                  builder: (_) => MoodScreen(user: user),
                );

              case '/arcade':
                final args = settings.arguments as Map<String, dynamic>;
                final mood = args['mood'] as String;
                return MaterialPageRoute(
                  builder: (_) => ArcadeScreen(mood: mood),
                );

              case '/breathing':
                return MaterialPageRoute(builder: (_) => BreathingScreen());

              default:
                return null;
            }
          },
        );
      },
    );
  }
}
