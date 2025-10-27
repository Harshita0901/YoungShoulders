import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'login_screen.dart'; // We'll build this screen next

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 1500,
      splash: Stack(
        children: [
          Positioned.fill(
            child: Lottie.asset("assets/animations/sunrise.json", fit: BoxFit.cover),
          ),
          Center(
            child: Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.yellow.shade200,
              child: Text(
                'YoungShoulders',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      splashIconSize: double.infinity,
      nextScreen: LoginScreen(), // temporary until login_screen.dart is ready
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
