import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/domain/entity/test_entity.dart';

class TestCaseWidget extends StatelessWidget {
  final List<TestEntity>? tests;
  const TestCaseWidget({
    super.key,
    required this.tests,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                S.current.textInput,
                style: TextStyles.bodyText1().copyWith(
                  fontWeight: FontWeight.bold,
                  color: SafeColors.generalColors.secondary,
                ),
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                S.current.textOutput,
                style: TextStyles.bodyText1().copyWith(
                  fontWeight: FontWeight.bold,
                  color: SafeColors.generalColors.secondary,
                ),
              ),
            ),
          ),
        ],
        rows: List.generate(
          tests?.length ?? 0,
          (index) {
            final test = tests?[index];
            return DataRow(
              cells: [
                DataCell(Text(
                  test?.input ?? StringConstants.empty,
                  style: TextStyles.bodyText1().copyWith(
                    color: SafeColors.generalColors.secondary,
                  ),
                )),
                DataCell(Text(
                  test?.output ?? StringConstants.empty,
                  style: TextStyles.bodyText1().copyWith(
                    color: SafeColors.generalColors.secondary,
                  ),
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
