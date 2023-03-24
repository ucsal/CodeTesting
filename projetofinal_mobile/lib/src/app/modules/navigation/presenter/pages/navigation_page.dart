import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projetofinal_mobile/src/app/modules/profile/presenter/pages/profile_page.dart';
import 'package:projetofinal_mobile/src/app/modules/quizzes/presenter/pages/quizzes_page.dart';
import 'package:projetofinal_mobile/src/app/modules/tasks/presenter/pages/tasks_page.dart';
import 'package:projetofinal_mobile/src/app/modules/navigation/bloc/navigation_bloc.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/generated/l10n.dart';
import 'package:projetofinal_mobile/src/core/util/safe_log_util.dart';

class NavigationPage extends StatefulWidget {
  static const route = '/app';
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState
    extends ModularState<NavigationPage, NavigationBloc> {
  int _selectedPage = 0;

  final itens = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.home_work),
      activeIcon: const Icon(Icons.home_work),
      label: S.current.textTasks,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.quiz),
      activeIcon: const Icon(Icons.quiz),
      label: S.current.textTests,
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.person),
      activeIcon: const Icon(Icons.person),
      label: S.current.textProfile,
    ),
  ];

  @override
  void initState() {
    super.initState();
    SafeLogUtil.instance.route(Modular.to.path);
  }

  @override
  void dispose() {
    _selectedPage = 0;
    super.dispose();
  }

  void navigateToPage(int index) {
    if (index != _selectedPage) {
      if (index == 0) {
        Modular.to.navigate(NavigationPage.route + TasksPage.route);
      }
      if (index == 1) {
        Modular.to.navigate(NavigationPage.route + QuizzesPage.route);
      }
      if (index == 2) {
        Modular.to.navigate(NavigationPage.route + ProfilePage.route);
      }
      _selectedPage = index;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RouterOutlet(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (index) => navigateToPage(index),
        unselectedLabelStyle: TextStyles.label(
          color: SafeColors.buttonColors.primary,
        ),
        selectedLabelStyle: TextStyles.label(
          color: SafeColors.buttonColors.primary,
          fontWeight: FontWeight.bold,
        ),
        elevation: 15,
        showUnselectedLabels: false,
        items: itens,
      ),
    );
  }
}
