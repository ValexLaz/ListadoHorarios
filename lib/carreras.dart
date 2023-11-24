import 'package:flutter/material.dart';
import 'carrera_card.dart';
import 'firebase_firestore.dart';

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
                return CarreraCard(
                  name: carreras[index]['name'],
                  description: carreras[index]['description'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
