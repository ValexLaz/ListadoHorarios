import 'package:flutter/material.dart';
import 'package:horarios/shared/components/item.dart';
import 'package:horarios/teachers/professor.dart';

class ProfessorView extends StatefulWidget {
  const ProfessorView({super.key});

  @override
  State<ProfessorView> createState() => _ProfessorViewState();
}

class _ProfessorViewState extends State<ProfessorView> {
  
    List<Professor> professor = [];
    
  @override
  Widget build(BuildContext context) {
    
    professor.add(Professor(name: "Professor 1", lastname: "lastname", cellphoneNumber: "cellphoneNumber", ciNumber: "ciNumber", email: "email"));
    professor.add(Professor(name: "Professor 2", lastname: "lastname", cellphoneNumber: "cellphoneNumber", ciNumber: "ciNumber", email: "email"));
    professor.add(Professor(name: "Professor 3", lastname: "lastname", cellphoneNumber: "cellphoneNumber", ciNumber: "ciNumber", email: "email"));

    professor.add(Professor(name: "Professor 4", lastname: "lastname", cellphoneNumber: "cellphoneNumber", ciNumber: "ciNumber", email: "email"));
    professor.add(Professor(name: "Professor 5", lastname: "lastname", cellphoneNumber: "cellphoneNumber", ciNumber: "ciNumber", email: "email"));

    return 
      ListView.builder(
      itemCount: professor.length,
      itemBuilder: (BuildContext context, int index){
        return ItemOfList(data: professor[index], title: professor[index].name);
      },
    );
  }
}