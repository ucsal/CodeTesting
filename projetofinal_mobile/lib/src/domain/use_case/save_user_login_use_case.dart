import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service_interface.dart';

class SaveUserLoginUseCase extends SafeUseCase {
  late final ISharedPreferencesService _sharedPreferences;

  SaveUserLoginUseCase() {
    _sharedPreferences = Modular.get<SharedPreferencesService>();
  }

  Future<void> call(bool value) async {
    _sharedPreferences.saveLogin(value);
  }
}
