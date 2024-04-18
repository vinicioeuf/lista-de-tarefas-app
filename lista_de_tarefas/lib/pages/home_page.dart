import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/add_page.dart';
import 'package:lista_de_tarefas/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 48, 59),
      
      body: Center(
        child: Text(''),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(iconSize: 35,
              icon: Icon(Icons.home),
              onPressed: (){
                _onItemTapped(0);
              },
              color: _selectedIndex == 0 ? Color.fromARGB(255, 24, 48, 59) : Colors.grey,
            ),
            IconButton(iconSize: 35,
              icon: Icon(Icons.add_rounded),
               onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AddPage()));
                _onItemTapped(1);
              },
              color: _selectedIndex == 1 ? Color.fromARGB(255, 24, 48, 59) : Colors.grey,
            ),
            IconButton(iconSize: 35,
              icon: Icon(Icons.person),
               onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
                _onItemTapped(2);
              },
              color: _selectedIndex == 2 ? Color.fromARGB(255, 24, 48, 59) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}