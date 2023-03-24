import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projetofinal_mobile/src/service/config/constants/api_constants.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/api_service.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/http_method.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/request_config.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';
import 'package:projetofinal_mobile/src/service/remote/quizzes/quizzes_service_interface.dart';
import 'package:projetofinal_mobile/src/service/remote/quizzes/response/get_quiz_response.dart';
import 'package:projetofinal_mobile/src/service/remote/quizzes/response/get_tasks_by_quiz_id.dart';

class QuizzesService implements IQuizzesService {
  final ApiService _service = ApiService();
  final AuthService _authService;

  QuizzesService(this._authService);

  @override
  Future<List<ResponseGetQuiz>> getQuizzes() async {
    final token = await _authService.getAccessToken();

    final requestConfig = RequestConfig(
      path: ApiConstants.getQuizzes,
      method: HttpMethod.get,
      options: Options(headers: {ApiConstants.kAuthorization: token}),
    );

    final response = await _service.doRequest(requestConfig);
    return (json.decode(response.data) as List)
        .map((e) => ResponseGetQuiz.fromJson(e))
        .toList();
  }

  @override
  Future<List<ResponseGetTasksByQuizId>> getTasksByQuizId(int? quizId) async {
    final token = await _authService.getAccessToken();

    final requestConfig = RequestConfig(
      path: ApiConstants.getTasksByQuizId + quizId.toString(),
      method: HttpMethod.get,
      options: Options(headers: {ApiConstants.kAuthorization: token}),
    );

    final response = await _service.doRequest(requestConfig);
    return (json.decode(response.data) as List)
        .map((e) => ResponseGetTasksByQuizId.fromJson(e))
        .toList();
  }
}
