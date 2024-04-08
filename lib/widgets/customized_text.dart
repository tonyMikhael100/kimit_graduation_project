import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomizedText extends StatelessWidget {
  final String text;
  final double fontSize;
  const CustomizedText({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
