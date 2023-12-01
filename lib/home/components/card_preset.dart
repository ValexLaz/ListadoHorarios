import 'package:flutter/material.dart';

class CardPresentation extends StatefulWidget {
  final EdgeInsets margin;
  final Color colors;
  final double height;
  final String section;
  final Widget nextpage;
  const CardPresentation(
      {super.key,
      required this.margin,
      required this.colors,
      required this.height,
      required this.section, required this.nextpage});

  @override
  State<CardPresentation> createState() => _CardPresentationState();
}

class _CardPresentationState extends State<CardPresentation> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: widget.colors,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: widget.margin,
        height: widget.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Transform(
                transform: Matrix4.identity()
                  ..translate(27, 100)
                  ..rotateZ(-1.08),
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 49,
                    fontFamily: 'Chewy',
                    fontWeight: FontWeight.w400,
                  ),
                  child: Text(widget.section),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child:GestureDetector(
                onTap: (){
                                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => widget.nextpage),
                  );
                },
                child:Padding(
                padding: EdgeInsets.only(right: 15, bottom: 15),
                child: Icon(
                  Icons.arrow_circle_right,
                  color: Colors.white,
                  size: 60,
                ),
              ) ,
              ) 
              
            ),
          ],
        ),
      ),
    );
  }
}
