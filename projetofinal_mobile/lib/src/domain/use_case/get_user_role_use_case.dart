import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/use_case/do_register_use_case.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service_interface.dart';

class GetUserRoleUseCase implements SafeUseCase {
  late final ISharedPreferencesService _sharedPreferences;

  GetUserRoleUseCase() {
    _sharedPreferences = Modular.get<SharedPreferencesService>();
  }

  Future<RoleEnum> call() async {
    try {
      final response = await _sharedPreferences.readUserRole();
      switch (response) {
        case 'Admin':
          return RoleEnum.admin;
        case 'Aluno':
          return RoleEnum.student;
        case 'Professor':
          return RoleEnum.teacher;
      }
    } catch (e) {
      SafeLogUtil.instance.logError(e);
    }
    return RoleEnum.none;
  }
}
