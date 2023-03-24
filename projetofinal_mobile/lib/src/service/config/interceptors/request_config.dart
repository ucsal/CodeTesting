import 'package:dio/dio.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/http_method.dart';

///A classe [RequestConfig] é responsável por armazenar as configurações de requisição
class RequestConfig {
  final String path;
  final HttpMethod method;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? parameters;
  final Options? options;

  RequestConfig({
    required this.path,
    required this.method,
    this.options,
    this.body,
    this.parameters,
  });
}
