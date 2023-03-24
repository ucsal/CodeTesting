import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;
  const SectionTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.headline2(
        color: SafeColors.generalColors.secondary,
      ),
    );
  }
}
