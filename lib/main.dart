import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'firebase_authentication.dart';
import 'firebase_firestore.dart';
import 'login.dart'; // Importa la página de inicio de sesión
import 'carreras.dart';
import 'semestres.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: CarrerasPage(), // Cambia MyHomePage() por LoginPage()
    );
  }
}

// Elimina MyHomePage y usa LoginPage directamente en la estructura del widget
