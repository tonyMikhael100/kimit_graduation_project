import 'package:flutter/material.dart';

class CustomizeTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hintText;
  final IconData? preffixIcon;
  final IconData? suffixIcon;
  final TextInputType? textInputType;
  final void Function(String) onChanged;
  const CustomizeTextFormField({
    required this.hintText,
    required this.validator,
    required this.onChanged,
    this.preffixIcon,
    this.suffixIcon,
    this.textInputType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      validator: validator,
      keyboardType: textInputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        fillColor: Colors.grey.withOpacity(0.1),
        filled: true,
        hintText: hintText,
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
