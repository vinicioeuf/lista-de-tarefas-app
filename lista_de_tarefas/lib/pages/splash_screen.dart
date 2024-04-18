import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/home_page.dart';
import 'package:lista_de_tarefas/pages/login_page.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // Define um temporizador para redirecionar após 3 segundos
    Timer(Duration(seconds: 3), () {
      // Verifica se há um usuário logado
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        // Se o usuário estiver logado, redirecione para a HomePage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        // Se o usuário não estiver logado, redirecione para a LoginPage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 48, 59),
      body: Center(
        child: Lottie.asset('assets/imagens/splash.json'),
      ),
    );
  }
}