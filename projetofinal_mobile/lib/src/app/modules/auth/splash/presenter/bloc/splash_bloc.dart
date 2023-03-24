import 'dart:async';

import 'package:projetofinal_mobile/src/core/interfaces/safe_bloc.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/use_case/get_user_login_use_case.dart';

class SplashBloc extends SafeBloC {
  late GetUserLoginUseCase getUserLoginUseCase;
  late bool isUserLogged;
  late bool isUserOnBoarding;

  SplashBloc({
    required this.getUserLoginUseCase,
  }) {
    init();
  }

  @override
  Future<void> init() async {
    isUserLogged = await getUserLogin();
  }

  Future<bool> getUserLogin() async {
    final response = await getUserLoginUseCase.call();
    SafeLogUtil.instance.log(
      title: 'Is User Logged?',
      message: response.toString(),
      type: SafeLogType.warning,
    );
    return response;
  }

  @override
  Future<void> dispose() async {}
}
