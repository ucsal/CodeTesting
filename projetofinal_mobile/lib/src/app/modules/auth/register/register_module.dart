import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/register/presenter/bloc/register_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/register/presenter/pages/register_page.dart';
import 'package:projetofinal_mobile/src/domain/use_case/do_register_use_case.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthService()),
    Bind.lazySingleton((i) => SharedPreferencesService()),
    Bind.lazySingleton((i) => DoRegisterUseCase()),
    Bind.lazySingleton(
      (i) => RegisterBloc(
        doRegisterUseCase: i.get<DoRegisterUseCase>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const RegisterPage(),
    ),
  ];
}
