import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/bloc/tasks_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/task_widget.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/config/safe_layout.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_app_bar.dart';

import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/task_entity.dart';

class TasksPage extends StatefulWidget {
  static const route = '/tasks';
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends ModularState<TasksPage, TasksBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: SafeAppBar(
        title: S.of(context).textTasks,
        onRefresh: () => controller.getTasks(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: StreamBuilder<SafeEvent<List<TaskEntity>>>(
            stream: controller.getTasksController.stream,
            builder: (context, snapshot) {
              final tasks = snapshot.data?.data;
              return SafeLayout(
                snapshot: snapshot,
                context: context,
                onDone: () {},
                onCompleted: Column(
                  children: List.generate(
                    tasks?.length ?? 0,
                    (index) => TaskWidget(task: tasks?[index]),
                  ),
                ),
              ).build;
            },
          ),
        ),
      ),
    );
  }
}
