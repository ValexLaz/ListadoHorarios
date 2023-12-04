import 'package:flutter/material.dart';
import 'package:horarios/firebase_firestore.dart';
import 'package:horarios/teachers/view/professor.view.dart';

class ClassView extends StatefulWidget {
  final String? semestreId;

  ClassView({this.semestreId});

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

      // Filtrar las materias según el semestreId si está presente
      if (widget.semestreId != null) {
        materiasData = materiasData
            .where((materia) => materia['semestre_id'] == widget.semestreId)
            .toList();
      }

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
            icon: Icon(
              Icons.people,
            ),
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
          final materia = materias[index];

          return Card(
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre: ${materia['name']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text('Descripción: ${materia['description']}'),
                  SizedBox(height: 8.0),
                  Text('Hora Inicio: ${materia['hora_inicio']}'),
                  SizedBox(height: 8.0),
                  Text('Hora Fin: ${materia['hora_fin']}'),
                  SizedBox(height: 8.0),
                  Text(
                    'Días: ${materia['dias'].join(', ')}',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 8.0),
                  Text('Docente: ${materia['docente_id']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
