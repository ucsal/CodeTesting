import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service_interface.dart';

class SaveUserTokenUseCase extends SafeUseCase {
  late final ISharedPreferencesService _sharedPreferences;

  SaveUserTokenUseCase() {
    _sharedPreferences = Modular.get<SharedPreferencesService>();
  }

  Future<void> call(String value) async {
    _sharedPreferences.saveToken(value);
  }
}
