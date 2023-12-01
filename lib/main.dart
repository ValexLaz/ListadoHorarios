import 'dart:math';
import 'package:flutter/material.dart';
import 'package:horarios/home/home_view.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            CustomPaint(
              size: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              painter: FondoPersonalizado(),
            ),
            HomeView()
          ],
        ),
      ),
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
