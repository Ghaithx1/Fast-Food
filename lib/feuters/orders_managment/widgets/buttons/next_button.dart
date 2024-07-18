import 'package:fast_food/core/theming/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class nextButton extends StatelessWidget {
  final VoidCallback callback; 
  String text;
  nextButton(this.callback,{required this.fontSize ,required this.text , super.key});
  double fontSize = 80;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(colorManager.mainorange),
        //TODO: i will find another solution for this
       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))
        ),
      onPressed: callback,
      child:  Text(
        text,
        style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      ));
  }
}
