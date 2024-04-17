import 'package:flutter/material.dart';
import 'package:lista_de_tarefas/pages/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(AppWidget(title: 'Conectado!'));
}

