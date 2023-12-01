import 'package:flutter/material.dart';
import 'package:horarios/home/home_view.dart';
import 'carreras.dart';
import 'firebase_authentication.dart';
import 'registro.dart'; // Asegúrate de importar el archivo de la pantalla de registro
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuthService authService = FirebaseAuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade700],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Inicio de Sesion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue.shade50.withOpacity(0.3),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blue.shade50.withOpacity(0.3),
                hintText: 'Password',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                if (email.isNotEmpty && password.isNotEmpty) {
                  QuerySnapshot<Map<String, dynamic>>? snapshot =
                      await FirebaseFirestore.instance
                          .collection('usuarios')
                          .where('email', isEqualTo: email)
                          .where('contraseña', isEqualTo: password)
                          .limit(1)
                          .get() as QuerySnapshot<Map<String, dynamic>>?;

                  if (snapshot != null && snapshot.docs.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeView(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Error'),
                        content: Text(
                            'Credenciales incorrectas. Por favor, inténtalo de nuevo.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Error'),
                      content: Text('Por favor, completa todos los campos.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistroPage(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
