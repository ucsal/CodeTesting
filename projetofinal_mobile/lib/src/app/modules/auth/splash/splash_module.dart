import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/splash/presenter/bloc/splash_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/splash/presenter/pages/splash_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/tasks_module.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_login_use_case.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SharedPreferencesService()),
    Bind.lazySingleton((i) => GetUserLoginUseCase()),
    Bind.lazySingleton((i) => SplashBloc(
          getUserLoginUseCase: i.get<GetUserLoginUseCase>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const SplashPage(),
    ),
    ModuleRoute(TasksPage.route, module: TasksModule()),
  ];
}
