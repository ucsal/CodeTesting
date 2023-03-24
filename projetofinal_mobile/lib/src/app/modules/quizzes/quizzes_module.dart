import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/bloc/quiz_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/bloc/quizzes_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/pages/quiz_page.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/pages/quizzes_page.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_quizzes_use_Case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_tasks_by_quiz_id_use_case.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/auth_service.dart';
import 'package:projetofinal_mobile/src/service/remote/quizzes/quizzes_service.dart';

class QuizzesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => QuizzesService(i.get<AuthService>())),
    Bind.lazySingleton((i) => GetQuizzesUseCase()),
    Bind.lazySingleton((i) => GetTasksByQuizIdUseCase()),
    Bind.lazySingleton((i) => QuizzesBloc(
          getQuizzesUseCase: i.get<GetQuizzesUseCase>(),
        )),
    Bind.lazySingleton((i) => QuizBloc(
          getTasksByQuizIdUseCase: i.get<GetTasksByQuizIdUseCase>(),
        )),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (context, args) => const QuizzesPage(),
    ),
    ChildRoute(
      QuizPage.route,
      child: (context, args) => QuizPage(quiz: args.data),
    ),
  ];
}
