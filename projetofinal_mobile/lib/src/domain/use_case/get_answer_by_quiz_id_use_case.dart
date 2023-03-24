import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service_interface.dart';

class GetAnswersByQuizIdUseCase implements SafeUseCase {
  late final ITasksService _service;

  GetAnswersByQuizIdUseCase() {
    _service = Modular.get<ITasksService>();
  }

  Future<List<AnswerEntity>> call({required int? quizId}) async {
    if (quizId != null) {
      final response = await _service.getAnswerByQuizId(quizId);

      return response.map((e) => AnswerEntity.toEntity(e)).toList();
    }
    return [];
  }
}
