import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/test_widget.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/domain/entity/result_entity.dart';

class ResultWidget extends StatelessWidget {
  final ResultEntity? result;
  const ResultWidget({
    super.key,
    required this.result,
  });

  Color get color {
    if (result?.percentage == 0 && (result?.percentage ?? 0) < 20) {
      return SafeColors.statusColors.error;
    } else if (result?.percentage == 100) {
      return SafeColors.statusColors.success;
    } else {
      return SafeColors.statusColors.alert;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.08,
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Text(
                '${S.current.textResult}${StringConstants.colon}',
                style: TextStyles.subtitle1().copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 10),
              Text(
                '${result?.percentage}${StringConstants.percent}',
                style: TextStyles.bodyText1().copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Text(
          S.current.textTest,
          style: TextStyles.headline2(
            color: SafeColors.generalColors.secondary,
          ),
        ),
        const SizedBox(height: 10),
        ...List.generate(
          result?.tests?.length ?? 0,
          (index) => TestWidget(
            index: index,
            test: result?.tests?[index],
          ),
        ),
      ],
    );
  }
}
