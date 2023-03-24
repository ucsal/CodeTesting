import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/auth/register/presenter/bloc/register_bloc.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/config/safe_layout.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_button.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_text_form_field.dart';

import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/register_entity.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: SafeColors.generalColors.secondary,
      appBar: AppBar(
        elevation: 0,
        title: Text(S.current.textRegister),
        centerTitle: false,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: SafeColors.generalColors.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: StreamBuilder<SafeEvent<RegisterEntity>>(
              stream: controller.doRegisterController.stream,
              initialData: SafeEvent.initial(),
              builder: (context, snapshot) {
                final result = snapshot.data?.data;
                return SafeLayout(
                  snapshot: snapshot,
                  context: context,
                  onDone: () => Modular.to.pop(result),
                  onInitial: RegisterPageBodyWidget(
                    formKey: _formKey,
                    buttonRegisterStream:
                        controller.registerButtonController.stream,
                    nameController: controller.nameController,
                    userController: controller.userController,
                    passwordController: controller.passwordController,
                    emailController: controller.emailController,
                    toogleRegisterButton: () =>
                        controller.toogleRegisterButton(),
                    doRegister: () async => controller.doRegister(),
                  ),
                  onError: RegisterPageBodyWidget(
                    formKey: _formKey,
                    buttonRegisterStream:
                        controller.registerButtonController.stream,
                    nameController: controller.nameController,
                    userController: controller.userController,
                    emailController: controller.emailController,
                    passwordController: controller.passwordController,
                    toogleRegisterButton: () =>
                        controller.toogleRegisterButton(),
                    doRegister: () async => controller.doRegister(),
                  ),
                ).build;
              }),
        ),
      ),
    );
  }
}

class RegisterSuccessWidget extends StatelessWidget {
  const RegisterSuccessWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 90, 20, 0),
      child: Column(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 100,
            color: SafeColors.statusColors.success,
          ),
          const SizedBox(height: 20),
          Text(
            S.current.textUserRegiteredSuccess.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyles.headline2(
              fontWeight: FontWeight.bold,
              color: SafeColors.statusColors.success,
            ),
          ),
          const SizedBox(height: 90),
          SafeButton(
            title: S.current.textGoToLogin,
            onTap: () => Modular.to.pop(),
          ),
        ],
      ),
    );
  }
}

class RegisterPageBodyWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController userController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final Stream<bool> buttonRegisterStream;
  final Future<void> Function() doRegister;
  final void Function() toogleRegisterButton;
  const RegisterPageBodyWidget({
    Key? key,
    required this.formKey,
    required this.buttonRegisterStream,
    required this.doRegister,
    required this.nameController,
    required this.userController,
    required this.passwordController,
    required this.toogleRegisterButton,
    required this.emailController,
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
              controller: nameController,
              hintText: S.current.textName,
              onChanged: (value) => toogleRegisterButton(),
              prefixIcon: Icon(
                Icons.person,
                color: SafeColors.componentsColors.iconColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            SafeTextFormField(
              controller: userController,
              hintText: S.current.textUser,
              onChanged: (value) => toogleRegisterButton(),
              prefixIcon: Icon(
                Icons.person,
                color: SafeColors.componentsColors.iconColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            SafeTextFormField(
              controller: emailController,
              hintText: S.current.textEmail,
              onChanged: (value) => toogleRegisterButton(),
              prefixIcon: Icon(
                Icons.mail,
                color: SafeColors.componentsColors.iconColors.primary,
              ),
            ),
            const SizedBox(height: 20),
            SafeTextFormField(
              controller: passwordController,
              hintText: S.current.textPassword,
              obscureText: true,
              onChanged: (value) => toogleRegisterButton(),
              prefixIcon: Icon(
                Icons.lock,
                color: SafeColors.componentsColors.iconColors.primary,
              ),
            ),
            const SizedBox(height: 40),
            RegisterButtonWidget(
              stream: buttonRegisterStream,
              formKey: formKey,
              doRegister: doRegister,
            ),
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

class RegisterButtonWidget extends StatelessWidget {
  final Stream<bool> stream;
  final GlobalKey<FormState> formKey;
  final Future<void> Function() doRegister;

  const RegisterButtonWidget({
    Key? key,
    required this.stream,
    required this.formKey,
    required this.doRegister,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: stream,
      initialData: false,
      builder: (context, snapshot) {
        return SafeButton(
          title: S.current.textRegister,
          state:
              snapshot.data == true ? ButtonState.active : ButtonState.disabled,
          onTap: () async {
            formKey.currentState?.validate();
            if (snapshot.data ?? false) {
              await doRegister();
            }
          },
        );
      },
    );
  }
}
