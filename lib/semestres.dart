import 'package:flutter/material.dart';
import 'firebase_firestore.dart';
import 'semestre_card.dart';

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
                return SemestreCard(
                  name: semestres[index]['name'],
                  description: semestres[index]['description'],
                );
              },
            );
          }
        },
      ),
    );
  }
}
