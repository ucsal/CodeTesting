import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/task_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service_interface.dart';

class GetTasksUseCase implements SafeUseCase {
  late final ITasksService _service;

  GetTasksUseCase() {
    _service = Modular.get<ITasksService>();
  }

  Future<List<TaskEntity>> call() async {
    final response = await _service.getTasks();
    return response.map((e) => TaskEntity.toEntity(e)).toList();
  }
}
