import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/bloc/quiz_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/sextion_title_widget.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/task_widget.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/text_body_section_widget.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/config/safe_layout.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/core/util/formatter_util.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/quiz_entity.dart';
import 'package:projetofinal_mobile/src/domain/entity/task_entity.dart';

class QuizPage extends StatefulWidget {
  static const route = '/quiz';
  final QuizEntity quiz;

  const QuizPage({
    super.key,
    required this.quiz,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends ModularState<QuizPage, QuizBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
    bloc.getTasks(widget.quiz.id);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          widget.quiz.name ?? StringConstants.empty,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitleWidget(title: S.current.textDeadline),
              const SizedBox(height: 5),
              TextBodySectionWidget(
                  text:
                      '${S.current.textStartDate}: ${FormatterUtil.dateFromAPI(
                widget.quiz.startDate ?? StringConstants.empty,
                isFullDate: true,
              )}'),
              TextBodySectionWidget(
                  text:
                      '${S.current.textFinalDate}: ${FormatterUtil.dateFromAPI(
                widget.quiz.endDate ?? StringConstants.empty,
                isFullDate: true,
              )}'),
              const SizedBox(height: 20),
              StreamBuilder<SafeEvent<List<TaskEntity>>>(
                  stream: controller.getTasksController.stream,
                  builder: (context, snapshot) {
                    final tasks = snapshot.data?.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitleWidget(title: S.current.textTasks),
                        const SizedBox(height: 15),
                        SafeLayout(
                          snapshot: snapshot,
                          context: context,
                          onDone: () {},
                          showErrorDialog: false,
                          onError: TextBodySectionWidget(
                            text: snapshot.error.toString(),
                          ),
                          onCompleted: Column(
                            children: List.generate(
                              tasks?.length ?? 0,
                              (index) {
                                final task = tasks?[index];
                                task?.quizId = widget.quiz.id;
                                return TaskWidget(task: task);
                              },
                            ),
                          ),
                        ).build
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
