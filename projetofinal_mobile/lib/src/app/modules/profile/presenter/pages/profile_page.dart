import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/profile/presenter/bloc/profile_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/profile/presenter/widgets/profile_answer_widget.dart';
import 'package:projetofinal_mobile/src/app/modules/profile/presenter/widgets/profile_widget.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/answer_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/sextion_title_widget.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/text_body_section_widget.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/config/safe_layout.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_app_bar.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
import 'package:projetofinal_mobile/src/domain/entity/user_entity.dart';
import 'package:projetofinal_mobile/src/service/config/interceptors/api_interceptors.dart';

class ProfilePage extends StatefulWidget {
  static const route = '/profile';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: SafeAppBar(
        title: S.of(context).textProfile,
        onRefresh: () => controller.getUserById(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 20),
            child: GestureDetector(
              child: Icon(
                Icons.logout_rounded,
                color: SafeColors.generalColors.secondary,
                size: 30,
              ),
              onTap: () => ApiInterceptors.doLogout(),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder<SafeEvent<UserEntity>>(
                stream: controller.userController.stream,
                builder: (context, snapshot) {
                  final user = snapshot.data?.data;
                  return SafeLayout(
                    snapshot: snapshot,
                    context: context,
                    onDone: () {},
                    onCompleted: ProfileWidget(user: user),
                  ).build;
                },
              ),
              const SizedBox(height: 40),
              StreamBuilder<SafeEvent<List<AnswerEntity>>>(
                  stream: controller.getMyAnswersController.stream,
                  builder: (context, snapshot) {
                    final answers = snapshot.data?.data;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SectionTitleWidget(title: S.current.textMyAnswers),
                        const SizedBox(height: 15),
                        SafeLayout(
                          snapshot: snapshot,
                          context: context,
                          onDone: () {},
                          showErrorDialog: controller.showErrorDialog,
                          onError: TextBodySectionWidget(
                            text: snapshot.error.toString(),
                          ),
                          onCompleted: Column(
                            children: List.generate(
                              answers?.length ?? 0,
                              (index) => ProfileAnswerWidget(
                                answer: answers?[index],
                                onTap: () async => Modular.to.pushNamed(
                                  TasksPage.route + AnswerPage.route,
                                  arguments: answers?[index],
                                ),
                              ),
                            ),
                          ),
                        ).build
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
