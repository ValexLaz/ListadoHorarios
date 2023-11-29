import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Métodos para acceder a las colecciones en Firestore
  CollectionReference get carrerasCollection =>
      _firestore.collection('carreras');
  CollectionReference get docentesCollection =>
      _firestore.collection('docentes');
  CollectionReference get materiasCollection =>
      _firestore.collection('materias');
  CollectionReference get semestresCollection =>
      _firestore.collection('semestres');
  CollectionReference get usuariosCollection =>
      _firestore.collection('usuarios');

  // Ejemplo de cómo agregar un documento a una colección
  Future<void> agregarCarrera(String nombre) async {
    try {
      await carrerasCollection.add({'nombre': nombre});
    } catch (e) {
      print('Error al agregar carrera: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getSemestres() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('semestres').get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error al obtener semestres: $e');
      throw Exception('Error al obtener semestres');
    }
  }

   Future<List<Map<String, dynamic>>> getCarreras() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('carreras').get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error al obtener carreras: $e');
      throw Exception('Error al obtener carreras');
    }
  }

  Future<List<Map<String, dynamic>>> getSemestresByCarreraId(String carreraId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('semestres')
          .where('carrera_id', isEqualTo: carreraId)
          .get();
      return querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
    } catch (e) {
      print('Error al obtener semestres: $e');
      throw Exception('Error al obtener semestres');
    }
  }

  Future<List<Map<String, dynamic>>> getDocentes() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('docentes').get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error al obtener docentes: $e');
      throw Exception('Error al obtener docentes');
    }
  }

  Future<List<Map<String, dynamic>>> getMaterias() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('materias').get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print('Error al obtener materias: $e');
      throw Exception('Error al obtener materias');
    }
  }
  // Otros métodos para acceder y modificar datos en las colecciones
}
