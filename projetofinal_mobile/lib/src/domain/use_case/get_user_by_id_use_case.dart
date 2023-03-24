import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/constants/int_constants.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/entity/user_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service_interface.dart';

class GetUserByIdUseCase extends SafeUseCase {
  late final IAuthService _service;

  GetUserByIdUseCase() {
    _service = Modular.get<AuthService>();
  }

  Future<UserEntity> call({required int? id}) async {
    final response = await _service.getUserById(id ?? IntConstants.empty);

    return UserEntity.toEntity(response);
  }
}
