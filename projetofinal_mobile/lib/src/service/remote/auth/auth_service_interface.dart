import 'package:projetofinal_mobile/src/service/remote/auth/request/request_login.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/request/request_register.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/response/response_get_user_by_id.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/response/response_login.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/response/response_register_admin.dart';

abstract class IAuthService {
  Future<ResponseLogin> doLogin(RequestLogin request);
  Future<ResponseRegister> doRegister(RequestRegister request);
  Future<ResponseGetUserById> getUserById(int id);
  Future<List<ResponseGetUserById>> getAllUsers();
  Future<String> getAccessToken();
}
