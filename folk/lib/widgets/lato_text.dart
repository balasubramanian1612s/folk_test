import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LatoText extends StatelessWidget {
  String text;
  double size;
  Color color;
  LatoText(@required this.text, @required this.size, @required this.color);
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      minFontSize: 10,
      style: GoogleFonts.lato(
        fontWeight: FontWeight.bold,
        color: color,
        textStyle: TextStyle(fontSize: size),
      ),
    );
  }
}
