import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/constants/int_constants.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service_interface.dart';

class SaveUserIdUseCase extends SafeUseCase {
  late final ISharedPreferencesService _sharedPreferences;

  SaveUserIdUseCase() {
    _sharedPreferences = Modular.get<SharedPreferencesService>();
  }

  Future<void> call(int? value) async {
    _sharedPreferences.saveUserId(value ?? IntConstants.empty);
  }
}
