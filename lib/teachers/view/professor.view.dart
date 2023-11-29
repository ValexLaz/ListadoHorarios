import 'package:flutter/material.dart';
import 'package:horarios/shared/components/item.dart';
import 'package:horarios/firebase_firestore.dart';

class ProfessorView extends StatefulWidget {
  const ProfessorView({Key? key}) : super(key: key);

  @override
  State<ProfessorView> createState() => _ProfessorViewState();
}

class _ProfessorViewState extends State<ProfessorView> {
  final FirebaseFirestoreService _firestoreService = FirebaseFirestoreService();
  List<Map<String, dynamic>> professors = [];

  @override
  void initState() {
    super.initState();
    // Cargar la lista de docentes al iniciar la pantalla
    loadProfessors();
  }

  Future<void> loadProfessors() async {
    try {
      List<Map<String, dynamic>> docentes = await _firestoreService.getDocentes();
      setState(() {
        professors = docentes;
      });
    } catch (e) {
      print('Error al cargar docentes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: professors.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemOfList(data: professors[index], title: professors[index]['name']);
      },
    );
  }
}
