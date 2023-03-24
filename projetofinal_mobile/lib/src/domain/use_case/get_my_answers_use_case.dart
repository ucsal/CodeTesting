import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service_interface.dart';

class GetMyAnswersUseCase implements SafeUseCase {
  late final ITasksService _service;

  GetMyAnswersUseCase() {
    _service = Modular.get<ITasksService>();
  }

  Future<List<AnswerEntity>> call({required int? userId}) async {
    if (userId != null) {
      final response = await _service.getAnswersByUserId(userId);

      return response.map((e) => AnswerEntity.toEntity(e)).toList();
    }
    return [];
  }
}
