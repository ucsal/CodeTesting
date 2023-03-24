import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/profile/presenter/pages/profile_page.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_my_answers_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_by_id_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_id_use_case.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service.dart';

import 'presenter/bloc/profile_bloc.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TasksService(i.get<AuthService>())),
    Bind.lazySingleton((i) => GetUserIdUseCase()),
    Bind.lazySingleton((i) => GetUserByIdUseCase()),
    Bind.lazySingleton((i) => GetMyAnswersUseCase()),
    Bind.lazySingleton((i) => ProfileBloc(
          getUserByIdUseCase: i<GetUserByIdUseCase>(),
          getUserIdUseCase: i<GetUserIdUseCase>(),
          getMyAnswersUseCase: i<GetMyAnswersUseCase>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const ProfilePage(),
    ),
  ];
}
