import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/login/login_module.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/login/presenter/pages/login_page.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/register/presenter/pages/register_page.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/register/register_module.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/splash/splash_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute(LoginPage.route, module: LoginModule()),
    ModuleRoute(RegisterPage.route, module: RegisterModule()),
  ];
}
