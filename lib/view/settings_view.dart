import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:graduation_project/cubits/auth_cubit/auth_cubit.dart';
import 'package:graduation_project/cubits/books_cubit/books_cubit.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/model/widgets/customized_settings_item.dart';
import 'package:graduation_project/model/widgets/customized_text.dart';
import 'package:graduation_project/view/authantication_view/sign_in_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var myCubit = BlocProvider.of<BooksCubit>(context);
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomizedText(
                text: S.of(context).Settings,
                fontSize: 24,
                color: Colors.white,
              ),
            ],
          ),
          ListTile(
            title: CustomizedText(
                text: "${authCubit.homeName}",
                fontSize: 18,
                color: Colors.white),
            subtitle: Text(
              "${authCubit.homeEmail}",
              style: TextStyle(color: Colors.grey[300]),
            ),
            trailing: CircleAvatar(
              backgroundImage: NetworkImage('${authCubit.homeImage}'),
            ),
          ),
          const Divider(
            color: Colors.grey,
          ),
          CustomizedSettingItem(
            icon: Icons.language,
            title: S.of(context).Change_language,
            onTap: () {
              myCubit.changeLanguage();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          CustomizedSettingItem(
            icon: Icons.logout,
            title: S.of(context).Log_out,
            onTap: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return SignInView();
              }), (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
