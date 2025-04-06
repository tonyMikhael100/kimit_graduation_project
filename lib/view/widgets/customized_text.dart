import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  const CustomizedText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color:color,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
