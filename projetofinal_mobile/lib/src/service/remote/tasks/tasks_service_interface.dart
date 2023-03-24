import 'package:projetofinal_mobile/src/service/remote/tasks/requests/request_send_task.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_answer_by_task_id.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_answer_by_user_id.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_answer_result.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_tasks.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_tests_by_task_id.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_send_task.dart';

abstract class ITasksService {
  Future<List<ResponseGetTasks>> getTasks();
  Future<List<ResponseGetAnswerByTaskId>> getAnswersByTaskId(int taskId);
  Future<List<ResponseGetAnswerByUserId>> getAnswersByUserId(int userId);
  Future<List<ResponseGetAnswerByTaskId>> getAnswerByQuizId(int quizId);
  Future<ResponseGetAnswerResult> getAnswerResult(int id);
  Future<List<ResponseGetTestByTaskId>> getTestsByTaskId(int taskId);
  Future<ResponseSendTask> sendTask(RequestSendTask request);
}
