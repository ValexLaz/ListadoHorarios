import 'package:flutter/material.dart';
import 'firebase_firestore.dart';
import 'package:horarios/shared/components/item.dart'; // Asegúrate de importar este paquete si no lo has hecho
import 'class/view/class.view.dart'; // Asegúrate de importar la página de ClassView

class SemestresPage extends StatefulWidget {
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
            icon: Icon(Icons.view_module), // Puedes cambiar el icono según tus preferencias
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
        // Obtener la lista de semestres desde Firestore
        future: _firestoreService.getSemestres(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> semestres = snapshot.data!;
            return ListView.builder(
              itemCount: semestres.length,
              itemBuilder: (context, index) {
                return ItemOfList(
                  data: semestres[index],
                  title: semestres[index]['name'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
