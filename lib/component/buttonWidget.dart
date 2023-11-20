import 'package:basecode/constan/constan.dart';
import 'package:basecode/helper/helper.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  Color color;
  Color colorTxt;
  ButtonWidget(
      {super.key,
      required this.text,
      required this.color,
      required this.colorTxt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 55,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text(
          text,
          style: HelperController.textStyle(14, whiteColor, FontWeight.bold),
        ),
      ),
    );
  }
}
