import 'package:dio/dio.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/request_config.dart';

abstract class IApiService {
  Future<Response> doRequest(RequestConfig config);
  Future<Response> post(RequestConfig config);
  Future<Response> get(RequestConfig config);
  Future<Response> patch(RequestConfig config);
  Future<Response> delete(RequestConfig config);
  Response getResponse(Response response);
}
