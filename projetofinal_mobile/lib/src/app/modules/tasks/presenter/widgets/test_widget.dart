import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_dialogs.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/domain/entity/test_entity.dart';

class TestWidget extends StatelessWidget {
  final TestEntity? test;
  final int index;
  const TestWidget({
    super.key,
    required this.test,
    required this.index,
  });

  Color get color {
    if (test?.runtimeException ?? false) return SafeColors.statusColors.alert;
    if (test?.isCorrect ?? false) {
      return SafeColors.statusColors.success;
    } else if (test?.isCorrect == false) {
      return SafeColors.statusColors.error;
    } else {
      return SafeColors.statusColors.alert;
    }
  }

  IconData get icon {
    if (test?.runtimeException ?? false) return Icons.warning_amber_rounded;
    if (test?.isCorrect ?? false) {
      return Icons.check_circle_outline_outlined;
    } else if (test?.isCorrect == false) {
      return Icons.cancel_outlined;
    } else {
      return Icons.warning_amber_rounded;
    }
  }

  String get messageDialog {
    if (test?.runtimeException ?? false) {
      return test?.exceptionSimplificada ?? S.current.errorSomethingWentWrong;
    } else {
      String input = (test?.input?.isEmpty ?? true)
          ? StringConstants.empty
          : "${S.current.textInput}: ${test?.input}\n";
      String output = (test?.output?.isEmpty ?? true)
          ? StringConstants.empty
          : "${S.current.textOutputObtained}: ${test?.output}\n";
      String expected = (test?.expectedOutput?.isEmpty ?? true)
          ? StringConstants.empty
          : "${S.current.textOutputExpected}: ${test?.expectedOutput}\n";
      return '$input$output$expected';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => SafeDialog(
          title: S.current.textResult,
          message: messageDialog,
          onTap: Modular.to.pop,
        ),
      ),
      child: Container(
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
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(width: 10),
            Text(
              test?.name ?? '${S.current.textTest} ${index + 1}',
              style: TextStyles.subtitle1().copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
