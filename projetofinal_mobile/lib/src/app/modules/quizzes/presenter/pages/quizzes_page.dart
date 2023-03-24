import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/bloc/quizzes_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/widgets/quiz_widget.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/config/safe_layout.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_app_bar.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/quiz_entity.dart';

class QuizzesPage extends StatefulWidget {
  static const route = '/quizzes';
  const QuizzesPage({super.key});

  @override
  State<QuizzesPage> createState() => _QuizzesPageState();
}

class _QuizzesPageState extends ModularState<QuizzesPage, QuizzesBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: SafeAppBar(
        title: S.of(context).textTests,
        onRefresh: () => controller.getQuizzes(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: StreamBuilder<SafeEvent<List<QuizEntity>>>(
            stream: controller.getQuizzesController.stream,
            builder: (context, snapshot) {
              final quizzes = snapshot.data?.data;
              return SafeLayout(
                snapshot: snapshot,
                context: context,
                onDone: () {},
                onCompleted: Column(
                  children: List.generate(
                    quizzes?.length ?? 0,
                    (index) => QuizWidget(quiz: quizzes?[index]),
                  ),
                ),
              ).build;
            },
          ),
        ),
      ),
    );
  }
}
