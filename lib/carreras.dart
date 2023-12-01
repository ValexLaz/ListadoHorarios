import 'package:flutter/material.dart';
import 'firebase_firestore.dart';
import 'package:horarios/shared/components/item.dart'; // Asegúrate de importar este paquete si no lo has hecho
import 'semestres.dart'; // Asegúrate de importar la página de semestres

class CarrerasPage extends StatefulWidget {
  @override
  _CarrerasPageState createState() => _CarrerasPageState();
}

class _CarrerasPageState extends State<CarrerasPage> {
  final FirebaseFirestoreService _firestoreService = FirebaseFirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carreras'),
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today), // Puedes cambiar el icono según tus preferencias
            onPressed: () {
              // Navegar a SemestresPage al hacer clic en el botón
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SemestresPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        // Obtener la lista de carreras desde Firestore
        future: _firestoreService.getCarreras(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> carreras = snapshot.data!;
            return ListView.builder(
              itemCount: carreras.length,
              itemBuilder: (context, index) {
                return ItemOfList(
                  data: carreras[index],
                  title: carreras[index]['name'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
