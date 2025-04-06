import 'package:flutter/material.dart';
import 'package:graduation_project/constant.dart';

class CustoomizedElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double width;

  const CustoomizedElevatedButton({
    required this.text,
    required this.width,
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        "${text}",
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        fixedSize: Size(width, 55),
        backgroundColor: primaryColor,
      ),
    );
  }
}
