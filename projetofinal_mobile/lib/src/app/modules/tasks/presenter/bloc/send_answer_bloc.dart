import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_bloc.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
import 'package:projetofinal_mobile/src/domain/use_case/send_task_use_case.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/api_interceptors.dart';

class SendAnswerBloc extends SafeBloC {
  final SendAnswerUseCase sendAnswerUseCase;
  late StreamController<SafeEvent<AnswerEntity>> sendAnswerController;
  final TextEditingController code = TextEditingController();

  SendAnswerBloc({
    required this.sendAnswerUseCase,
  }) {
    init();
  }

  @override
  Future<void> init() async {
    sendAnswerController = StreamController.broadcast();
  }

  Future<void> sendAnswer({
    required int? userId,
    required String? code,
    required int? quizId,
    required int? taskId,
  }) async {
    try {
      sendAnswerController.sink.add(SafeEvent.load());
      AnswerEntity result = await sendAnswerUseCase(
        userId: userId,
        code: code,
        quizId: quizId,
        taskId: taskId,
      );
      sendAnswerController.sink.add(SafeEvent.done(result));
    } catch (e) {
      await ApiInterceptors.checkExpiration(e);

      SafeLogUtil.instance.logError(e);
      sendAnswerController.sink.addError(e.toString());
    }
  }

  @override
  Future<void> dispose() async {}
}
