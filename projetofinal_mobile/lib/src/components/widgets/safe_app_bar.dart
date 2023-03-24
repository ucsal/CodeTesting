import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';

class SafeAppBar extends StatelessWidget with PreferredSizeWidget {
  final void Function() onRefresh;
  final List<Widget>? actions;
  final String title;
  const SafeAppBar({
    Key? key,
    required this.onRefresh,
    required this.title,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: SafeColors.generalColors.background,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, top: 20),
        child: Text(
          title,
          style: TextStyles.headline1(
            color: SafeColors.generalColors.secondary,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 20),
          child: GestureDetector(
            onTap: onRefresh,
            child: Icon(
              Icons.refresh,
              color: SafeColors.generalColors.secondary,
              size: 30,
            ),
          ),
        ),
        ...actions ?? [],
      ],
    );
  }
}
