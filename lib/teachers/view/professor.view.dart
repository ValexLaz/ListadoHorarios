import 'package:flutter/material.dart';
import 'package:horarios/semestres.dart';
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
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    // Cargar la lista de docentes al iniciar la pantalla
    loadProfessors();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> loadProfessors() async {
    try {
      List<Map<String, dynamic>> docentes =
          await _firestoreService.getDocentes();
      setState(() {
        professors = docentes;
      });
    } catch (e) {
      print('Error al cargar docentes: $e');
    }
  }

  Future<void> findDocente(String name) async {
    try {
      List<Map<String, dynamic>> docentes =
          await _firestoreService.findDocenteByName(name);
      setState(() {
        professors = docentes;
      });
    } catch (e) {
      print('Error al cargar docentes: $e');
    }
  }

  void clearSearch() {
    _searchController.clear();
    loadProfessors();
  }

  void onSearch() {
    String searchTerm = _searchController.text.trim();
    if (searchTerm.isNotEmpty) {
      findDocente(searchTerm);
    } else {
      loadProfessors();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profesores'),
        actions: [
          IconButton(
            icon: Icon(Icons.people),
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Buscar profesor',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: onSearch,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => onSearch(),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: clearSearch,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: professors.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemOfList(
                  data: professors[index],
                  title: professors[index]['name'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
