import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/login/presenter/pages/login_page.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/use_case/save_user_login_use_case.dart';
import 'package:projetofinal_mobile/src/service/config/error/error_exceptions.dart';

///A classe [ApiInterceptors] é responsável por gerenciar as intercepções da API
class ApiInterceptors extends QueuedInterceptorsWrapper {
  @override
  Future onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    SafeLogUtil.instance.onRequestLog(
      path: options.path,
      header: options.headers.toString(),
      body: options.data.toString(),
      http: options.method,
    );
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    SafeLogUtil.instance.onResponseLog(
      path: response.requestOptions.path,
      statusCode: response.statusCode,
      header: response.headers.toString(),
      params: response.requestOptions.data.toString(),
      body: response.data,
    );
    return super.onResponse(response, handler);
  }

  @override
  onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    SafeLogUtil.instance.onResponseLog(
      path: err.requestOptions.path,
      statusCode: err.response?.statusCode,
      header: err.requestOptions.headers.toString(),
      params: err.requestOptions.data.toString(),
      body: err.response?.data.toString(),
      isError: true,
    );
    return super.onError(err, handler);
  }

  static Future<void> checkExpiration(Object e) async {
    if (e is UnauthorizedException) await doLogout();
  }

  static Future<void> doLogout() async {
    await SaveUserLoginUseCase().call(false).then(
          (_) => Modular.to.pushNamedAndRemoveUntil(
            LoginPage.route,
            (r) => false,
          ),
        );
  }
}
