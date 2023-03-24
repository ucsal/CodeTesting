import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/pages/quiz_page.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/pages/quizzes_page.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/core/util/formatter_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/quiz_entity.dart';

class QuizWidget extends StatelessWidget {
  final QuizEntity? quiz;

  const QuizWidget({
    Key? key,
    required this.quiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const backRoute = '/app${QuizzesPage.route}';
    return GestureDetector(
      onTap: () async => Modular.to.pushNamed(
        backRoute + QuizPage.route,
        arguments: quiz,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: SafeColors.generalColors.secondary.withOpacity(0.1),
          border: Border.all(color: SafeColors.generalColors.secondary),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quiz?.name ?? StringConstants.hyphen,
              style: TextStyles.headline3(
                color: SafeColors.generalColors.secondary,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text(
              '${S.current.textFinalDate}: ${FormatterUtil.dateFromAPI(
                quiz?.endDate ?? StringConstants.empty,
                isFullDate: true,
              )}',
              style: TextStyles.bodyText1(
                color: SafeColors.generalColors.secondary,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
