import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/src/components/config/safe_event.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_dialogs.dart';
import 'package:projetofinal_mobile/src/components/widgets/safe_loading.dart';

class SafeLayout {
  final AsyncSnapshot<SafeEvent<dynamic>> snapshot;
  final BuildContext context;
  final void Function() onDone;
  final bool showErrorDialog;
  final Widget onLoading;
  final Widget onError;
  final Widget onCompleted;
  final Widget onEmpty;
  final Widget onInitial;

  SafeLayout({
    required this.snapshot,
    required this.context,
    required this.onDone,
    this.onCompleted = const SizedBox.shrink(),
    this.showErrorDialog = true,
    this.onLoading = const SafeLoading(),
    this.onEmpty = const SizedBox.shrink(),
    this.onInitial = const SizedBox.shrink(),
    this.onError = const SizedBox.shrink(),
  });

  Widget get build {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return onInitial;
      case ConnectionState.waiting:
        return _onWaiting();
      case ConnectionState.active:
        return _onDone();
      case ConnectionState.done:
        return _onDone();
      default:
        return onInitial;
    }
  }

  Widget _onWaiting() {
    if (snapshot.data?.status == Status.initial) {
      return onInitial;
    } else {
      return onLoading;
    }
  }

  Widget _onDone() {
    if (snapshot.hasError) {
      onDone();
      if (showErrorDialog) {
        Future.delayed(Duration.zero, () async {
          showDialog(
            context: context,
            builder: (context) => SafeDialog(
              message: snapshot.error.toString(),
              onTap: () => Navigator.pop(context),
            ).error(),
          );
        });
      }
      return onError;
    } else {
      switch (snapshot.data?.status) {
        case Status.initial:
          return onInitial;
        case Status.loading:
          return onLoading;
        case Status.done:
          onDone();
          if (_checkIfListIsNotEmpty() || _checkIfDataIsNotEmpty()) {
            return onCompleted;
          }
          return onEmpty;
        default:
          return onInitial;
      }
    }
  }

  bool _checkIfListIsNotEmpty() {
    if (snapshot.data?.data is List) {
      if (snapshot.data?.data.isNotEmpty) return false;
    }
    return true;
  }

  bool _checkIfDataIsNotEmpty() {
    return snapshot.data?.data != null;
  }
}
