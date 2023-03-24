import 'dart:async';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_bloc.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/quiz_entity.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_quizzes_use_Case.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/api_interceptors.dart';

class QuizzesBloc extends SafeBloC {
  final GetQuizzesUseCase getQuizzesUseCase;

  late StreamController<SafeEvent<List<QuizEntity>>> getQuizzesController;

  QuizzesBloc({required this.getQuizzesUseCase}) {
    init();
  }

  @override
  Future<void> init() async {
    getQuizzesController = StreamController.broadcast();
    getQuizzes();
  }

  Future<void> getQuizzes() async {
    try {
      getQuizzesController.sink.add(SafeEvent.load());
      List<QuizEntity> quizzes = await getQuizzesUseCase();
      getQuizzesController.sink.add(SafeEvent.done(quizzes));
    } catch (e) {
      await ApiInterceptors.checkExpiration(e);
      SafeLogUtil.instance.logError(e);
      getQuizzesController.sink.addError(e.toString());
    }
  }

  @override
  Future<void> dispose() async {}
}
