import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/bloc/send_answer_bloc.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/config/safe_layout.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/tasks/requests/request_send_task.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_highlight/themes/monokai-sublime.dart';
// ignore: depend_on_referenced_packages
import 'package:highlight/languages/java.dart';

class SendAnswerPage extends StatefulWidget {
  static const route = '/sendAnswer';

  final RequestSendTask taskInfo;

  const SendAnswerPage({
    super.key,
    required this.taskInfo,
  });

  @override
  State<SendAnswerPage> createState() => _SendAnswerPageState();
}

class _SendAnswerPageState
    extends ModularState<SendAnswerPage, SendAnswerBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
    _codeController = CodeController(
      text: '''public class Main {
        public static void main(String[] args) {

        }
    }''',
      language: java,
      theme: monokaiSublimeTheme,
      onChange: (value) => setState(() {
        controller.code.text = value;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          S.current.textAnswer,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () => controller.sendAnswer(
              userId: widget.taskInfo.userId,
              code: controller.code.text,
              quizId: widget.taskInfo.quizId,
              taskId: widget.taskInfo.taskId,
            ),
            child: Text(
              S.current.textSubmit,
              style: TextStyles.button(
                color: SafeColors.generalColors.white,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder<SafeEvent<AnswerEntity>>(
        stream: controller.sendAnswerController.stream,
        initialData: SafeEvent.initial(),
        builder: (context, snapshot) {
          final result = snapshot.data?.data;
          return SafeLayout(
            snapshot: snapshot,
            context: context,
            onDone: () => Modular.to.pop(result),
            onInitial: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: CodeField(
                  controller: _codeController!,
                  enabled: true,
                ),
              ),
            ),
          ).build;
        },
      ),
    );
  }
}
