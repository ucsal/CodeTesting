import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/profile/presenter/pages/profile_page.dart';
import 'package:projetofinal_mobile/src/app/modules/profile/profile_module.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/pages/quizzes_page.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/quizzes_module.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/tasks_module.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/app/modules/navigation/bloc/navigation_bloc.dart';
import 'package:projetofinal_mobile/src/service/local/shared_preferences_service.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';

import 'presenter/pages/navigation_page.dart';

class NavigationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SharedPreferencesService()),
    Bind.lazySingleton((i) => AuthService()),
    Bind.lazySingleton((i) => NavigationBloc()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const NavigationPage(),
      children: [
        ModuleRoute(TasksPage.route, module: TasksModule()),
        ModuleRoute(QuizzesPage.route, module: QuizzesModule()),
        ModuleRoute(ProfilePage.route, module: ProfileModule()),
      ],
    ),
  ];
}
