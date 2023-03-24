import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:projetofinal_mobile/src/service/config/constants/api_constants.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/api_service.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/http_method.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/request_config.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/requests/request_send_task.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_answer_by_task_id.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_answer_by_user_id.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_answer_result.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_tasks.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_get_tests_by_task_id.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/response/response_send_task.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service_interface.dart';

class TasksService implements ITasksService {
  final ApiService _service = ApiService();
  final AuthService _authService;

  TasksService(this._authService);

  @override
  Future<List<ResponseGetTasks>> getTasks() async {
    final token = await _authService.getAccessToken();

    final requestConfig = RequestConfig(
      path: ApiConstants.getTasks,
      method: HttpMethod.get,
      options: Options(headers: {ApiConstants.kAuthorization: token}),
    );

    final response = await _service.doRequest(requestConfig);
    return (json.decode(response.data) as List)
        .map((e) => ResponseGetTasks.fromJson(e))
        .toList();
  }

  @override
  Future<List<ResponseGetAnswerByTaskId>> getAnswersByTaskId(int taskId) async {
    final token = await _authService.getAccessToken();

    final requestConfig = RequestConfig(
      path: ApiConstants.getAnswerByTaskId + taskId.toString(),
      method: HttpMethod.get,
      options: Options(headers: {ApiConstants.kAuthorization: token}),
    );

    final response = await _service.doRequest(requestConfig);
    return (json.decode(response.data) as List)
        .map((e) => ResponseGetAnswerByTaskId.fromJson(e))
        .toList();
  }

  @override
  Future<List<ResponseGetAnswerByUserId>> getAnswersByUserId(int userId) async {
    final token = await _authService.getAccessToken();

    final requestConfig = RequestConfig(
      path: ApiConstants.getAnswerByUserId + userId.toString(),
      method: HttpMethod.get,
      options: Options(headers: {ApiConstants.kAuthorization: token}),
    );

    final response = await _service.doRequest(requestConfig);
    return (json.decode(response.data) as List)
        .map((e) => ResponseGetAnswerByUserId.fromJson(e))
        .toList();
  }

  @override
  Future<ResponseGetAnswerResult> getAnswerResult(int id) async {
    final token = await _authService.getAccessToken();

    final requestConfig = RequestConfig(
      path: ApiConstants.getResultByAnswerId + id.toString(),
      method: HttpMethod.get,
      options: Options(headers: {ApiConstants.kAuthorization: token}),
    );

    final response = await _service.doRequest(requestConfig);

    return ResponseGetAnswerResult.fromJson(jsonDecode(response.data));
  }

  @override
  Future<List<ResponseGetTestByTaskId>> getTestsByTaskId(int taskId) async {
    final token = await _authService.getAccessToken();

    final requestConfig = RequestConfig(
      path: ApiConstants.getTestsByTaskId + taskId.toString(),
      method: HttpMethod.get,
      options: Options(headers: {ApiConstants.kAuthorization: token}),
    );

    final response = await _service.doRequest(requestConfig);
    return (json.decode(response.data) as List)
        .map((e) => ResponseGetTestByTaskId.fromJson(e))
        .toList();
  }

  @override
  Future<ResponseSendTask> sendTask(RequestSendTask request) async {
    final token = await _authService.getAccessToken();

    final requestConfig = RequestConfig(
      path: ApiConstants.sendTasks,
      method: HttpMethod.post,
      body: request.toJson(),
      options: Options(headers: {ApiConstants.kAuthorization: token}),
    );

    final response = await _service.doRequest(requestConfig);

    return ResponseSendTask.fromJson(jsonDecode(response.data));
  }

  @override
  Future<List<ResponseGetAnswerByTaskId>> getAnswerByQuizId(int quizId) async {
    final token = await _authService.getAccessToken();

    final requestConfig = RequestConfig(
      path: ApiConstants.getAnswerByQuizId + quizId.toString(),
      method: HttpMethod.get,
      options: Options(headers: {ApiConstants.kAuthorization: token}),
    );

    final response = await _service.doRequest(requestConfig);
    return (json.decode(response.data) as List)
        .map((e) => ResponseGetAnswerByTaskId.fromJson(e))
        .toList();
  }
}
