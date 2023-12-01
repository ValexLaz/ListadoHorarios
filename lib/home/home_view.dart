import 'dart:math';

import 'package:flutter/material.dart';
import 'package:horarios/home/components/card_preset.dart';

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
                    color: Color.fromARGB(255, 49, 172, 160),
                    borderRadius: BorderRadius.circular(22)),
                height: 220,
                child: Text("Card1"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardPresentation(
                      margin: EdgeInsets.only(right: 6, bottom: 25),
                      colors: Color.fromARGB(104, 31, 120, 215),
                      height: 140),
                  CardPresentation(
                      margin: EdgeInsets.only(left: 6, bottom: 25),
                      colors: Color.fromARGB(117, 146, 174, 157),
                      height: 140),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardPresentation(
                      margin: EdgeInsets.only(right: 6, bottom: 25),
                      colors: Color.fromARGB(104, 31, 120, 215),
                      height: 140),
                  CardPresentation(
                      margin: EdgeInsets.only(left: 6, bottom: 25),
                      colors: Color.fromARGB(117, 146, 174, 157),
                      height: 140),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardPresentation(
                      margin: EdgeInsets.only(right: 6, bottom: 25),
                      colors: Color.fromARGB(104, 31, 120, 215),
                      height: 140),
                  CardPresentation(
                      margin: EdgeInsets.only(left: 6, bottom: 25),
                      colors: Color.fromARGB(117, 146, 174, 157),
                      height: 140),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardPresentation(
                      margin: EdgeInsets.only(right: 6, bottom: 25),
                      colors: Color.fromARGB(104, 31, 120, 215),
                      height: 140),
                  CardPresentation(
                      margin: EdgeInsets.only(left: 6, bottom: 25),
                      colors: Color.fromARGB(117, 146, 174, 157),
                      height: 140),
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
