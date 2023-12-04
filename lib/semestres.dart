import 'package:flutter/material.dart';
import 'package:horarios/class/view/class.view.dart';
import 'firebase_firestore.dart';
import 'package:horarios/teachers/view/professor.view.dart';

class SemestresPage extends StatefulWidget {
  final String? carreraId;

  SemestresPage({this.carreraId});

  @override
  _SemestresPageState createState() => _SemestresPageState();
}

class _SemestresPageState extends State<SemestresPage> {
  final FirebaseFirestoreService _firestoreService = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semestres'),
        actions: [
          IconButton(
            icon: Icon(Icons.view_module),
            onPressed: () {
              // Navegar a ClassView al hacer clic en el botón
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClassView(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _firestoreService.getSemestres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> semestres = snapshot.data!;

            // Filtrar los semestres según el carreraId si está presente
            if (widget.carreraId != null) {
              semestres = semestres
                  .where(
                      (semestre) => semestre['carrera_id'] == widget.carreraId)
                  .toList();
            }

            return ListView.builder(
              itemCount: semestres.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Al hacer clic en el semestre, navegar a la página de Materias
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClassView(
                          semestreId: semestres[index][
                              'id'], // Asegúrate de tener un campo 'id' en tus documentos de semestre
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nombre: ${semestres[index]['name']}'),
                          SizedBox(height: 8.0),
                          Text(
                              'Descripción: ${semestres[index]['description']}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
