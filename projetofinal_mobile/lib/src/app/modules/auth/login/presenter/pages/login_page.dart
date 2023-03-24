import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/login/presenter/bloc/login_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/register/presenter/pages/register_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/app/modules/navigation/presenter/pages/navigation_page.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/config/safe_layout.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_button.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_dialogs.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_text_form_field.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/login_entity.dart';

class LoginPage extends StatefulWidget {
  static const route = '/login/';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
  }

  void navigateToHome() {
    Modular.to.pushNamedAndRemoveUntil(
      NavigationPage.route + TasksPage.route,
      (r) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: SafeColors.generalColors.secondary,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 50,
          ),
          decoration: BoxDecoration(
            color: SafeColors.generalColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: StreamBuilder<SafeEvent<LoginEntity>>(
              stream: controller.doLoginController.stream,
              initialData: SafeEvent.initial(),
              builder: (context, snapshot) {
                return SafeLayout(
                  snapshot: snapshot,
                  context: context,
                  onDone: navigateToHome,
                  onInitial: LoginPageBodyWidget(
                    formKey: _formKey,
                    buttonLoginStream: controller.loginButtonController.stream,
                    userController: controller.userController,
                    passwordController: controller.passwordController,
                    toogleLoginButton: () => controller.toogleLoginButton(),
                    doLogin: () async => controller.doLogin(),
                  ),
                  onError: LoginPageBodyWidget(
                    formKey: _formKey,
                    buttonLoginStream: controller.loginButtonController.stream,
                    userController: controller.userController,
                    passwordController: controller.passwordController,
                    toogleLoginButton: () => controller.toogleLoginButton(),
                    doLogin: () async => controller.doLogin(),
                  ),
                ).build;
              }),
        ),
      ),
    );
  }
}

class LoginPageBodyWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController userController;
  final TextEditingController passwordController;
  final Stream<bool> buttonLoginStream;
  final Future<void> Function() doLogin;
  final void Function() toogleLoginButton;
  const LoginPageBodyWidget({
    Key? key,
    required this.formKey,
    required this.buttonLoginStream,
    required this.doLogin,
    required this.userController,
    required this.passwordController,
    required this.toogleLoginButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 50,
      ),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const LogoWidget(),
            const SizedBox(height: 60),
            SafeTextFormField(
              controller: userController,
              hintText: S.current.textUser,
              onChanged: (value) => toogleLoginButton(),
              prefixIcon: Icon(
                Icons.person,
                color: SafeColors.componentsColors.iconColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            SafeTextFormField(
              controller: passwordController,
              hintText: S.current.textPassword,
              obscureText: true,
              onChanged: (value) => toogleLoginButton(),
              prefixIcon: Icon(
                Icons.lock,
                color: SafeColors.componentsColors.iconColors.primary,
              ),
            ),
            const SizedBox(height: 40),
            LoginButtonWidget(
              stream: buttonLoginStream,
              formKey: formKey,
              doLogin: doLogin,
            ),
            const SizedBox(height: 10),
            const RegisterButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.school,
          color: SafeColors.generalColors.secondary,
          size: 50,
        ),
        Text(
          S.current.textProjectName,
          textAlign: TextAlign.center,
          style: TextStyles.headline3(
            color: SafeColors.generalColors.secondary,
          ),
        ),
      ],
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  final Stream<bool> stream;
  final GlobalKey<FormState> formKey;
  final Future<void> Function() doLogin;

  const LoginButtonWidget({
    Key? key,
    required this.stream,
    required this.formKey,
    required this.doLogin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: stream,
      initialData: false,
      builder: (context, snapshot) {
        return SafeButton(
          title: S.current.textLogin,
          state:
              snapshot.data == true ? ButtonState.active : ButtonState.disabled,
          onTap: () async {
            formKey.currentState?.validate();
            if (snapshot.data ?? false) {
              await doLogin();
            }
          },
        );
      },
    );
  }
}

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            S.current.textDoYouHaveAccount,
            style: TextStyles.button(),
          ),
          TextButton(
            onPressed: () {
              Modular.to.pushNamed(RegisterPage.route).then((value) async {
                if (value != null) {
                  return SafeDialog(
                    title: S.current.textSuccess,
                    message: S.current.textUserRegiteredSuccess,
                    onTap: () => Modular.to.pop(),
                  ).show();
                }
              });
            },
            child: Text(
              S.current.textRegister,
              style: TextStyles.button(
                color: SafeColors.buttonColors.primary,
                textDecoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
