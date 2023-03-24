import 'dart:async';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_bloc.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/result_entity.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_answer_result_use_case.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/api_interceptors.dart';

class AnswerBloc extends SafeBloC {
  final GetAnswerResultUseCase getAnswerResultUseCase;
  late StreamController<SafeEvent<ResultEntity>> getResultController;

  AnswerBloc({
    required this.getAnswerResultUseCase,
  }) {
    init();
  }

  @override
  Future<void> init() async {
    getResultController = StreamController.broadcast();
  }

  Future<void> getResult(int? id) async {
    try {
      getResultController.sink.add(SafeEvent.load());
      ResultEntity result = await getAnswerResultUseCase(answerId: id);

      getResultController.sink.add(SafeEvent.done(result));
    } catch (e) {
      await ApiInterceptors.checkExpiration(e);

      SafeLogUtil.instance.logError(e);
      getResultController.sink.addError(e.toString());
    }
  }

  @override
  Future<void> dispose() async {}
}
