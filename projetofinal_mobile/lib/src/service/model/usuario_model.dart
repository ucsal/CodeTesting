import 'package:projetofinal_mobile/src/service/model/perfil_model.dart';

class Usuario {
  int? id;
  String? name;
  String? user;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<Perfil>? profiles;

  Usuario({
    this.id,
    this.name,
    this.user,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.profiles,
  });
}
