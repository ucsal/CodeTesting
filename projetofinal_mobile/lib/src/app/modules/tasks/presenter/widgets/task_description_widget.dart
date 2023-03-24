import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';

class TaskDescriptionWidget extends StatefulWidget {
  final String? text;
  const TaskDescriptionWidget({super.key, this.text});

  @override
  State<TaskDescriptionWidget> createState() => _TaskDescriptionWidgetState();
}

class _TaskDescriptionWidgetState extends State<TaskDescriptionWidget> {
  String firstHalf = StringConstants.empty;
  String secondHalf = StringConstants.empty;
  bool showMore = true;
  final descriptionLimit = 100;

  @override
  void initState() {
    super.initState();
    checkTextLenght();
  }

  void checkTextLenght() {
    final textLength = widget.text?.length ?? 0;
    if (textLength > descriptionLimit) {
      firstHalf =
          widget.text?.substring(0, descriptionLimit) ?? StringConstants.empty;
      secondHalf = widget.text?.substring(descriptionLimit, textLength) ??
          StringConstants.empty;
    } else {
      firstHalf = widget.text ?? StringConstants.empty;
      secondHalf = StringConstants.empty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(
              firstHalf,
              style: TextStyles.bodyText1(
                color: SafeColors.generalColors.secondary,
              ),
            )
          : Column(
              children: [
                Text(
                  showMore
                      ? ("$firstHalf${StringConstants.more}")
                      : (firstHalf + secondHalf),
                  style: TextStyles.bodyText1(
                    color: SafeColors.generalColors.secondary,
                  ),
                ),
                const SizedBox(height: 5.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () => setState(() => showMore = !showMore),
                    child: Text(
                      showMore
                          ? S.current.textShowMore
                          : S.current.textShowLess,
                      style: TextStyles.bodyText1().copyWith(
                        color: SafeColors.generalColors.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
