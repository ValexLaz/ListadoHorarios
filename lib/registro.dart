import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
 
class RegistroPage extends StatelessWidget {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
 
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('usuarios');
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade700],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Registrarse',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                _buildTextField(nombreController, 'Nombre'),
                SizedBox(height: 10),
                _buildTextField(apellidoController, 'Apellido'),
                SizedBox(height: 10),
                _buildTextField(emailController, 'Email'),
                SizedBox(height: 10),
                _buildTextField(passwordController, 'Contraseña', isPassword: true),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String nombre = nombreController.text.trim();
                    String apellido = apellidoController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
 
                    if (nombre.isNotEmpty &&
                        apellido.isNotEmpty &&
                        email.isNotEmpty &&
                        password.isNotEmpty) {
                      usersCollection
                          .add({
                            'nombre': nombre,
                            'apellido': apellido,
                            'email': email,
                            'contraseña': password,
                          })
                          .then((value) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Éxito'),
                            content: Text('Datos guardados correctamente.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.popUntil(
                                    context,
                                    ModalRoute.withName('/'), // Nombre de la ruta de inicio
                                  );
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }).catchError((error) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Hubo un error al guardar los datos.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      });
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
                      'Guardar',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
 
  Widget _buildTextField(
    TextEditingController controller,
    String labelText, {
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.blue.shade50.withOpacity(0.3),
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}