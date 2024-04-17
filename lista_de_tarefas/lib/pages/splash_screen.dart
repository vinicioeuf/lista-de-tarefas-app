import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/login_page.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Define um temporizador para redirecionar após 3 segundos
    Timer(Duration(seconds: 4), () {
      // Substitui a tela atual pela página de login e remove a rota anterior
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 48, 59),
      body: Center(
        child: Lottie.asset('assets/imagens/animation.json'),
      ),
    );
  }
}