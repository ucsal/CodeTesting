import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/login/presenter/pages/login_page.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/splash/presenter/bloc/splash_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/app/modules/navigation/presenter/pages/navigation_page.dart';
import 'package:projetofinal_mobile/src/components/animations/fade_animation.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';

import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';

class SplashPage extends StatefulWidget {
  static const route = '/splash';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashBloc> {
  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
    defineRoute();
  }

  void defineRoute() async {
    await Future.delayed(const Duration(seconds: 4)).then((_) {
      if (controller.isUserLogged) {
        goToHome();
      } else {
        goToLogin();
      }
    });
  }

  void goToHome() async {
    Modular.to.pushNamedAndRemoveUntil(
      NavigationPage.route + TasksPage.route,
      (r) => false,
    );
  }

  void goToLogin() async {
    Modular.to.pushNamedAndRemoveUntil(
      LoginPage.route,
      (r) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SafeColors.generalColors.backgroundSplash,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _mountLogo(context),
            _mountTitle(),
          ],
        ),
      ),
    );
  }

  FadeAnimation _mountLogo(BuildContext context) {
    return FadeAnimation(
      delay: 1,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Icon(
            Icons.school,
            color: SafeColors.generalColors.primary,
            size: 100,
          )
          // Image.asset(
          //   AssetConstants.general.logo,
          //   height: MediaQuery.of(context).size.height * 0.2,
          // ),
          ),
    );
  }

  FadeAnimation _mountTitle() {
    return FadeAnimation(
      delay: 2,
      child: Text(
        S.current.textProjectName,
        textAlign: TextAlign.center,
        style: TextStyles.headline1(
          color: SafeColors.generalColors.primary,
        ),
      ),
    );
  }
}
