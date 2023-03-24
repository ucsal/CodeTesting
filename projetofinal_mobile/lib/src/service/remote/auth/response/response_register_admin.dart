import 'package:projetofinal_mobile/src/service/model/perfil_model.dart';

class ResponseRegister {
  int? id;
  String? name;
  String? user;
  String? password;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<ResponseRegisterAdminPerfil>? profiles;

  ResponseRegister({
    this.id,
    this.name,
    this.user,
    this.password,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.profiles,
  });

  factory ResponseRegister.fromJson(dynamic json) {
    return ResponseRegister(
      id: json["id"],
      name: json["nome"],
      user: json["login"],
      password: json["senha"],
      isActive: json["flagAtivo"],
      createdAt: json["dataCriacao"],
      updatedAt: json["dataUltimoAcesso"],
      profiles: List<ResponseRegisterAdminPerfil>.from(
        json["perfil"].map((x) => ResponseRegisterAdminPerfil.fromJson(x)),
      ),
    );
  }
}

class ResponseRegisterAdminPerfil extends Perfil {
  ResponseRegisterAdminPerfil({
    int? id,
    String? name,
    String? authority,
  }) : super(
          id: id,
          name: name,
          authority: authority,
        );

  factory ResponseRegisterAdminPerfil.fromJson(dynamic json) {
    return ResponseRegisterAdminPerfil(
      id: json['id'],
      name: json['nome'],
      authority: json['authority'],
    );
  }
}
