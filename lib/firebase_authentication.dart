import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método para registrar un nuevo usuario
  Future<void> registerUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('Error en el registro: $e');
      rethrow; // Lanzar la excepción nuevamente para manejarla en el nivel superior
    }
  }

  // Método para iniciar sesión
  Future<bool> signInUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('Inicio sesión');
      return true; // Sign-in successful
    } catch (e) {
      print('Error en el inicio de sesión: $e');
      return false; // Sign-in failed
    }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
