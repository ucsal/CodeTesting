import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/core/constants/int_constants.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_use_case.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service_interface.dart';

class GetUserIdUseCase implements SafeUseCase {
  late final ISharedPreferencesService _sharedPreferences;

  GetUserIdUseCase() {
    _sharedPreferences = Modular.get<SharedPreferencesService>();
  }

  Future<int> call() async {
    try {
      final response = await _sharedPreferences.readUserId();
      return response;
    } catch (e) {
      SafeLogUtil.instance.logError(e);
    }
    return IntConstants.empty;
  }
}
