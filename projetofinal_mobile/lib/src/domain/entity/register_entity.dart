import 'package:projetofinal_mobile/src/domain/entity/role_entity.dart';
import 'package:projetofinal_mobile/src/service/remote/auth/response/response_register_admin.dart';

class RegisterEntity {
  int? id;
  String? name;
  String? user;
  String? password;
  bool? isActive;
  List<RoleEntity>? roles;

  RegisterEntity({
    this.id,
    this.name,
    this.user,
    this.password,
    this.isActive,
    this.roles,
  });

  factory RegisterEntity.toEntity(ResponseRegister? response) {
    return RegisterEntity(
      id: response?.id,
      name: response?.name,
      user: response?.user,
      password: response?.password,
      isActive: response?.isActive,
      roles: response?.profiles
          ?.map((e) => RoleEntity.toEntity(e))
          .toList()
          .cast<RoleEntity>(),
    );
  }
}
