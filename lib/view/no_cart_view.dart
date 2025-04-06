import 'package:flutter/material.dart';
import 'package:graduation_project/constant.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:graduation_project/model/widgets/customized_text.dart';

class NoCartView extends StatelessWidget {
  const NoCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomizedText(
        color: primaryColor,
        fontSize: 28,
        text: S.of(context).Cart_is_empty,
      ),
    );
  }
}
