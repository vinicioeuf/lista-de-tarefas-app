
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/add_page.dart';
import 'package:lista_de_tarefas/pages/home_page.dart';
import 'package:lista_de_tarefas/pages/list_page.dart';
import 'package:lista_de_tarefas/pages/login_page.dart';
import 'package:lista_de_tarefas/pages/profile_page.dart';
import 'package:lista_de_tarefas/pages/splash_screen.dart';


class AppWidget extends StatelessWidget {
  final String title;

  const AppWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        primarySwatch: MaterialColor(0xFFA7BF8B, {
          50: Color(0xFFA7BF8B),
          100: Color(0xFFA7BF8B),
          200: Color(0xFFA7BF8B),
          300: Color(0xFFA7BF8B),
          400: Color(0xFFA7BF8B),
          500: Color(0xFFA7BF8B),
          600: Color(0xFFA7BF8B),
          700: Color(0xFFA7BF8B),
          800: Color(0xFFA7BF8B),
          900: Color(0xFFA7BF8B),
        }),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashScreen(),
        '/login': (_) => const LoginPage(),
        '/home': (_) => HomePage(),
        '/add': (_) => AddPage(),
        '/profile': (_) => ProfilePage(),
        '/list': (_) => ListPage(),
  
      }

    );
  }
}
