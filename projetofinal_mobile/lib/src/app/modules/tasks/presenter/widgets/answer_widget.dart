import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/core/util/formatter_util.dart';

class AnswerWidget extends StatelessWidget {
  final String? name;
  final String? date;
  final void Function()? onTap;
  const AnswerWidget({
    super.key,
    this.name = StringConstants.empty,
    this.date = StringConstants.empty,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: SafeColors.generalColors.secondary.withOpacity(0.1),
          border: Border.all(color: SafeColors.generalColors.secondary),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              name ?? StringConstants.empty,
              style: TextStyles.subtitle1().copyWith(
                color: SafeColors.generalColors.secondary,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(width: 10),
            Text(
              '(${FormatterUtil.dateFromAPI(date ?? StringConstants.empty)})',
              style: TextStyles.bodyText2().copyWith(
                color: SafeColors.generalColors.secondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: SafeColors.generalColors.secondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
