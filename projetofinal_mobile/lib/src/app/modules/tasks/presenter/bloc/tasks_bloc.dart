import 'dart:async';

import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_bloc.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/task_entity.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_tasks_use_case.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/api_interceptors.dart';

class TasksBloc extends SafeBloC {
  final GetTasksUseCase getTasksUseCase;

  late StreamController<SafeEvent<List<TaskEntity>>> getTasksController;

  TasksBloc({
    required this.getTasksUseCase,
  }) {
    init();
  }

  @override
  Future<void> init() async {
    getTasksController = StreamController.broadcast();
    getTasks();
  }

  Future<void> getTasks() async {
    try {
      getTasksController.sink.add(SafeEvent.load());
      List<TaskEntity> tasks = await getTasksUseCase();
      getTasksController.sink.add(SafeEvent.done(tasks));
    } catch (e) {
      await ApiInterceptors.checkExpiration(e);
      SafeLogUtil.instance.logError(e);
      getTasksController.sink.addError(e.toString());
    }
  }

  @override
  Future<void> dispose() async {}
}
