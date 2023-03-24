import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/auth_module.dart';
import 'package:projetofinal_mobile/src/app/modules/navigation/presenter/pages/navigation_page.dart';
import 'modules/navigation/navigation_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute(NavigationPage.route, module: NavigationModule()),
  ];
}
