import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/bloc/task_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/answer_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/send_answer_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/answer_widget.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/sextion_title_widget.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/task_description_widget.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/tests_case_widget.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/text_body_section_widget.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/config/safe_layout.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_dialogs.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
import 'package:projetofinal_mobile/src/domain/entity/task_entity.dart';
import 'package:projetofinal_mobile/src/domain/entity/test_entity.dart';
import 'package:projetofinal_mobile/src/domain/entity/user_entity.dart';
import 'package:projetofinal_mobile/src/domain/use_case/do_register_use_case.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/requests/request_send_task.dart';

class TaskPage extends StatefulWidget {
  static const route = '/task';
  final TaskEntity task;

  const TaskPage({
    super.key,
    required this.task,
  });

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends ModularState<TaskPage, TaskBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
    getAllAnswers();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> getAllAnswers() async {
    if (widget.task.quizId == null) {
      await controller.getMyAnswers(widget.task.id);
    }
    await controller.getAnswers(task: widget.task);
    await controller.getTests(widget.task.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.task.title ?? StringConstants.empty,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () async {
              await getAllAnswers();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Modular.to
              .pushNamed(
            TasksPage.route + SendAnswerPage.route,
            arguments: RequestSendTask(
              taskId: widget.task.id,
              userId: controller.user.id,
              quizId: widget.task.quizId,
            ),
          )
              .then((value) async {
            if (value != null) {
              await getAllAnswers();
              return SafeDialog(
                title: S.current.textSubmited,
                message: S.current.textSubmitedWithSuccess,
                onTap: () => Modular.to.pop(),
              ).show();
            }
          });
        },
        backgroundColor: SafeColors.buttonColors.primary,
        child: const Icon(Icons.add),
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
              SectionTitleWidget(title: S.current.textTitle),
              const SizedBox(height: 5),
              TextBodySectionWidget(text: widget.task.title),
              const SizedBox(height: 20),
              SectionTitleWidget(title: S.current.textDescription),
              const SizedBox(height: 5),
              TaskDescriptionWidget(text: widget.task.description),
              const SizedBox(height: 20),
              StreamBuilder<SafeEvent<List<TestEntity>>>(
                  stream: controller.testsController.stream,
                  builder: (context, snapshot) {
                    final tests = snapshot.data?.data;
                    return Visibility(
                      visible: tests?.isNotEmpty ?? false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitleWidget(
                            title: S.current.textPossibleTests,
                          ),
                          SafeLayout(
                            snapshot: snapshot,
                            context: context,
                            onDone: () {},
                            showErrorDialog: controller.isShowErrorDialog,
                            onError: TextBodySectionWidget(
                              text: snapshot.error.toString(),
                            ),
                            onCompleted: TestCaseWidget(tests: tests),
                          ).build
                        ],
                      ),
                    );
                  }),
              const SizedBox(height: 20),
              StreamBuilder<SafeEvent<List<AnswerEntity>>>(
                  stream: controller.getAnswersController.stream,
                  builder: (context, snapshot) {
                    final answers = snapshot.data?.data;
                    return Visibility(
                      visible: controller.userRole != RoleEnum.student,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitleWidget(title: S.current.textAnswers),
                          const SizedBox(height: 15),
                          SafeLayout(
                            snapshot: snapshot,
                            context: context,
                            onDone: () {},
                            showErrorDialog: controller.isShowErrorDialog,
                            onError: TextBodySectionWidget(
                              text: snapshot.error.toString(),
                            ),
                            onCompleted: Column(
                              children: List.generate(
                                answers?.length ?? 0,
                                (index) => AnswerWidget(
                                  name: answers?[index].user?.name,
                                  date: answers?[index].sendDate,
                                  onTap: () async => Modular.to.pushNamed(
                                    TasksPage.route + AnswerPage.route,
                                    arguments: answers?[index],
                                  ),
                                ),
                              ),
                            ),
                          ).build
                        ],
                      ),
                    );
                  }),
              const SizedBox(height: 20),
              StreamBuilder<SafeEvent<List<AnswerEntity>>>(
                  stream: controller.getMyAnswersController.stream,
                  builder: (context, snapshot) {
                    final answers = snapshot.data?.data;
                    return Visibility(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionTitleWidget(title: S.current.textMyAnswers),
                          const SizedBox(height: 15),
                          SafeLayout(
                            snapshot: snapshot,
                            context: context,
                            onDone: () {},
                            showErrorDialog: controller.isShowErrorDialog,
                            onError: TextBodySectionWidget(
                              text: snapshot.error.toString(),
                            ),
                            onCompleted: Column(
                              children: List.generate(
                                answers?.length ?? 0,
                                (index) => StreamBuilder<UserEntity>(
                                    stream: controller.userController.stream,
                                    builder: (context, snapshot) {
                                      final user = snapshot.data;
                                      return AnswerWidget(
                                        date: answers?[index].sendDate,
                                        name:
                                            user?.name ?? controller.user.name,
                                        onTap: () async => Modular.to.pushNamed(
                                          TasksPage.route + AnswerPage.route,
                                          arguments: answers?[index],
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ).build
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
