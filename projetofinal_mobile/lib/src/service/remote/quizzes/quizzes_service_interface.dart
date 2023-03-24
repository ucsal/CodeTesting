import 'package:projetofinal_mobile/src/service/remote/quizzes/response/get_quiz_response.dart';
import 'package:projetofinal_mobile/src/service/remote/quizzes/response/get_tasks_by_quiz_id.dart';

abstract class IQuizzesService {
  Future<List<ResponseGetQuiz>> getQuizzes();
  Future<List<ResponseGetTasksByQuizId>> getTasksByQuizId(int? quizId);
}
