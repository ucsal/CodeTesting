import 'dart:async';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_bloc.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
import 'package:projetofinal_mobile/src/domain/entity/user_entity.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_my_answers_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_by_id_use_case.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_id_use_case.dart';
import 'package:projetofinal_mobile/src/service/config/error/error_exceptions.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/api_interceptors.dart';

class ProfileBloc extends SafeBloC {
  final GetUserIdUseCase getUserIdUseCase;
  final GetUserByIdUseCase getUserByIdUseCase;
  final GetMyAnswersUseCase getMyAnswersUseCase;

  late StreamController<SafeEvent<UserEntity>> userController;
  late StreamController<SafeEvent<List<AnswerEntity>>> getMyAnswersController;
  UserEntity user = UserEntity();

  bool showErrorDialog = false;

  ProfileBloc({
    required this.getUserIdUseCase,
    required this.getUserByIdUseCase,
    required this.getMyAnswersUseCase,
  }) {
    init();
  }

  @override
  Future<void> init() async {
    userController = StreamController.broadcast();
    getMyAnswersController = StreamController.broadcast();
    await getUserById();
    if (user.id != null) {
      await getMyAnswers();
    }
  }

  Future<int?> getUserId() async {
    try {
      return await getUserIdUseCase.call();
    } catch (e) {
      SafeLogUtil.instance.logError(e);
    }
    return null;
  }

  Future<void> getUserById() async {
    try {
      userController.add(SafeEvent.load());
      final userResult = await getUserByIdUseCase.call(id: await getUserId());
      user = userResult;
      userController.add(SafeEvent.done(user));
    } catch (e) {
      await ApiInterceptors.checkExpiration(e);
      SafeLogUtil.instance.logError(e);
      userController.addError(e);
    }
  }

  Future<void> getMyAnswers() async {
    try {
      getMyAnswersController.sink.add(SafeEvent.load());
      List<AnswerEntity> answers = await getMyAnswersUseCase(
        userId: await getUserId(),
      );

      if (answers.isEmpty) {
        showErrorDialog = false;
        getMyAnswersController.sink.addError(S.current.textNoAnswersFound);
      } else {
        showErrorDialog = true;
        getMyAnswersController.sink.add(SafeEvent.done(answers));
      }
    } catch (e) {
      await ApiInterceptors.checkExpiration(e);
      if (e is NotFoundException) {
        showErrorDialog = false;
        getMyAnswersController.sink.addError(S.current.textNoAnswersFound);
      } else {
        SafeLogUtil.instance.logError(e);
        showErrorDialog = true;
        getMyAnswersController.sink.addError(e.toString());
      }
    }
  }

  @override
  Future<void> dispose() async {}
}
