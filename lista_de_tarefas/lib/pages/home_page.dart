// import 'package:app/pages/access_page.dart';
// import 'package:app/pages/dog.dart';
// import 'package:app/pages/profile_page.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/add_page.dart';
import 'package:lista_de_tarefas/pages/list_page.dart';
import 'package:lista_de_tarefas/pages/profile_page.dart';
import 'package:showcaseview/showcaseview.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  int paginaAtual = 0;
  late PageController pc;
  bool showTutorial = true; // Adiciona um estado para controlar a exibição do tutorial
  int? credencial;
  @override
  void initState() {
    super.initState();
    // enviaNotificacao();
    pc = PageController(initialPage: paginaAtual);
  }
  
  

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(), // Desativa a rolagem horizontal
              controller: pc,
              children: [
                ShowCaseWidget(
                  builder: Builder(
                    builder: (context) => ListPage(),
                  ),
                ),
                ShowCaseWidget(
                  builder: Builder(
                    builder: (context) => AddPage(),
                  ),
                ),
                ShowCaseWidget(
                  builder: Builder(
                    builder: (context) => ProfilePage(),
                  ),
                ),
              ],
              onPageChanged: setPaginaAtual,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: paginaAtual,
          backgroundColor: Color.fromARGB(255, 226, 221, 209),
          selectedItemColor: Color.fromARGB(255, 25, 25, 25),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
              ),
              label: 'Adicionar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Perfil',
            ),
          ],
          onTap: (pagina) {
            setState(() {
              paginaAtual = pagina; // Atualiza a página selecionada
              showTutorial = false;
            });
            pc.animateToPage(pagina,
                duration: Duration(milliseconds: 400), curve: Curves.ease);
          },
        ),
      ),
    );
  }
}

