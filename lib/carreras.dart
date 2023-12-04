import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'firebase_firestore.dart';
import 'package:horarios/shared/components/item.dart';
import 'semestres.dart';

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
            icon: Icon(Icons.calendar_today),
            onPressed: () {
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
      body: FutureBuilder<List<QueryDocumentSnapshot>>(
        future: _firestoreService.getCarreras(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<QueryDocumentSnapshot> carrerasSnapshots = snapshot.data!;
            return ListView.builder(
              itemCount: carrerasSnapshots.length,
              itemBuilder: (context, index) {
                var carreraSnapshot = carrerasSnapshots[index];
                var documentId = carreraSnapshot.id; // Utilizar la propiedad id del QueryDocumentSnapshot

                var carreraData = carreraSnapshot.data() as Map<String, dynamic>;

                return InkWell(
                  onTap: () {
                    print('ID del documento: $documentId');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SemestresPage(
                          carreraId: documentId,
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
                          Text('Nombre: ${carreraData['name']}'),
                          SizedBox(height: 8.0),
                          Text('Descripción: ${carreraData['description']}'),
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
