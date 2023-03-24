import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/bloc/answer_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/bloc/send_answer_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/bloc/task_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/bloc/tasks_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/answer_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/send_answer_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/task_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_answer_by_quiz_id_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_answer_result_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_answers_use_Case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_my_answers_use_Case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_tasks_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_tests_by_task_id.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_by_id_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_id_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_role_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/send_task_use_case.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/tasks_service.dart';

class TasksModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TasksService(i.get<AuthService>())),
    Bind.lazySingleton((i) => GetTasksUseCase()),
    Bind.lazySingleton((i) => GetUserRoleUseCase()),
    Bind.lazySingleton((i) => GetAnswersUseCase()),
    Bind.lazySingleton((i) => GetUserByIdUseCase()),
    Bind.lazySingleton((i) => GetMyAnswersUseCase()),
    Bind.lazySingleton((i) => GetTestsByTaskIdUseCase()),
    Bind.lazySingleton((i) => GetAnswersByQuizIdUseCase()),
    Bind.lazySingleton((i) => GetUserIdUseCase()),
    Bind.lazySingleton((i) => GetAnswerResultUseCase()),
    Bind.lazySingleton((i) => SendAnswerUseCase()),
    Bind.lazySingleton(
      (i) => TasksBloc(
        getTasksUseCase: i.get<GetTasksUseCase>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => TaskBloc(
        getAnswersUseCase: i.get<GetAnswersUseCase>(),
        getUserRoleUseCase: i.get<GetUserRoleUseCase>(),
        getUserByIdUseCase: i.get<GetUserByIdUseCase>(),
        getMyAnswersUseCase: i.get<GetMyAnswersUseCase>(),
        getUserIdUseCase: i.get<GetUserIdUseCase>(),
        getTestsByTaskIdUseCase: i.get<GetTestsByTaskIdUseCase>(),
        getAnswersByQuizIdUseCase: i.get<GetAnswersByQuizIdUseCase>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => AnswerBloc(
        getAnswerResultUseCase: i.get<GetAnswerResultUseCase>(),
      ),
    ),
    Bind.lazySingleton(
      (i) => SendAnswerBloc(
        sendAnswerUseCase: i.get<SendAnswerUseCase>(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const TasksPage(),
    ),
    ChildRoute(
      TaskPage.route,
      child: (context, args) => TaskPage(task: args.data),
    ),
    ChildRoute(
      AnswerPage.route,
      child: (context, args) => AnswerPage(answer: args.data),
    ),
    ChildRoute(
      SendAnswerPage.route,
      child: (context, args) => SendAnswerPage(taskInfo: args.data),
    ),
  ];
}
