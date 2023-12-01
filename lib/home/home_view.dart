import 'dart:math';

import 'package:flutter/material.dart';
import 'package:horarios/carreras.dart';
import 'package:horarios/class/view/class.view.dart';
import 'package:horarios/home/components/card_preset.dart';
import 'package:horarios/semestres.dart';
import 'package:horarios/teachers/view/professor.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
          painter: FondoPersonalizado(),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 25, top: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5FF),
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: Color.fromARGB(255, 174, 174, 252),
                    width: 4,
                  ),
                ),
                height: 250,
                child: Image.asset('assets/images/introduction.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardPresentation(
                    margin: EdgeInsets.only(right: 6, bottom: 25),
                    colors: Color.fromARGB(186, 8, 42, 79),
                    height: 300,
                    section: "Docentes",
                    nextpage: ProfessorView(),
                  ),
                  CardPresentation(
                    margin: EdgeInsets.only(left: 6, bottom: 25),
                    colors: Color.fromARGB(168, 2, 150, 61),
                    height: 300,
                    section: "Semestre",
                    nextpage: SemestresPage(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardPresentation(
                    margin: EdgeInsets.only(right: 6, bottom: 25),
                    colors: Color.fromARGB(172, 166, 12, 7),
                    height: 300,
                    section: "Carreras",
                    nextpage: CarrerasPage(),
                  ),
                  CardPresentation(
                    margin: EdgeInsets.only(left: 6, bottom: 25),
                    colors: Color.fromARGB(172, 54, 17, 124),
                    height: 300,
                    section: "Materias",
                    nextpage: ClassView(),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class FondoPersonalizado extends CustomPainter {
  final List<Color> circleColors = [
    Color.fromARGB(129, 151, 130, 236),
    Color.fromARGB(157, 110, 55, 212),
    Color.fromARGB(130, 160, 85, 195),
    Color.fromARGB(126, 139, 87, 237)
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final random = Random();
    final numberOfColors = circleColors.length;

    for (int i = 0; i < 7; i++) {
      final circleRadius =
          random.nextDouble() * 80 + 40; // Tamaños aleatorios entre 20 y 70
      final circleX = random.nextDouble() * size.width;
      final circleY = random.nextDouble() * size.height;

      paint.color = circleColors[
          i % numberOfColors]; // Selecciona los colores de forma cíclica
      canvas.drawCircle(Offset(circleX, circleY), circleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
