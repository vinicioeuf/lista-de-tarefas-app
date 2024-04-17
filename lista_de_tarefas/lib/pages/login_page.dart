import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flare_flutter/flare_actor.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String googleImage = 'assets/imagens/google.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 24, 48, 59),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 100,
                ),
                SizedBox(height: 20,),
            Text(
              "Bem vindo(a) ao Taskify",
              style: GoogleFonts.barlowCondensed(
                textStyle: TextStyle(color: Colors.white),
                fontSize: 29,
              ),
            ),
            
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Função a ser executada ao pressionar o botão
                },

                icon: SvgPicture.asset('assets/imagens/google.svg', width: 24, height: 24,),
                label: Text(
                  "Continuar com o Google",
                  style: TextStyle(color: Colors.black, fontSize: 21),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Cor do botão
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
