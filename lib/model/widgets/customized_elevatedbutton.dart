import 'package:flutter/material.dart';
import 'package:graduation_project/constant.dart';

class CustoomizedElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustoomizedElevatedButton({
    required this.text,
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
        fixedSize: Size(MediaQuery.of(context).size.width * 0.4, 55),
        backgroundColor: primaryColor,
      ),
    );
  }
}
