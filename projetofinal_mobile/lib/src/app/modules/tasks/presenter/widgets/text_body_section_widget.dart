import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';

class TextBodySectionWidget extends StatelessWidget {
  final String? text;
  const TextBodySectionWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? StringConstants.empty,
      style: TextStyles.bodyText1(
        color: SafeColors.generalColors.secondary,
      ),
    );
  }
}
