import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/result_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service_interface.dart';

class GetAnswerResultUseCase implements SafeUseCase {
  late final ITasksService _service;

  GetAnswerResultUseCase() {
    _service = Modular.get<ITasksService>();
  }

  Future<ResultEntity> call({required int? answerId}) async {
    if (answerId != null) {
      final response = await _service.getAnswerResult(answerId);

      final result = ResultEntity.toEntity(response);

      if (result.compiled == false) {
        throw Exception(
          'Não foi possível compilar o código:  ${result.obtainedOutput}',
        );
      }
      return result;
    }
    return ResultEntity();
  }
}
