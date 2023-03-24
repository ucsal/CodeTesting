import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/test_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service_interface.dart';

class GetTestsByTaskIdUseCase implements SafeUseCase {
  late final ITasksService _service;

  GetTestsByTaskIdUseCase() {
    _service = Modular.get<ITasksService>();
  }

  Future<List<TestEntity>> call({required int? taskId}) async {
    if (taskId != null) {
      final response = await _service.getTestsByTaskId(taskId);

      return response.map((e) => TestEntity.toEntity(e)).toList();
    }
    return [];
  }
}
