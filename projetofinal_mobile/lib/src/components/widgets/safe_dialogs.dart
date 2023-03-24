import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';

///O [SafeDialog] é um widget responsável por gerenciar e armazenar variádos
///tipos de dialogs.
class SafeDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final Function()? onTap;
  const SafeDialog({
    Key? key,
    this.title,
    this.message,
    this.onTap,
  }) : super(key: key);

  Widget error() {
    return this;
  }

  Widget show() {
    return this;
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return _mountAndroidDialog();
    } else {
      return _mountIOSDialog();
    }
  }

  Widget _mountAndroidDialog() {
    return AlertDialog(
      backgroundColor: SafeColors.generalColors.background,
      title: Text(
        title ?? S.current.errorSomethingWentWrong,
        style: TextStyles.subtitle1(),
      ),
      content: Text(message ?? S.current.errorTryAgain),
      actions: <Widget>[
        TextButton(
          onPressed: onTap ?? () => Modular.to.canPop(),
          child: Text(
            S.current.textOk,
            style: TextStyles.button(),
          ),
        )
      ],
    );
  }

  Widget _mountIOSDialog() {
    return CupertinoAlertDialog(
      title: Text(
        title ?? S.current.errorSomethingWentWrong,
        style: TextStyles.subtitle1(),
      ),
      content: Text(message ?? S.current.errorTryAgain),
      actions: <Widget>[
        TextButton(
          onPressed: onTap ?? () => Modular.to.canPop(),
          child: Text(S.current.textOk),
        )
      ],
    );
  }
}
