import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? _user;

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  Future<void> _getUserData() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    setState(() {
      _user = currentUser;
    });
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 25, 25, 25),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 25, 25),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: _signOut,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_user != null && _user!.photoURL != null)
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(_user!.photoURL! ?? 'Sua Foto aqui'),
                    ),
                  SizedBox(height: 8),
                  Text(_user?.displayName ?? 'Nome de Usuário',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Text('Tarefas concluídas',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 20), // Espaçamento entre os textos
                      Expanded(
                        child: Center(
                          child: Text('Tarefas pendentes',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10), // Espaçamento entre as linhas de texto
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child:
                              Text('1', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 20), // Espaçamento entre os números
                      Expanded(
                        child: Center(
                          child:
                              Text('6', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(child: Text(
                      _user?.email ?? 'Email do Usuário',
                      style: TextStyle(color: Colors.white),
                    ),)
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar ação para editar perfil
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(0, 25, 25, 25),
                      onPrimary: Colors.white,
                      side: BorderSide(color: Colors.grey),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 40),
                    ),
                    child: Text(
                      'Editar Perfil',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implementar ação para a opção "Sobre nós"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(0, 25, 25, 25),
                      onPrimary: Colors.white,
                      side: BorderSide(color: Colors.grey),
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: Size(0.9 * MediaQuery.of(context).size.width, 40),
                    ),
                    child: Text(
                      'Sobre Nós',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
