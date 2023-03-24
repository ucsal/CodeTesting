import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/login/presenter/bloc/login_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/login/presenter/pages/login_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/tasks_module.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/app/modules/navigation/navigation_module.dart';
import 'package:projetofinal_mobile/src/app/modules/navigation/presenter/pages/navigation_page.dart';
import 'package:projetofinal_mobile/src/domain/use_case/do_login_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_by_id_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/save_user_id_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/save_user_login_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/save_user_role_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/save_user_token_use_case.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SharedPreferencesService()),
    Bind.lazySingleton((i) => AuthService()),
    Bind.lazySingleton((i) => SaveUserLoginUseCase()),
    Bind.lazySingleton((i) => SaveUserTokenUseCase()),
    Bind.lazySingleton((i) => DoLoginUseCase()),
    Bind.lazySingleton((i) => GetUserByIdUseCase()),
    Bind.lazySingleton((i) => SaveUserIdUseCase()),
    Bind.lazySingleton((i) => SaveUserRoleUseCase()),
    Bind.lazySingleton((i) => GetUserByIdUseCase()),
    Bind.lazySingleton((i) => LoginBloc(
          doLoginUseCase: i.get<DoLoginUseCase>(),
          saveUserLoginUseCase: i.get<SaveUserLoginUseCase>(),
          saveUserTokenUseCase: i.get<SaveUserTokenUseCase>(),
          saveUserRoleUseCase: i.get<SaveUserRoleUseCase>(),
          saveUserIdUseCase: i.get<SaveUserIdUseCase>(),
          getUserByIdUseCase: i.get<GetUserByIdUseCase>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const LoginPage(),
    ),
    ModuleRoute(NavigationPage.route, module: NavigationModule()),
    ModuleRoute(TasksPage.route, module: TasksModule()),
  ];
}
