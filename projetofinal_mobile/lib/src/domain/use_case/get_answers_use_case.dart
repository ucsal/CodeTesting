import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service_interface.dart';

class GetAnswersUseCase implements SafeUseCase {
  late final ITasksService _service;

  GetAnswersUseCase() {
    _service = Modular.get<ITasksService>();
  }

  Future<List<AnswerEntity>> call({required int? taskId}) async {
    if (taskId != null) {
      final response = await _service.getAnswersByTaskId(taskId);

      return response.map((e) => AnswerEntity.toEntity(e)).toList();
    }
    return [];
  }
}
