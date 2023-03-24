import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/task_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/quizzes/quizzes_service_interface.dart';

class GetTasksByQuizIdUseCase implements SafeUseCase {
  late final IQuizzesService _service;

  GetTasksByQuizIdUseCase() {
    _service = Modular.get<IQuizzesService>();
  }

  Future<List<TaskEntity>> call(int? quizId) async {
    final response = await _service.getTasksByQuizId(quizId);
    return response.map((e) => TaskEntity.toEntity(e.tarefa)).toList();
  }
}
