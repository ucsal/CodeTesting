import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
import 'package:projetofinal_mobile/src/service/config/error/error_exceptions.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/requests/request_send_task.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service_interface.dart';

class SendAnswerUseCase implements SafeUseCase {
  late final ITasksService _service;

  SendAnswerUseCase() {
    _service = Modular.get<ITasksService>();
  }

  Future<AnswerEntity> call({
    required int? userId,
    required String? code,
    required int? quizId,
    required int? taskId,
  }) async {
    if (userId == null || taskId == null) {
      throw UnableToProcessException('user_id or task_id is null');
    } else {
      final request = RequestSendTask(
        code: code,
        userId: userId,
        quizId: quizId,
        taskId: taskId,
      );

      final response = await _service.sendTask(request);

      return AnswerEntity.toEntity(response);
    }
  }
}
