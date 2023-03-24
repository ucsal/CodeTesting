import 'package:projetofinal_mobile/src/service/model/perfil_model.dart';

class RoleEntity {
  int? id;
  String? name;
  String? authority;

  RoleEntity({
    this.id,
    this.name,
    this.authority,
  });

  factory RoleEntity.toEntity(Perfil? response) {
    return RoleEntity(
      id: response?.id,
      name: response?.name,
      authority: response?.authority,
    );
  }
}
