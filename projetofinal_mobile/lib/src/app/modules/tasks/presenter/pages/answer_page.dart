import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/bloc/answer_bloc.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/widgets/result_widget.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/config/safe_layout.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';
import 'package:projetofinal_mobile/src/domain/entity/answer_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_highlight/themes/monokai-sublime.dart';
// ignore: depend_on_referenced_packages
import 'package:highlight/languages/java.dart';
import 'package:projetofinal_mobile/src/domain/entity/result_entity.dart';

class AnswerPage extends StatefulWidget {
  static const route = '/answer';
  final AnswerEntity answer;
  const AnswerPage({super.key, required this.answer});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends ModularState<AnswerPage, AnswerBloc> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
    controller.getResult(widget.answer.id);
    _codeController = CodeController(
      text: widget.answer.code ?? StringConstants.empty,
      language: java,
      theme: monokaiSublimeTheme,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          widget.answer.user?.name ?? S.current.textAnswer,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
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
              CodeField(
                controller: _codeController!,
                enabled: false,
              ),
              const SizedBox(height: 20),
              StreamBuilder<SafeEvent<ResultEntity>>(
                stream: controller.getResultController.stream,
                builder: (context, snapshot) {
                  final result = snapshot.data?.data;
                  return SafeLayout(
                    snapshot: snapshot,
                    context: context,
                    onDone: () {},
                    onCompleted: ResultWidget(result: result),
                  ).build;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
