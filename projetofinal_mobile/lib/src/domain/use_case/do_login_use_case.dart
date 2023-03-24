import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/login_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service_interface.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/request/request_login.dart';

class DoLoginUseCase extends SafeUseCase {
  late final IAuthService _service;

  DoLoginUseCase() {
    _service = Modular.get<AuthService>();
  }

  Future<LoginEntity> call({
    required String user,
    required String password,
  }) async {
    final request = RequestLogin(
      user: user,
      password: password,
    );

    final response = await _service.doLogin(request);

    return LoginEntity.toEntity(response);
  }
}
