import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/register_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service_interface.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/request/request_register.dart';

enum RoleEnum { admin, student, teacher, none }

extension RoleEnumExtension on RoleEnum {
  String get value {
    switch (this) {
      case RoleEnum.admin:
        return 'Admin';
      case RoleEnum.student:
        return 'Aluno';
      case RoleEnum.teacher:
        return 'Professor';
      case RoleEnum.none:
        return 'none';
    }
  }
}

class DoRegisterUseCase extends SafeUseCase {
  late final IAuthService _service;

  DoRegisterUseCase() {
    _service = Modular.get<AuthService>();
  }

  Future<RegisterEntity> call({
    required String name,
    required String username,
    required String password,
    required String email,
    bool isActive = true,
    RoleEnum profile = RoleEnum.student,
  }) async {
    final request = RequestRegister(
      name: name.trim(),
      password: password.trim(),
      user: username,
      isActive: isActive,
      email: email,
      profileId: profile.index + 1,
    );

    final responseGetUsers = await _service.getAllUsers();

    bool userExists = false;

    responseGetUsers.map((e) {
      if (e.user == username) {
        userExists = true;
      }
    });

    if (userExists) {
      throw Exception('Usuário já está cadastrado.');
    } else {
      final response = await _service.doRegister(request);
      return RegisterEntity.toEntity(response);
    }
  }
}
