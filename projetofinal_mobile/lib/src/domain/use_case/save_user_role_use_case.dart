import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/do_register_use_case.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service_interface.dart';

class SaveUserRoleUseCase extends SafeUseCase {
  late final ISharedPreferencesService _sharedPreferences;

  SaveUserRoleUseCase() {
    _sharedPreferences = Modular.get<SharedPreferencesService>();
  }

  Future<void> call(String value) async {
    String role = StringConstants.empty;
    switch (value) {
      case 'Admin':
        role = RoleEnum.admin.value;
        break;
      case 'Aluno':
        role = RoleEnum.student.value;
        break;
      case 'Professor':
        role = RoleEnum.teacher.value;
        break;
      default:
        role = 'None';
        break;
    }
    _sharedPreferences.saveUserRole(role);
  }
}
