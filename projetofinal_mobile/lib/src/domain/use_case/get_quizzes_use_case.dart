import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/quiz_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/quizzes/quizzes_service_interface.dart';

class GetQuizzesUseCase implements SafeUseCase {
  late final IQuizzesService _service;

  GetQuizzesUseCase() {
    _service = Modular.get<IQuizzesService>();
  }

  Future<List<QuizEntity>> call() async {
    final response = await _service.getQuizzes();
    return response.map((e) => QuizEntity.toEntity(e)).toList();
  }
}
