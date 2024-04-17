import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizedSettingItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;

  const CustomizedSettingItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.white.withOpacity(0.1),
        child: ListTile(
          title: Text("${title}"),
          trailing: Icon(icon),
        ),
      ),
    );
  }
}
