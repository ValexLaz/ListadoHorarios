import 'package:flutter/material.dart';

class CardPresentation extends StatefulWidget {
  final EdgeInsets margin;
  final Color colors;
  final double height;
  const CardPresentation(
      {super.key,
      required this.margin,
      required this.colors,
      required this.height});

  @override
  State<CardPresentation> createState() => _CardPresentationState();
}

class _CardPresentationState extends State<CardPresentation> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: widget.colors, borderRadius: BorderRadius.circular(12)),
      margin: widget.margin,
      height: widget.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Icon(
            Icons.access_time_sharp,
            size: 50,
          )),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                border: Border.all(color: Colors.black, width: 0.5),
                color: Color.fromARGB(255, 79, 169, 211)),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Center(
              child: Text(
                "Section",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
