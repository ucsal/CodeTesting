import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/task_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/domain/entity/task_entity.dart';

class TaskWidget extends StatelessWidget {
  final TaskEntity? task;

  const TaskWidget({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => Modular.to.pushNamed(
        TasksPage.route + TaskPage.route,
        arguments: task,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
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
              task?.title ?? StringConstants.hyphen,
              style: TextStyles.headline3(
                color: SafeColors.generalColors.secondary,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text(
              task?.description ?? StringConstants.hyphen,
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
