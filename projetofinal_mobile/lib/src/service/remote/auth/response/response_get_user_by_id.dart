import 'package:projetofinal_mobile/src/service/model/perfil_model.dart';
import 'package:projetofinal_mobile/src/service/model/usuario_model.dart';

class ResponseGetUserById extends Usuario {
  ResponseGetUserById({
    String? user,
    String? password,
    int? id,
    String? name,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
    List<Perfil>? profiles,
  }) : super(
          id: id,
          name: name,
          user: user,
          isActive: isActive,
          createdAt: createdAt,
          updatedAt: updatedAt,
          profiles: profiles,
        );

  factory ResponseGetUserById.fromJson(dynamic json) {
    return ResponseGetUserById(
      id: json['id'],
      name: json['nome'],
      user: json['login'],
      password: json['senha'],
      isActive: json['flagAtivo'],
      createdAt: json['dataCriacao'],
      updatedAt: json['dataUltimoAcesso'],
      profiles: (json['perfil'] as List)
          .map((i) => ResponseGetUserByIdPerfil.fromJson(i))
          .toList(),
    );
  }
}

class ResponseGetUserByIdPerfil extends Perfil {
  ResponseGetUserByIdPerfil({
    int? id,
    String? name,
    String? authority,
  }) : super(
          id: id,
          name: name,
          authority: authority,
        );

  factory ResponseGetUserByIdPerfil.fromJson(dynamic json) {
    return ResponseGetUserByIdPerfil(
      id: json['id'],
      name: json['nome'],
      authority: json['authority'],
    );
  }
}
