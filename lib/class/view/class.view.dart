import 'package:flutter/material.dart';
import 'package:horarios/shared/components/item.dart';
import 'package:horarios/firebase_firestore.dart';
import 'package:horarios/teachers/view/professor.view.dart'; // Asegúrate de importar la página de ProfessorView

class ClassView extends StatefulWidget {
  const ClassView({Key? key}) : super(key: key);

  @override
  State<ClassView> createState() => _ClassViewState();
}

class _ClassViewState extends State<ClassView> {
  List<Map<String, dynamic>> materias = [];
  final FirebaseFirestoreService _firestoreService = FirebaseFirestoreService();

  @override
  void initState() {
    super.initState();
    _loadMaterias();
  }

  Future<void> _loadMaterias() async {
    try {
      List<Map<String, dynamic>> materiasData =
          await _firestoreService.getMaterias();
      setState(() {
        materias = materiasData;
      });
    } catch (e) {
      // Manejar el error
      print('Error al cargar materias: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Materias'),
        actions: [
          IconButton(
            icon: Icon(Icons.people), // Puedes cambiar el icono según tus preferencias
            onPressed: () {
              // Navegar a ProfessorView al hacer clic en el botón
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfessorView(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: materias.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemOfList(
            data: materias[index],
            title: materias[index]['name'],
          );
        },
      ),
    );
  }
}
