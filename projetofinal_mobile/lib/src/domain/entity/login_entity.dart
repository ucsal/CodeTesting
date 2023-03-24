import 'package:projetofinal_mobile/src/service/remote/auth/response/response_login.dart';

class LoginEntity {
  String? accessToken;
  String? tokenType;
  int? id;

  LoginEntity({
    this.accessToken,
    this.tokenType,
    this.id,
  });

  factory LoginEntity.toEntity(ResponseLogin? response) {
    return LoginEntity(
      accessToken: response?.accessToken,
      tokenType: response?.tokenType,
      id: response?.id,
    );
  }
}
