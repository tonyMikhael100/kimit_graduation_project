import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizedTextfield extends StatelessWidget {
  final String title;
  final IconData? preffixIcon;
  final IconData? suffixIcon;
  final void Function(String)? onChanged;
  const CustomizedTextfield({
    super.key,
    required this.title,
    this.preffixIcon,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        hintText: "${title}",
        prefixIcon: Icon(preffixIcon),
        suffixIcon: Icon(suffixIcon),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
