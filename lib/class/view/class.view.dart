import 'package:flutter/material.dart';
import 'package:horarios/class/class.dart';
import 'package:horarios/shared/components/item.dart';

class ClassView extends StatefulWidget {
  const ClassView({super.key});

  @override
  State<ClassView> createState() => _ClassViewState();
}

class _ClassViewState extends State<ClassView> {
  List<Class> clases = [];

  
  @override
  Widget build(BuildContext context) {
    clases.add(Class(name: "Clase 1", description: "description", hoursDemanded: "hoursDemanded", semester: "semester", universityProgram: "universityProgram"));
    clases.add(Class(name: "Clase 2", description: "description", hoursDemanded: "hoursDemanded", semester: "semester", universityProgram: "universityProgram"));
    clases.add(Class(name: "Clase 3", description: "description", hoursDemanded: "hoursDemanded", semester: "semester", universityProgram: "universityProgram"));
    clases.add(Class(name: "Clase 4", description: "description", hoursDemanded: "hoursDemanded", semester: "semester", universityProgram: "universityProgram"));
    clases.add(Class(name: "Clase 5", description: "description", hoursDemanded: "hoursDemanded", semester: "semester", universityProgram: "universityProgram"));

    return 
      ListView.builder(
      itemCount: clases.length,
      itemBuilder: (BuildContext context, int index){
        return ItemOfList(data: clases[index], title: clases[index].name);
      },
    );
     

  }
}