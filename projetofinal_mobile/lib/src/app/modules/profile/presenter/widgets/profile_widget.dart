import 'package:flutter/material.dart';
import 'package:projetofinal_mobile/src/components/style/colors/safe_colors.dart';
import 'package:projetofinal_mobile/src/components/style/text/text_styles.dart';
import 'package:projetofinal_mobile/src/core/constants/string_constants.dart';
import 'package:projetofinal_mobile/src/domain/entity/user_entity.dart';
import 'package:projetofinal_mobile/src/domain/use_case/do_register_use_case.dart';

class ProfileWidget extends StatelessWidget {
  final UserEntity? user;
  const ProfileWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final userRole = user?.roles?.first.name;
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor:
                SafeColors.generalColors.secondary.withOpacity(0.2),
            child: Icon(
              Icons.person,
              size: 50,
              color: SafeColors.generalColors.secondary,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                user?.name ?? StringConstants.empty,
                style: TextStyles.headline2(
                  color: SafeColors.generalColors.secondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 5),
              _buildRole(userRole),
            ],
          ),
          Text(
            user?.user != null
                ? (StringConstants.at + (user?.user ?? StringConstants.empty))
                : StringConstants.empty,
            style: TextStyles.bodyText1(
              color: SafeColors.generalColors.secondary,
            ).copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildRole(String? role) {
    if (role == RoleEnum.admin.value) {
      return Icon(
        Icons.verified,
        color: SafeColors.statusColors.success,
      );
    } else if (role == RoleEnum.teacher.value) {
      return Icon(
        Icons.school,
        color: SafeColors.statusColors.success,
      );
    } else if (role == RoleEnum.student.value) {
      return Icon(
        Icons.book,
        color: SafeColors.statusColors.success,
      );
    }
    return const SizedBox.shrink();
  }
}
