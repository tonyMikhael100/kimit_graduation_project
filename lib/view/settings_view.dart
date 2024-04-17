import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/model/widgets/customized_settings_item.dart';
import 'package:graduation_project/model/widgets/customized_text.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomizedText(
                text: "Settings",
                fontSize: 24,
                color: Colors.white,
              ),
            ],
          ),
          ListTile(
            title: const CustomizedText(
                text: "Tony Mikhael sorya", fontSize: 18, color: Colors.white),
            subtitle: Text(
              "tonyMikhael100@gmail.com",
              style: TextStyle(color: Colors.grey[300]),
            ),
            trailing: const CircleAvatar(),
          ),
          const Divider(
            color: Colors.grey,
          ),
          CustomizedSettingItem(
            icon: Icons.language,
            title: "Change language",
            onTap: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          CustomizedSettingItem(
            icon: Icons.logout,
            title: "Log out",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
