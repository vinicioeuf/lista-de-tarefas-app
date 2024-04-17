import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 48, 59),
      body: Center(
        
        child: Lottie.network('https://lottie.host/8f386b7d-080a-4651-99b6-29e18602f5e6/4TtQv5sA8X.json'),
      ),
    );
  }
}