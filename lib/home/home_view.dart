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
    return Container(
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
    );
  }
}
