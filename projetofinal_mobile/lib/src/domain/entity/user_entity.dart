import 'package:projetofinal_mobile/src/domain/entity/role_entity.dart';
import 'package:projetofinal_mobile/src/service/model/usuario_model.dart';

class UserEntity {
  int? id;
  String? name;

  String? user;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<RoleEntity>? roles;

  UserEntity({
    this.id,
    this.name,
    this.user,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.roles,
  });

  factory UserEntity.toEntity(Usuario? response) {
    return UserEntity(
      id: response?.id,
      name: response?.name,
      user: response?.user,
      isActive: response?.isActive,
      createdAt: response?.createdAt,
      updatedAt: response?.updatedAt,
      roles: response?.profiles?.map((e) => RoleEntity.toEntity(e)).toList(),
    );
  }
}
