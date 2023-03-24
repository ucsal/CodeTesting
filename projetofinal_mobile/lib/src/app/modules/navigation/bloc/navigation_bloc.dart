import 'dart:async';
import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/src/core/interfaces/safe_bloc.dart';

class NavigationBloc extends SafeBloC {
  final pageController = PageController();

  NavigationBloc() {
    init();
  }

  @override
  Future<void> init() async {}

  @override
  Future<void> dispose() async {
    pageController.dispose();
  }
}
